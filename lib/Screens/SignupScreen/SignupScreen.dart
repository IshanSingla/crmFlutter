// ignore_for_file: library_private_types_in_public_api, non_constant_identifier_names
import 'package:flutter/material.dart';
import 'Components/custom_textformfield.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({Key? key}) : super(key: key);
  @override
  _SignupScreenState createState() => _SignupScreenState();
}

var data = [
  [
    const Padding(
      padding: EdgeInsets.all(40.0),
      child: Text(
        'Register',
        style: TextStyle(
            fontFamily: 'RobotoMono',
            color: Colors.blue,
            fontSize: 30,
            fontWeight: FontWeight.bold),
      ),
    ),
    CustomTextFromField(
        hintText: "Name",
        icon: Icons.person,
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Please enter some text';
          }
          return null;
        },
        initialValue: "Hello"),
    CustomTextFromField(
        hintText: "Email",
        icon: Icons.email,
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Please enter some text';
          }
          return null;
        },
        initialValue: "Hello"),
    CustomTextFromField(
        hintText: "Password",
        icon: Icons.lock,
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Please enter some text';
          }
          return null;
        },
        initialValue: "Hello"),
  ],
  [
    const Padding(
      padding: EdgeInsets.all(40.0),
      child: Text(
        'Register',
        style: TextStyle(
            fontFamily: 'RobotoMono',
            color: Colors.blue,
            fontSize: 30,
            fontWeight: FontWeight.bold),
      ),
    ),
    CustomTextFromField(
        hintText: "Name",
        icon: Icons.person,
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Please enter some text';
          }
          return null;
        },
        initialValue: "Hello"),
  ],
];

class _SignupScreenState extends State<SignupScreen> {
  var index = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Signup"),
      ),

      // body
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/background.png"),
            fit: BoxFit.cover,
          ),
        ),
        child: Center(child: Column(children: data[index])),
      ),

      // button
      persistentFooterButtons: [
        TextButton(
          onPressed: () {
            setState(() {
              index--;
            });
          },
          child: const Text("Back"),
        ),
        TextButton(
          onPressed: () {
            if (index == data.length - 1) {
              Navigator.pushReplacementNamed(context, '/home');
            } else {
              setState(() {
                index++;
              });
            }
          },
          child: Text(index == data.length - 1 ? "Finish" : "Next"),
        ),
      ],
    );
  }
}
