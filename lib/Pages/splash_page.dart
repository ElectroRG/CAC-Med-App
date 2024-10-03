import 'package:flutter/material.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Container(
      width: screenWidth,
      height: screenHeight,
      clipBehavior: Clip.antiAlias,
      decoration: const BoxDecoration(color: Color(0xFFB9D1EA)),
      child: Stack(
        children: [
          Positioned(
            left: screenWidth * 0.025,
            top: screenHeight * 0.027,
            child: Container(
              width: screenWidth * 0.95,
              height: screenHeight * 0.82,
              padding: EdgeInsets.only(
                top: screenHeight * 0.085,
                right: screenWidth * 0.8,
                bottom: screenHeight * 0.62,
              ),
              clipBehavior: Clip.antiAlias,
              decoration: ShapeDecoration(
                color: const Color(0xFFACABFF),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(32),
                ),
                shadows: const [
                  BoxShadow(
                    color: Color(0x3F000000),
                    blurRadius: 4,
                    offset: Offset(1, 1),
                    spreadRadius: 3,
                  ),
                ],
              ),
              child: Column(
                children: [
                  Container(
                    width: double.infinity,
                    height: screenHeight * 0.12,
                    clipBehavior: Clip.antiAlias,
                    decoration: const BoxDecoration(),
                    child: Row(
                      children: [
                        Container(
                          width: screenWidth * 0.25,
                          height: screenHeight * 0.12,
                          clipBehavior: Clip.antiAlias,
                          decoration: const BoxDecoration(),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            left: screenWidth * 0.028,
            top: screenHeight * 0.026,
            child: Container(
              width: screenWidth * 0.95,
              height: screenHeight * 0.82,
              padding: EdgeInsets.only(
                top: screenHeight * 0.085,
                right: screenWidth * 0.8,
                bottom: screenHeight * 0.62,
              ),
              clipBehavior: Clip.antiAlias,
              decoration: ShapeDecoration(
                color: const Color(0xFF6795C5),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(32),
                ),
                shadows: const [
                  BoxShadow(
                    color: Color(0x3F000000),
                    blurRadius: 4,
                    offset: Offset(1, 1),
                    spreadRadius: 3,
                  ),
                ],
              ),
              child: Column(
                children: [
                  Container(
                    width: double.infinity,
                    height: screenHeight * 0.12,
                    clipBehavior: Clip.antiAlias,
                    decoration: const BoxDecoration(),
                    child: Row(
                      children: [
                        Container(
                          width: screenWidth * 0.25,
                          height: screenHeight * 0.12,
                          clipBehavior: Clip.antiAlias,
                          decoration: const BoxDecoration(),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            left: screenWidth * 0.05,
            top: screenHeight * 0.59,
            child: Container(
              height: screenHeight * 0.06,
              padding: EdgeInsets.symmetric(
                vertical: screenHeight * 0.02,
                horizontal: screenWidth * 0.1,
              ),
              decoration: ShapeDecoration(
                color: const Color(0xFF175986),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(28),
                ),
                shadows: const [
                  BoxShadow(
                    color: Color(0x3F000000),
                    blurRadius: 4,
                    offset: Offset(0, 3),
                    spreadRadius: 0,
                  ),
                ],
              ),
              child: const Text(
                'Continue with Google',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
          Positioned(
            left: screenWidth * 0.05,
            top: screenHeight * 0.66,
            child: Container(
              height: screenHeight * 0.06,
              padding: EdgeInsets.symmetric(
                vertical: screenHeight * 0.02,
                horizontal: screenWidth * 0.1,
              ),
              decoration: ShapeDecoration(
                color: const Color(0xFF2374AB),
                shape: RoundedRectangleBorder(
                  side: const BorderSide(width: 1, color: Color(0xFFD8DADC)),
                  borderRadius: BorderRadius.circular(28),
                ),
                shadows: const [
                  BoxShadow(
                    color: Color(0x3F000000),
                    blurRadius: 4,
                    offset: Offset(0, -2),
                    spreadRadius: 0,
                  ),
                  BoxShadow(
                    color: Color(0x3F000000),
                    blurRadius: 4,
                    offset: Offset(0, 2),
                    spreadRadius: 0,
                  ),
                ],
              ),
              child: const Text(
                'Continue with Apple',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
          Positioned(
            left: screenWidth * 0.05,
            top: screenHeight * 0.73,
            child: Container(
              height: screenHeight * 0.06,
              padding: EdgeInsets.symmetric(
                vertical: screenHeight * 0.02,
                horizontal: screenWidth * 0.1,
              ),
              decoration: ShapeDecoration(
                color: const Color(0xFF175986),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(28),
                ),
                shadows: const [
                  BoxShadow(
                    color: Color(0x3F000000),
                    blurRadius: 4,
                    offset: Offset(0, -3),
                    spreadRadius: 0,
                  ),
                ],
              ),
              child: const Text(
                'Continue with Email',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
          Positioned(
            left: screenWidth * 0.2,
            top: screenHeight * 0.9,
            child: Text.rich(
              TextSpan(
                children: [
                  TextSpan(
                    text: 'Already have an account?',
                    style: TextStyle(
                      color: Colors.black.withOpacity(0.7),
                      fontSize: 14,
                    ),
                  ),
                  const TextSpan(
                    text: ' ',
                  ),
                  const TextSpan(
                    text: 'Log in',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      decoration: TextDecoration.underline,
                    ),
                  ),
                ],
              ),
            ),
          ),
          const Positioned(
            left: 37,
            top: 385,
            child: SizedBox(
              width: 319,
              height: 88,
              child: Stack(
                children: [
                  Positioned(
                    left: 42,
                    top: 0,
                    child: Text(
                      'Explore the app',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 30,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w700,
                        letterSpacing: -0.30,
                      ),
                    ),
                  ),
                  Positioned(
                    left: 0,
                    top: 48,
                    child: SizedBox(
                      width: 319,
                      child: Text(
                        'Now your health is in one place and always under control',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
