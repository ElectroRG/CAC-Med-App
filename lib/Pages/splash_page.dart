import 'package:cac_med_app/components/carousel.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final List<String> urls = [
      'assets/Symptoms.png',
      'assets/Medshop.png',
      'assets/HealthMetrics.png'
    ];

    return Container(
      color: const Color.fromRGBO(185, 209, 234, 1),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 80.0),
            child: Container(
              height: size.height - 325,
              width: size.width - 25,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(32),
                color: const Color.fromRGBO(103, 150, 198, 100),
                boxShadow: const [
                  BoxShadow(
                      color: Color.fromRGBO(0, 0, 0, 0.35),
                      spreadRadius: 3,
                      blurRadius: 3,
                      offset: Offset(3, 0))
                ],
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Carousel(urls: urls),
                  Padding(
                    padding: const EdgeInsets.only(top: 12, bottom: 6),
                    child: FittedBox(
                      fit: BoxFit.scaleDown,
                      child: Text(
                        'Explore the app',
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontFamily: GoogleFonts.comfortaa().fontFamily,
                            fontSize: 30.0,
                            decoration: TextDecoration.none),
                      ),
                    ),
                  ),
                  Text(
                    'All your health needs in one place',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontFamily: GoogleFonts.dmSans().fontFamily,
                        decoration: TextDecoration.none),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  //sign in options
                  Padding(
                    padding: const EdgeInsets.only(bottom: 10),
                    child: GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context, '/registration');
                      },
                      child: Container(
                        width: 353,
                        height: 60,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(28),
                          color: const Color.fromRGBO(24, 90, 135, 100),
                          boxShadow: const [
                            BoxShadow(
                                color: Color.fromRGBO(0, 0, 0, 0.15),
                                spreadRadius: 3,
                                blurRadius: 3,
                                offset: Offset(2, 0))
                          ],
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 5),
                              child: Text(
                                'Sign up with Google',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18.0,
                                  decoration: TextDecoration.none,
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(right: 9),
                              child: Image.network(
                                'https://cdn4.iconfinder.com/data/icons/logos-brands-7/512/google_logo-google_icongoogle-512.png',
                                color: Colors.black,
                                height: 30,
                                width: 30,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 10, bottom: 10),
                    child: GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context, '/registration');
                      },
                      child: Container(
                        width: 353,
                        height: 60,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(28),
                            color: const Color.fromRGBO(24, 90, 135, 100),
                            boxShadow: const [
                              BoxShadow(
                                  color: Color.fromRGBO(0, 0, 0, 0.15),
                                  spreadRadius: 3,
                                  blurRadius: 3,
                                  offset: Offset(2, 0))
                            ]),
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(left: 5),
                                child: Text(
                                  'Sign up with Apple',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18.0,
                                    decoration: TextDecoration.none,
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(right: 5),
                                child: Image.network(
                                  'https://images.vexels.com/content/129234/preview/apple-logo-icon-bf9728.png',
                                  color: Colors.black,
                                  height: 30,
                                  width: 30,
                                ),
                              )
                            ]),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 15),
                    child: GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context, '/registration');
                      },
                      child: Container(
                        width: 353,
                        height: 60,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(28),
                            color: const Color.fromRGBO(24, 90, 135, 100),
                            boxShadow: const [
                              BoxShadow(
                                  color: Color.fromRGBO(0, 0, 0, 0.15),
                                  spreadRadius: 3,
                                  blurRadius: 3,
                                  offset: Offset(2, 0))
                            ]),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 40),
                              child: Text(
                                'Sign up with Email',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18.0,
                                  decoration: TextDecoration.none,
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(right: 45),
                              child: Icon(
                                Icons.email_rounded,
                                color: Colors.black,
                                size: 30,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 100),
          RichText(
            text: TextSpan(
              text: 'Already have an account? ',
              style: const TextStyle(
                color: Colors.black,
                fontSize: 17,
              ),
              children: <TextSpan>[
                TextSpan(
                  text: 'Log in',
                  style: const TextStyle(
                    color: Color.fromRGBO(103, 150, 210, 1),
                    fontSize: 17,
                  ),
                  recognizer: TapGestureRecognizer()
                    ..onTap = () {
                      Navigator.pushNamed(context, '/auth');
                    },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
