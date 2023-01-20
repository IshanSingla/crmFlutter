// ignore_for_file: library_private_types_in_public_api, non_constant_identifier_names, use_build_context_synchronously
import 'dart:convert';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:trinetra/request/request.dart';
import 'Components/custom_textformfield.dart';
// import 'package:http/http.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({Key? key}) : super(key: key);
  @override
  _SignupScreenState createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  var index = 0;
  final _formKey = GlobalKey<FormState>();
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();
  TextEditingController userGenderController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    User? user = FirebaseAuth.instance.currentUser;

    phoneNumberController.text = user?.phoneNumber ?? "";
    userGenderController.text = "";
    Map userAddress = {
      "sNo": "",
      "address": "",
      "district": "",
      "city": "",
      "state": "",
      "region": "",
      "pin": "",
      "country": "",
      "directions": "",
    };

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
          controller: nameController,
          hintText: "Name",
          icon: Icons.person,
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Please enter some text';
            }
            return null;
          },
        ),
        CustomTextFromField(
          controller: emailController,
          hintText: "Email",
          icon: Icons.email,
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Please enter some text';
            }

            return null;
          },
        ),
        CustomTextFromField(
          controller: userGenderController,
          hintText: "Gender",
          icon: Icons.person,
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Please enter some text';
            }

            return null;
          },
        ),
      ],
      //   [
      //     const Padding(
      //       padding: EdgeInsets.all(40.0),
      //       child: Text(
      //         'Address',
      //         style: TextStyle(
      //             fontFamily: 'RobotoMono',
      //             color: Colors.blue,
      //             fontSize: 30,
      //             fontWeight: FontWeight.bold),
      //       ),
      //     ),
      //     CustomTextFromField(
      //       hintText: "Address",
      //       icon: Icons.location_city,
      //       validator: (value) {
      //         setState(() {
      //           userAddress["address"] = value;
      //         });

      //         return null;
      //       },
      //     ),
      //     CustomTextFromField(
      //       hintText: "District",
      //       icon: Icons.location_city,
      //       validator: (value) {
      //         setState(() {
      //           userAddress["district"] = value;
      //         });

      //         return null;
      //       },
      //     ),
      //     CustomTextFromField(
      //       hintText: "City",
      //       icon: Icons.location_city,
      //       validator: (value) {
      //         setState(() {
      //           userAddress["city"] = value;
      //         });

      //         return null;
      //       },
      //     ),
      //     CustomTextFromField(
      //       hintText: "State",
      //       icon: Icons.location_city,
      //       validator: (value) {
      //         setState(() {
      //           userAddress["state"] = value;
      //         });

      //         return null;
      //       },
      //     ),
      //     CustomTextFromField(
      //       hintText: "Pin",
      //       icon: Icons.location_city,
      //       validator: (value) {
      //         setState(() {
      //           userAddress["pin"] = value;
      //         });

      //         return null;
      //       },
      //     ),
      //     CustomTextFromField(
      //       hintText: "Country",
      //       icon: Icons.location_city,
      //       validator: (value) {
      //         setState(() {
      //           userAddress["country"] = value;
      //         });

      //         return null;
      //       },
      //     ),
      //   ],
    ];
    return Scaffold(
      // body
      body: Form(
        key: _formKey,
        child: Center(child: Column(children: data[index])),
      ),

      // button
      persistentFooterButtons: [
        Visibility(
            visible: index == 0,
            child: TextButton(
              onPressed: () {
                setState(() {
                  index--;
                });
              },
              child: const Text("Back"),
            )),
        TextButton(
          onPressed: () async {
            if (index == data.length - 1) {
              var token = await FirebaseAuth.instance.currentUser?.getIdToken();
              var data = await Request().send("POST", "/auth/create", body: {
                "name": nameController.text,
                "email": emailController.text,
                "userGender": userGenderController.text,
                "phoneNumber": phoneNumberController.text,
              }, headers: {
                "Content-type": "application/json",
                "Accept": "application/json",
                "authorization": "Bearer $token",
              });
              if (data.statusCode == 200) {
                Navigator.pushReplacementNamed(context, '/home');
              } else {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(
                      "Error: ${data.data['status'] ?? "Unknown Error"}",
                    ),
                  ),
                );
                Navigator.pushReplacementNamed(context, '/login');
              }
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
