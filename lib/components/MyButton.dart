import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class MyButton extends StatelessWidget {
  final String buttonText;
  final Function()? onTap;

  const MyButton({
    super.key,
    required this.onTap,
    required this.buttonText,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 340, // Set your desired width here
      child: CupertinoButton(
        onPressed: onTap,
        color: Color(0xFF185A87), // Button color
        padding: EdgeInsets.symmetric(vertical: 17.5), // Padding
        borderRadius: BorderRadius.circular(12), // Rounded corners
        child: Text(
          buttonText,
          style: TextStyle(
            color: Colors.white,
            fontSize: 15,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}


