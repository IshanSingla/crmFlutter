// ignore_for_file: library_private_types_in_public_api, sort_child_properties_last

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:trinetra/request/request.dart';

import '../../utils/colors.dart';



class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController phoneController = TextEditingController();
  TextEditingController otpController = TextEditingController();

  FirebaseAuth auth = FirebaseAuth.instance;
  bool otpVisibility = false;
  User? user;
  String verificationID = "";

  @override
  Widget build(BuildContext context) {
    double deviceHeightr = MediaQuery.of(context).size.height / 100;
    double deviceWidthr = MediaQuery.of(context).size.width / 100;
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
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
                        controller: phoneController,

                        decoration: const InputDecoration(
                          labelText: "Phone Number",
                          hintText: "Enter Phone Number",
                          prefix: Padding(
                            padding: EdgeInsets.all(4),
                            child: Text('+91'),
                          ),
                        ),
                        maxLength: 10,
                        keyboardType: TextInputType.phone,
                      ),
                      Visibility(
                        child: TextField(
                          controller: otpController,
                          decoration: const InputDecoration(
                              labelText: "OTP", hintText: "Enter OTP"),
                          maxLength: 6,
                          keyboardType: TextInputType.number,
                        ),
                        visible: otpVisibility,
                      ),
                      SizedBox(height: 5 * deviceHeightr),
                      ElevatedButton(
                        onPressed: () {
                          if (otpVisibility) {
                            verifyOTP();
                          } else {
                            loginWithPhone();
                          }
                        },
                        style: ElevatedButton.styleFrom(
                            backgroundColor: MyColors.mustard),
                        child: Text(
                          otpVisibility ? "Verify" : "Send Otp",
                          style: const TextStyle(color: Colors.black),
                        ),
                      ),
                    ])),
              ),
            ),
          ),
        ),
      ),
    );
  }

  void loginWithPhone() async {
    print("Login with Phone ${phoneController.text}");
    auth.verifyPhoneNumber(
      phoneNumber: "+91${phoneController.text}",
      verificationCompleted: (PhoneAuthCredential credential) async {
        await auth.signInWithCredential(credential).then((value) {
          Fluttertoast.showToast(
            msg: "You are logged in successfully",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.green,
            textColor: Colors.white,
            fontSize: 16.0,
          );
        });
      },
      verificationFailed: (FirebaseAuthException e) {
        Fluttertoast.showToast(
          msg: e.message.toString(),
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.white70,
          textColor: Colors.black,
          fontSize: 16.0,
        );
      },
      codeSent: (String verificationId, int? resendToken) {
        setState(() {
          otpVisibility = true;
          verificationID = verificationId;
          Fluttertoast.showToast(
            msg: "Verification Code Send",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.white70,
            textColor: Colors.black,
            fontSize: 16.0,
          );
        });
      },
      codeAutoRetrievalTimeout: (String verificationId) {},
    );
  }

  void verifyOTP() async {
    print("Verify OTP");
    PhoneAuthCredential credential = PhoneAuthProvider.credential(
        verificationId: verificationID, smsCode: otpController.text);

    await auth.signInWithCredential(credential).then(
      (value) {
        setState(() {
          user = FirebaseAuth.instance.currentUser;
        });
      },
    ).whenComplete(
      () async {
        if (user != null) {
          print(user);

          if (user?.displayName == null) {
            Navigator.pushReplacementNamed(context, "/login/signup");
          } else {
            var token = await FirebaseAuth.instance.currentUser?.getIdToken();
            var data = await Request().send("POST", "/auth/get", headers: {
              "Content-type": "application/json",
              "Accept": "application/json",
              "authorization": "Bearer $token",
            });
            if (data.statusCode == 200) {
              Fluttertoast.showToast(
                msg: "You are logged in successfully",
                toastLength: Toast.LENGTH_SHORT,
                gravity: ToastGravity.BOTTOM,
                timeInSecForIosWeb: 1,
                backgroundColor: Colors.green,
                textColor: Colors.white,
                fontSize: 16.0,
              );
              Navigator.pushReplacementNamed(context, "/home");
            } else {
              Fluttertoast.showToast(
                msg: data.data["message"],
                toastLength: Toast.LENGTH_SHORT,
                gravity: ToastGravity.BOTTOM,
                timeInSecForIosWeb: 1,
                backgroundColor: Colors.red,
                textColor: Colors.white,
                fontSize: 16.0,
              );
              Navigator.pushReplacementNamed(context, "/login/signup");
            }
          }
        } else {
          Fluttertoast.showToast(
            msg: "your login is failed",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.red,
            textColor: Colors.white,
            fontSize: 16.0,
          );
        }
      },
    );
  }
}
