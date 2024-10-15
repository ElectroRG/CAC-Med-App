import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  final String buttonText;
  Function()? onTap;

  MyButton({
    super.key,
    required this.onTap,
    required this.buttonText,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(17.5),
        margin: EdgeInsets.symmetric(horizontal: 25),
        decoration: BoxDecoration(
          color: Color(0xFF185A87),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Center(
          child: Text(
            buttonText,
            style: TextStyle(
              color: Colors.white,
              fontSize: 15,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
