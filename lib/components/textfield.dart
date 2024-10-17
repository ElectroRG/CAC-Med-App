import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyCupertinoTextField extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final bool obscureText;

  const MyCupertinoTextField({
    super.key,
    required this.controller,
    required this.hintText,
    required this.obscureText,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25),
      child: CupertinoTextField(
        controller: controller,
        obscureText: obscureText,
        placeholder: hintText, // Set placeholder to an empty string to remove it
        padding: EdgeInsets.symmetric(vertical: 15, horizontal: 10), // Padding inside the text field
        decoration: BoxDecoration(
          color: Colors.white, // Background color
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: Colors.white), // Border when disabled
        ),
        // Remove prefix if you don't want any text in the text field
        // Alternatively, if you want to keep a hint style, you can customize it differently.
        // Example: If you want to keep an icon instead of text, you could do this:
      ),
    );
  }
}


