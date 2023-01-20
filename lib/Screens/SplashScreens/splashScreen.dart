import 'package:CRM/Screens/login/login2.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';

class splashScreen extends StatelessWidget {
  const splashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
      child: AnimatedSplashScreen(
        nextScreen: loginString2(),
        splash: Image.asset("assets/images/logo.png"),
      ),
    );
  }
}
