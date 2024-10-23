import 'package:flutter/material.dart';

class SquareTile extends StatelessWidget {
  final String imagePath;
  final Function()? onTap;
  final String? label; // Optional label for the tile
  final EdgeInsetsGeometry padding; // Configurable padding

  const SquareTile({
    super.key,
    required this.imagePath,
    required this.onTap,
    this.label,
    this.padding = const EdgeInsets.symmetric(vertical: 15, horizontal: 15), // Default padding
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 340, // Set a specific width for the button
        padding: padding,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          color: Color(0xFF185A87), // Background color
          boxShadow: [
            BoxShadow(
              color: Colors.black26,
              blurRadius: 4,
              offset: Offset(0, 2), // Shadow position
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start, // Align items to the start
          children: [
            // Image on the left
            SizedBox(
              width: 30, // Set a fixed width for the image
              child: Image.asset(
                imagePath,
                fit: BoxFit.contain, // Adjusts the image size to fit
                errorBuilder: (context, error, stackTrace) {
                  return Icon(Icons.error, color: Colors.red); // Error handling for image
                },
              ),
            ),
            SizedBox(width: 10), // Space between the image and the label
            Expanded( // Allow the label to take up remaining space
              child: label != null
                  ? Text(
                label!,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.left,
              )
                  : Container(), // Empty container if label is not provided
            ),
          ],
        ),
      ),
    );
  }
}

