import 'dart:math';
import 'dart:ui';
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:pas_bisnis_2022/view/Navigation.dart';
import 'package:page_transition/page_transition.dart';
import 'package:pas_bisnis_2022/shared/Share.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
      backgroundColor: Color(0xFF1B1B1B),
      splash: Container(
        // image
        child: Image.asset('assets/images/Logo.png', height: 114, width: 203),
      ),
      nextScreen: Navigation(),
      splashTransition: SplashTransition.fadeTransition,
      duration: 4000,
    );
  }
}
