// ignore_for_file: use_key_in_widget_constructors
// import 'package:CRM/Screens/login/login2.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:trinetra/request/request.dart';
import 'Screens/Buissness/Dashboard/Dashboard.dart';
import 'Screens/GetStated/GetStated.dart';
import 'Screens/SignupScreen/SignupScreen.dart';
import 'Screens/SplashScreens/splash.dart';
import 'Screens/home/AddBuissness.dart';
import 'Screens/home/home.dart';
import 'firebase_options.dart';
import 'Screens/login/login.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  Request.initicalize(url: "crmbackend-exos.onrender.com", ssl: true);
  runApp(MyApp());
}

String buissnessId = "";

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      color: Colors.indigo[900],
      initialRoute: '/splash',
      routes: {
        '/splash': (context) => const SplashScreen(),
        '/GetStated': (context) => const GetStated(),
        '/login': (context) => const LoginScreen(),
        '/login/signup': (context) => const SignupScreen(),
        '/home': (context) => const Home(),
        "/buissness/Add": (context) => const AddBuissness(),
        "/buissness/dashbord": (context) => Dashboard(buissnessId: buissnessId),
      },
    );
  }
}
