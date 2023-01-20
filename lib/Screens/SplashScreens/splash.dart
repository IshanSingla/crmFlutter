// ignore_for_file: unnecessary_null_comparison, use_build_context_synchronously

import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 2), check); // add check function to run
  }

  void scaffold(text, context) {
    final snackBar = SnackBar(content: Text(text));
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  Future<void> check() async {
    try {
      User user = FirebaseAuth.instance.currentUser!;
      if (user.uid != null) {
        Navigator.pushReplacementNamed(context, '/home');
      } else {
        await FirebaseAuth.instance.signOut();
        // scaffold("Error! Please Login Again", context);
        Navigator.pushReplacementNamed(context, '/GetStated');
      }
    } catch (e) {
      await FirebaseAuth.instance.signOut();
      scaffold(e.toString(), context);
      Navigator.pushReplacementNamed(context, '/GetStated');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        body: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/images/splashBg.gif"),
              fit: BoxFit.fill,
            ),
          ),
          child: Center(
              child: Container(
                  height: 200,
                  width: 200,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          fit: BoxFit.fill,
                          image: AssetImage("assets/images/logo.png"))))),
        ));
  }
}
