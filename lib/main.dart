// ignore_for_file: use_key_in_widget_constructors
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'Screens/GetStated/GetStated.dart';
import 'Screens/SignupScreen/SignupScreen.dart';
import 'Screens/SplashScreens/splash.dart';
import 'Screens/home/home.dart';
import 'firebase_options.dart';
import 'Screens/login/login.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      color: Colors.indigo[900],
      initialRoute: '/splash',
      routes: {
        '/splash': (context) => const SplashScreen(),
        '/GetStated':(context) => const GetStated(),
        '/login': (context) => const LoginScreen(),
        '/login/signup':(context) => const SignupScreen(),


        '/home': (context) => Home(),
      },
    );
  }
}
