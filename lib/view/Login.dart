import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:pas_bisnis_2022/shared/Share.dart';
import 'package:pas_bisnis_2022/view/Cart.dart';
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
                                    builder: (context) => cart()));
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
            SharedCode().textFieldUi('Username', false),
            SizedBox(
              height: 22,
            ),
            SharedCode().textFieldUi('Password', true),
            SizedBox(
              height: 22,
            ),
            Container(
              alignment: Alignment.topRight,
              child: GestureDetector(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Navigation()));
                },
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
              height: 135,
            ),
            Stack(
              children: [
                Container(
                  margin: EdgeInsets.only(left: 4, top: 4),
                  alignment: Alignment.center,
                  height: 60,
                  width: 190,
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Color.fromRGBO(24, 23, 19, 1),
                      width: 1.5,
                    ),
                    color: Color.fromARGB(255, 255, 255, 255),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Navigation()));
                  },
                  child: Container(
                    alignment: Alignment.center,
                    height: 60,
                    width: 190,
                    decoration: BoxDecoration(
                      color: Color.fromARGB(255, 24, 23, 19),
                    ),
                    child: new Text(
                      'Login',
                      style: TextStyle(
                          color: Color.fromRGBO(255, 255, 255, 1),
                          fontFamily: 'Lexend',
                          fontSize: 20,
                          letterSpacing:
                              0 /*percentages not used in flutter. defaulting to zero*/,
                          fontWeight: FontWeight.normal,
                          height: 1),
                    ),
                  ),
                ),
              ],
            ),

            //  INI ENGINE SKIP FOR NOW
            // ElevatedButton(
            //     onPressed: () {
            //       // login as annymous firebase
            //       FirebaseAuth.instance.signInAnonymously();
            //     },
            //     child: Text('Skip for now'))
          ],
        ),
      ),
    );
  }
}
