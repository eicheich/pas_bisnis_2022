import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:pas_bisnis_2022/view/Navigation.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
      ),
      body: Center(
        child: Column(
          children: [
            StreamBuilder<User?>(
              stream: FirebaseAuth.instance.userChanges(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return Text('signed in ${snapshot.data?.uid}');
                } else {
                  return const Text('No User');
                }
              },
            ),
            SizedBox(
              height: 100,
            ),
            ElevatedButton(
              onPressed: () {
                // Navigator.push(
                //   context,
                //   MaterialPageRoute(
                //     builder: (context) => const Navigation(),
                //   ),
                // );
                if (FirebaseAuth.instance.currentUser == null) {
                  FirebaseAuth.instance.signInAnonymously();
                } else {
                  FirebaseAuth.instance.signOut();
                }
              },
              child: StreamBuilder<User?>(
                stream: FirebaseAuth.instance.userChanges(),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return const Text('Sign Out');
                  } else {
                    return const Text('Sign In');
                  }
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
