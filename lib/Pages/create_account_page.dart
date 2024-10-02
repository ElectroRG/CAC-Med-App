import 'package:flutter/material.dart';

class CreateAccount extends StatelessWidget {
  const CreateAccount({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 393,
      height: 852,
      clipBehavior: Clip.antiAlias,
      decoration: const BoxDecoration(color: Color(0xFFB9D1E9)),
      child: Stack(
        children: [
          const Positioned(
            left: 20,
            top: 145,
            child: SizedBox(
              width: 339,
              child: Text(
                'Create account',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 30,
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w700,
                  height: 0.04,
                  letterSpacing: -0.30,
                ),
              ),
            ),
          ),
          const Positioned(
            left: 52,
            top: 531,
            child: Text.rich(
              TextSpan(
                children: [
                  TextSpan(
                    text: 'I accept the ',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 14,
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.w400,
                      height: 0.09,
                    ),
                  ),
                  TextSpan(
                    text: 'terms and privacy policy',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 14,
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.w400,
                      decoration: TextDecoration.underline,
                      height: 0.09,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            left: 87,
            top: 769,
            child: Text.rich(
              TextSpan(
                children: [
                  TextSpan(
                    text: 'Already have an account? ',
                    style: TextStyle(
                      color: Colors.black.withOpacity(0.699999988079071),
                      fontSize: 14,
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.w400,
                      height: 0.09,
                    ),
                  ),
                  const TextSpan(
                    text: ' ',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 14,
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.w400,
                      height: 0.09,
                    ),
                  ),
                  const TextSpan(
                    text: 'Log in',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 14,
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.w600,
                      decoration: TextDecoration.underline,
                      height: 0.09,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            left: 20,
            top: 222,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Username',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 14,
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w400,
                    height: 0.09,
                  ),
                ),
                Container(
                  width: 353,
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 18),
                  decoration: ShapeDecoration(
                    color: Colors.white,
                    shape: RoundedRectangleBorder(
                      side: const BorderSide(width: 1, color: Color(0xFFD8DADC)),
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Expanded(
                        child: SizedBox(
                          child: Text(
                            'Your username',
                            style: TextStyle(
                              color: Colors.black.withOpacity(0.5),
                              fontSize: 16,
                              fontFamily: 'Inter',
                              fontWeight: FontWeight.w400,
                              height: 0.08,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            left: 20,
            top: 324,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Email',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 14,
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w400,
                    height: 0.09,
                  ),
                ),
                Container(
                  width: 353,
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 18),
                  decoration: ShapeDecoration(
                    color: Colors.white,
                    shape: RoundedRectangleBorder(
                      side: const BorderSide(width: 1, color: Color(0xFFD8DADC)),
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Expanded(
                        child: SizedBox(
                          child: Text(
                            'Your email',
                            style: TextStyle(
                              color: Colors.black.withOpacity(0.5),
                              fontSize: 16,
                              fontFamily: 'Inter',
                              fontWeight: FontWeight.w400,
                              height: 0.08,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            left: 20,
            top: 426,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Password',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 14,
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w400,
                    height: 0.09,
                  ),
                ),
                Container(
                  width: 353,
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 18),
                  decoration: ShapeDecoration(
                    color: Colors.white,
                    shape: RoundedRectangleBorder(
                      side: const BorderSide(width: 1, color: Color(0xFFD8DADC)),
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        width: 20,
                        height: 20,
                        padding: const EdgeInsets.only(top: 2, left: 1, right: 2, bottom: 3),
                        clipBehavior: Clip.antiAlias,
                        decoration: const BoxDecoration(),
                        child: const Row(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            SizedBox(width: 17, height: 15, child: Stack()),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            left: 36,
            top: 475,
            child: SizedBox(
              width: 76,
              height: 6,
              child: Stack(
                children: [
                  Positioned(
                    left: 0,
                    top: 0,
                    child: Container(
                      width: 6,
                      height: 6,
                      decoration: const ShapeDecoration(
                        color: Colors.black,
                        shape: OvalBorder(),
                      ),
                    ),
                  ),
                  Positioned(
                    left: 10,
                    top: 0,
                    child: Container(
                      width: 6,
                      height: 6,
                      decoration: const ShapeDecoration(
                        color: Colors.black,
                        shape: OvalBorder(),
                      ),
                    ),
                  ),
                  Positioned(
                    left: 20,
                    top: 0,
                    child: Container(
                      width: 6,
                      height: 6,
                      decoration: const ShapeDecoration(
                        color: Colors.black,
                        shape: OvalBorder(),
                      ),
                    ),
                  ),
                  Positioned(
                    left: 30,
                    top: 0,
                    child: Container(
                      width: 6,
                      height: 6,
                      decoration: const ShapeDecoration(
                        color: Colors.black,
                        shape: OvalBorder(),
                      ),
                    ),
                  ),
                  Positioned(
                    left: 40,
                    top: 0,
                    child: Container(
                      width: 6,
                      height: 6,
                      decoration: const ShapeDecoration(
                        color: Colors.black,
                        shape: OvalBorder(),
                      ),
                    ),
                  ),
                  Positioned(
                    left: 50,
                    top: 0,
                    child: Container(
                      width: 6,
                      height: 6,
                      decoration: const ShapeDecoration(
                        color: Colors.black,
                        shape: OvalBorder(),
                      ),
                    ),
                  ),
                  Positioned(
                    left: 60,
                    top: 0,
                    child: Container(
                      width: 6,
                      height: 6,
                      decoration: const ShapeDecoration(
                        color: Colors.black,
                        shape: OvalBorder(),
                      ),
                    ),
                  ),
                  Positioned(
                    left: 70,
                    top: 0,
                    child: Container(
                      width: 6,
                      height: 6,
                      decoration: const ShapeDecoration(
                        color: Colors.black,
                        shape: OvalBorder(),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          const Positioned(
            left: 20,
            top: 530,
            child: SizedBox(
              width: 20,
              height: 20,
              child: FlutterLogo(),
            ),
          ),
          Positioned(
            left: 20,
            top: 588,
            child: Container(
              width: 353,
              height: 56,
              padding: const EdgeInsets.symmetric(horizontal: 152, vertical: 17),
              decoration: ShapeDecoration(
                color: const Color(0xFF175986),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                shadows: const [
                  BoxShadow(
                    color: Color(0x3F000000),
                    blurRadius: 4,
                    offset: Offset(0, 3),
                    spreadRadius: 0,
                  )
                ],
              ),
              child: const Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'Sign Up',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.w600,
                      height: 0.08,
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