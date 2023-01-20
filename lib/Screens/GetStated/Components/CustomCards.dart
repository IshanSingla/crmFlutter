import 'package:flutter/material.dart';

class CustomCards extends StatelessWidget {
  final Widget child;
  const CustomCards({
    Key? key,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RotatedBox(
      quarterTurns: 9,
      child: Container(
        color: Colors.white,
        child: Center(
          child: child,
        ),
      ),
    );
  }
}
