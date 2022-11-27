import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:pas_bisnis_2022/shared/Share.dart';
import 'package:pas_bisnis_2022/view/Cart.dart';
import 'package:pas_bisnis_2022/view/Navigation.dart';
import 'package:pas_bisnis_2022/view/Register.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
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
                'LOGIN',
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
                          'Not a Member? ',
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
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Register()));
                          },
                          child: new Text(
                            'Join Us',
                            style: TextStyle(
                                decoration: TextDecoration.underline,
                                color: Color.fromRGBO(
                                    24, 23, 19, 0.800000011920929),
                                fontFamily: 'Lexend',
                                fontSize: 19,
                                letterSpacing:
                                    0 /*percentages not used in flutter. defaulting to zero*/,
                                fontWeight: FontWeight.normal,
                                height: 1),
                          ),
                        ),
                      ],
                    ),
                  ],
                )),
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
            Container(
              alignment: Alignment.topRight,
              child: GestureDetector(
                onTap: () {},
                child: new Text(
                  'Forgotten your password?',
                  style: TextStyle(
                      color: Color.fromRGBO(24, 23, 19, 0.800000011920929),
                      fontFamily: 'Lexend',
                      fontSize: 16,
                      letterSpacing:
                          0 /*percentages not used in flutter. defaulting to zero*/,
                      fontWeight: FontWeight.normal,
                      height: 1),
                ),
              ),
            ),
            SizedBox(
              height: 120,
            ),
            InkWell(
              onTap: () async {
                try {
                  await FirebaseAuth.instance.signInWithEmailAndPassword(
                      email: _emailController.text,
                      password: _passwordController.text);
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Navigation()));
                } on FirebaseAuthException catch (e) {
                  if (e.code == 'user-not-found') {
                    showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            title: Text('Wrong Email'),
                            content: Text('No user found for that email.'),
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
                  } else if (e.code == 'wrong-password') {
                    showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            title: Text('Wrong Password'),
                            content:
                                Text('Wrong password provided for that user.'),
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
                }
              },
              child: SharedCode().buttonUi('Login'),
            ),

            SizedBox(
              height: 22,
            ),

            GestureDetector(
              onTap: () {
                FirebaseAuth.instance.signInAnonymously();
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => Navigation()));
              },
              child: new Text(
                'Skip for now',
                style: TextStyle(
                    // decoration: TextDecoration.underline,
                    color: Color.fromRGBO(24, 23, 19, 0.800000011920929),
                    fontFamily: 'Lexend',
                    fontSize: 16,
                    letterSpacing:
                        0 /*percentages not used in flutter. defaulting to zero*/,
                    fontWeight: FontWeight.normal,
                    height: 1),
              ),
            ),

            //  INI ENGINE SKIP FOR NOW
            // ElevatedButton(
            //     onPressed: () {
            //       // login as annymous firebase
            // FirebaseAuth.instance.signInAnonymously();
            //     },
            //     child: Text('Skip for now'))
          ],
        ),
      ),
    );
  }
}
