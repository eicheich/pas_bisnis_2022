import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
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
                if (FirebaseAuth.instance.currentUser == null) {
                  FirebaseAuth.instance.signInAnonymously();
                } else {
                  FirebaseAuth.instance.signOut();
                }
              },
              child: Text('logout')
            )
          ],
        ),
      ),
    );
  }
}
