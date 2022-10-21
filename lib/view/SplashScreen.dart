import 'dart:math';
import 'dart:ui';
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:pas_bisnis_2022/view/Navigation.dart';
import 'package:page_transition/page_transition.dart';
import 'package:pas_bisnis_2022/shared/hexConvert.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
      splash: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.bottomCenter,
            end: Alignment.topCenter,
            colors: [
              SharedCode().convertHex("AFC7AE"),
              SharedCode().convertHex("FFFFFF"),
              SharedCode().convertHex("FFFFFF"),
              SharedCode().convertHex("FFFFFF"),
              SharedCode().convertHex("FFFFFF"),
            ],
          ),
        ),
        child: Image.asset('assets/image/Ufee.png'),
      ),
      splashIconSize: 2000,
      nextScreen: Navigation(),
      splashTransition: SplashTransition.fadeTransition,
      duration: 5000,
    );
  }
}
