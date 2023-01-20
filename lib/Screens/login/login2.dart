import 'package:flutter/material.dart';

class MyColors {
  static Color blue = Color.fromARGB(255, 0, 117, 176);
  static Color cream = Color.fromARGB(255, 249, 242, 237);
  static Color pink = Color.fromARGB(255, 248, 116, 116);
  static Color mustard = Color.fromARGB(255, 255, 181, 98);
}

class loginString2 extends StatefulWidget {
  const loginString2({super.key});

  @override
  State<loginString2> createState() => _loginString2State();
}

class _loginString2State extends State<loginString2> {
  final _formKey = GlobalKey<FormState>();
  void moveToHome(BuildContext context) {
    if (_formKey.currentState!.validate()) {
      Navigator.pushNamed(context, "/home");
    }
  }

  @override
  Widget build(BuildContext context) {
    double deviceHeightr = MediaQuery.of(context).size.height / 100;
    double deviceWidthr = MediaQuery.of(context).size.width / 100;
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: const BoxDecoration(
            image: DecorationImage(
                fit: BoxFit.fill,
                image: AssetImage("assets/images/bgImage.png"))),
        child: Padding(
          padding: EdgeInsets.symmetric(
              vertical: 20 * deviceHeightr, horizontal: 8 * deviceWidthr),
          child: Container(
            decoration: BoxDecoration(
                border: Border.all(width: 1, color: MyColors.mustard),
                borderRadius: BorderRadius.circular(10),
                color: Colors.white),
            child: Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: 5 * deviceWidthr, vertical: 8 * deviceHeightr),
              child: Form(
                  key: _formKey,
                  child: Column(children: [
                    Text(
                      "Welcome",
                      style: TextStyle(
                          color: MyColors.blue,
                          fontSize: 30,
                          fontWeight: FontWeight.bold),
                    ),
                    const Text("Sign in with your Phone Number"),
                    const SizedBox(height: 30),
                    TextFormField(
                      decoration: const InputDecoration(
                          labelText: "Phone Number",
                          hintText: "Enter Phone Number"),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return ("Enter Phone Number");
                        } else if (value.length != 10) {
                          return ("Enter a valid Phone Number");
                        }
                        return null;
                      },
                    ),
                    TextFormField(
                      decoration: const InputDecoration(
                          labelText: "OTP", hintText: "Enter OTP"),
                    ),
                    SizedBox(height: 5 * deviceHeightr),
                    ElevatedButton(
                      onPressed: () => moveToHome(context),
                      style: ElevatedButton.styleFrom(
                          backgroundColor: MyColors.mustard),
                      child: const Text(
                        "Sign in",
                        style: TextStyle(color: Colors.black),
                      ),
                    ),
                  ])),
            ),
          ),
        ),
      ),
    );
  }
}
