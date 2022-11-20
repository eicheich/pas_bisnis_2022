import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../view/Login.dart';
import '../view/Navigation.dart';

class Wrapper extends StatefulWidget {
  const Wrapper({Key? key}) : super(key: key);

  @override
  State<Wrapper> createState() => _WrapperState();
}

class _WrapperState extends State<Wrapper> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return const Navigation();
        } else {
          return const Login();
        }
      },
    );
  }
}
