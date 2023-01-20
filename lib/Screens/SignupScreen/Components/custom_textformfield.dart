import 'package:flutter/material.dart';

class CustomTextFromField extends StatelessWidget {
  const CustomTextFromField({
    Key? key,
    required this.icon,
    required this.hintText,
    this.hideText = false,
    required this.validator,
    this.initialValue,
  }) : super(key: key);
  final IconData icon;
  final String hintText;
  final bool hideText;
  final FormFieldValidator validator;
  final String? initialValue;
  @override
  Widget build(BuildContext context) {
    var borderRadius = BorderRadius.circular(5.0);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30.0),
      child: Column(
        children: [
          TextFormField(
            initialValue: initialValue,
            obscureText: hideText,
            decoration: InputDecoration(
              labelText: hintText,
              labelStyle: const TextStyle(color: Colors.blue, fontSize: 18),
              filled: true,
              fillColor: Colors.blue.withOpacity(0.2),
              prefixIcon: Icon(
                icon,
                color: Colors.blue,
              ),
              focusedBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: Colors.blue),
                  borderRadius: borderRadius),
              enabledBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: Colors.black),
                  borderRadius: borderRadius),
              focusedErrorBorder: OutlineInputBorder(
                  borderSide:
                      const BorderSide(color: Color.fromARGB(255, 100, 0, 0)),
                  borderRadius: borderRadius),
              errorBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: Colors.red),
                  borderRadius: borderRadius),
            ),
            validator: validator,
          ),
          const SizedBox(
            height: 15.0,
          ),
        ],
      ),
    );
  }
}

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    Key? key,
    required this.icon,
    required this.hintText,
    this.hideText = false,
    required this.onPress,
  }) : super(key: key);
  final IconData icon;
  final String hintText;
  final bool hideText;
  final FormFieldValidator onPress;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 50.0),
      child: TextFormField(
        obscuringCharacter: '*',
        obscureText: hideText,
        decoration: InputDecoration(
          labelText: hintText,
          labelStyle: TextStyle(color: Colors.white, fontSize: 18),
          filled: true,
          fillColor: Colors.white.withOpacity(0.5),
          prefixIcon: Icon(
            icon,
            color: Colors.orange,
          ),
          focusedBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: Colors.transparent),
              borderRadius: BorderRadius.circular(50.0)),
          enabledBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: Colors.transparent),
              borderRadius: BorderRadius.circular(50.0)),
          focusedErrorBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: Colors.transparent),
              borderRadius: BorderRadius.circular(50.0)),
          errorBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: Colors.transparent),
              borderRadius: BorderRadius.circular(50.0)),
        ),
        validator: onPress,
      ),
    );
  }
}
