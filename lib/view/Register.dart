import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:pas_bisnis_2022/view/Login.dart';
import 'package:pas_bisnis_2022/view/Navigation.dart';

import '../shared/Share.dart';

class Register extends StatefulWidget {
  const Register({Key? key}) : super(key: key);

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _usernameController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      padding: EdgeInsets.only(top: 159, left: 24, right: 24),
      child: Column(
        children: [
          Container(
            alignment: Alignment.bottomLeft,
            child: Text(
              'JOIN US',
              textAlign: TextAlign.left,
              style: TextStyle(
                  color: Color.fromRGBO(24, 23, 19, 1),
                  fontFamily: 'Lexend',
                  fontSize: 50,
                  letterSpacing:
                      0 /*percentages not used in flutter. defaulting to zero*/,
                  fontWeight: FontWeight.bold,
                  height: 1),
            ),
          ),
          Container(
              padding: EdgeInsets.only(top: 52),
              alignment: Alignment.topLeft,
              child: Stack(
                children: [
                  Row(
                    children: [
                      Text(
                        'Become a Ufee Member',
                        style: TextStyle(
                            color:
                                Color.fromRGBO(24, 23, 19, 0.800000011920929),
                            fontFamily: 'Lexend',
                            fontSize: 19,
                            letterSpacing:
                                0 /*percentages not used in flutter. defaulting to zero*/,
                            fontWeight: FontWeight.normal,
                            height: 1),
                      ),
                    ],
                  ),
                ],
              )),
          SizedBox(
            height: 22,
          ),
          SharedCode().textFieldUi('Username', false, _usernameController),
          SizedBox(
            height: 22,
          ),
          SharedCode().textFieldUi('Email', false, _emailController),
          SizedBox(
            height: 22,
          ),
          SharedCode().textFieldUi('Password', true, _passwordController),
          SizedBox(
            height: 22,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(
                'Already a Member? ',
                style: TextStyle(
                    color: Color.fromRGBO(24, 23, 19, 0.800000011920929),
                    fontFamily: 'Lexend',
                    fontSize: 16,
                    letterSpacing: 0,
                    fontWeight: FontWeight.normal,
                    height: 1),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Login()));
                },
                child: new Text(
                  'Login',
                  style: TextStyle(
                      decoration: TextDecoration.underline,
                      color: Color.fromRGBO(24, 23, 19, 0.800000011920929),
                      fontFamily: 'Lexend',
                      fontSize: 16,
                      letterSpacing:
                          0 /*percentages not used in flutter. defaulting to zero*/,
                      fontWeight: FontWeight.normal,
                      height: 1),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 73,
          ),
          InkWell(
            onTap: () async {
              try {
                UserCredential userCredential = await FirebaseAuth.instance
                    .createUserWithEmailAndPassword(
                        email: _emailController.text,
                        password: _passwordController.text);
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => Navigation()));
              } on FirebaseAuthException catch (e) {
                if (e.code == 'weak-password') {
                  showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: Text('Weak password'),
                          content: Text('The password provided is too weak.'),
                          actions: [
                            TextButton(
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                              child: Text('OK'),
                            ),
                          ],
                        );
                      });
                } else if (e.code == 'email-already-in-use') {
                  showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: Text('Email already in use'),
                          content: Text(
                              'The account already exists for that email.'),
                          actions: [
                            TextButton(
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                              child: Text('OK'),
                            ),
                          ],
                        );
                      });
                }
              } catch (e) {
                print(e);
              }
            },
            child: SharedCode().buttonUi('Join Us'),
          ),
        ],
      ),
    ));
  }
}
