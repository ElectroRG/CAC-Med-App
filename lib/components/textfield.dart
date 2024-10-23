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
        placeholder: hintText,
        padding: EdgeInsets.symmetric(vertical: 15, horizontal: 10),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: Colors.white),
        ),
      ),
    );
  }
}


