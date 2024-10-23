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
      width: 340,
      child: CupertinoButton(
        onPressed: onTap,
        color: const Color.fromRGBO(24, 90, 135, 100),
        padding: EdgeInsets.symmetric(vertical: 17.5),
        borderRadius: BorderRadius.circular(22),
        child: Text(
          buttonText,
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 18.0,
            decoration: TextDecoration.none,
          ),
        ),
      ),
    );
  }
}


