// ignore_for_file: use_build_context_synchronously

import 'package:CRM/utils/colors.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:trinetra/request/request.dart';

class AddBuissness extends StatelessWidget {
  const AddBuissness({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController nameController = TextEditingController();
    TextEditingController gstController = TextEditingController();
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text("Add Buissness")),
        backgroundColor: MyColors.blue,
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(color: MyColors.cream),
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Container(
              height: MediaQuery.of(context).size.height * 0.8,
              alignment: Alignment.center,
              child: Center(
                  child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextFormField(
                    controller: nameController,
                    decoration: const InputDecoration(
                        labelText: "Buissness Name",
                        hintText: "Enter the name of the Buissness"),
                    cursorColor: MyColors.mustard,
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  TextFormField(
                    controller: gstController,
                    decoration: const InputDecoration(
                      labelText: "Buissness GstNo",
                      hintText: "Enter the GstNo of the buissness",
                    ),
                    cursorColor: MyColors.mustard,
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  ElevatedButton(
                    onPressed: () async {
                      var token =
                          await FirebaseAuth.instance.currentUser?.getIdToken();
                      var data = await Request()
                          .send("POST", "/buissness/create", body: {
                        "buissnessName": nameController.text,
                        "buissnessGstNo": gstController.text,
                      }, headers: {
                        "Content-type": "application/json",
                        "Accept": "application/json",
                        "authorization": "Bearer $token",
                      });
                      print(data.data);
                      Navigator.pushReplacementNamed(context, "/home");
                    },
                    style: ElevatedButton.styleFrom(
                        backgroundColor: MyColors.mustard),
                    child: const Text(
                      "Add Expense",
                      style: TextStyle(color: Colors.black, fontSize: 15),
                    ),
                  )
                ],
              )),
            ),
          ),
        ),
      ),
    );
  }
}
