// ignore_for_file: file_names, library_private_types_in_public_api

import 'package:flutter/material.dart';

import 'Components/CustomCards.dart';

class GetStated extends StatefulWidget {
  const GetStated({Key? key}) : super(key: key);

  @override
  _GetStatedState createState() => _GetStatedState();
}

class _GetStatedState extends State<GetStated> {
  var index = 0;
  late FixedExtentScrollController controller;
  var children = [
    const CustomCards(
      child: Text("hi"),
    ),
    const CustomCards(
      child: Text("hi"),
    )
  ];

  @override
  void initState() {
    super.initState();
    controller = FixedExtentScrollController(initialItem: index);
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Get Started'),
      ),
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/background.png"),
            fit: BoxFit.cover,
          ),
        ),
        child: RotatedBox(
          quarterTurns: 3,
          child: ListWheelScrollView(
            controller: controller,
            itemExtent: 350,
            physics: const FixedExtentScrollPhysics(),
            onSelectedItemChanged: (value) {
              setState(() {
                index = value;
              });
            },
            children: children,
          ),
        ),
      ),
      persistentFooterButtons: [
        TextButton(
          onPressed: () {
            controller.animateToItem(controller.selectedItem - 1,
                duration: const Duration(milliseconds: 500),
                curve: Curves.easeInOut);
          },
          child: const Text("Back"),
        ),
        TextButton(
          onPressed: () {
            if (index == children.length - 1) {
              Navigator.pushNamed(context, '/login');
            } else {
              controller.animateToItem(controller.selectedItem + 1,
                  duration: const Duration(milliseconds: 500),
                  curve: Curves.easeInOut);
            }
          },
          child: Text(index == children.length - 1 ? "Finish" : "Next"),
        ),
      ],
    );
  }
}
