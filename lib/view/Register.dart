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
          SharedCode().textFieldUi(
            'Username',
            false,
          ),
          SizedBox(
            height: 22,
          ),
          Stack(
            children: [
              Container(
                margin: EdgeInsets.only(left: 3, top: 3),
                alignment: Alignment.topLeft,
                height: 60,
                color: Color.fromRGBO(24, 23, 19, 1),
              ),
              Container(
                padding: EdgeInsets.only(left: 19),
                child: TextField(
                  controller: _emailController,
                  // controller: controllerTF,
                  obscureText: false,
                  decoration: InputDecoration(
                    labelText: 'Email',
                    labelStyle: TextStyle(
                        fontFamily: "Lexend",
                        fontSize: 19,
                        color: Color(0xFF1B1B1B).withOpacity(0.65),
                        fontWeight: FontWeight.normal),
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                          color: Color(0xFF1B1B1B).withOpacity(0.65)),
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                          color: Color(0xFF1B1B1B).withOpacity(0.65)),
                    ),
                  ),
                ),
                margin: EdgeInsets.only(
                  right: 3,
                ),
                alignment: Alignment.bottomRight,
                height: 60,
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Color.fromRGBO(24, 23, 19, 1),
                    width: 1,
                  ),
                  color: Color.fromRGBO(255, 255, 255, 1),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 22,
          ),
          Stack(
            children: [
              Container(
                margin: EdgeInsets.only(left: 3, top: 3),
                alignment: Alignment.topLeft,
                height: 60,
                color: Color.fromRGBO(24, 23, 19, 1),
              ),
              Container(
                padding: EdgeInsets.only(left: 19),
                child: TextField(
                  controller: _passwordController,
                  // controller: controllerTF,
                  obscureText: true,
                  decoration: InputDecoration(
                    labelText: 'Password',
                    labelStyle: TextStyle(
                        fontFamily: "Lexend",
                        fontSize: 19,
                        color: Color(0xFF1B1B1B).withOpacity(0.65),
                        fontWeight: FontWeight.normal),
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                          color: Color(0xFF1B1B1B).withOpacity(0.65)),
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                          color: Color(0xFF1B1B1B).withOpacity(0.65)),
                    ),
                  ),
                ),
                margin: EdgeInsets.only(
                  right: 3,
                ),
                alignment: Alignment.bottomRight,
                height: 60,
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Color.fromRGBO(24, 23, 19, 1),
                    width: 1,
                  ),
                  color: Color.fromRGBO(255, 255, 255, 1),
                ),
              ),
            ],
          ),
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
                    letterSpacing:
                        0 /*percentages not used in flutter. defaulting to zero*/,
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
              await FirebaseAuth.instance.createUserWithEmailAndPassword(
                  email: _emailController.text,
                  password: _passwordController.text);

              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => Login()));
            },
            child: SharedCode().buttonUi('Join Us'),
          ),
        ],
      ),
    ));
  }
}
