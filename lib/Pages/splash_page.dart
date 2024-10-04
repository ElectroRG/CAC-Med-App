import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        color: const Color.fromRGBO(185, 209, 234, 1),
        child: Column(mainAxisAlignment: MainAxisAlignment.start, children: [
          //floating page dark blue
          Padding(
            padding: const EdgeInsets.only(top: 80.0),
            child: Container(
              height: 597,
              width: 371,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(32),
                  color: const Color.fromRGBO(103, 150, 198, 100),
                  boxShadow: const [
                    BoxShadow(
                        color: Color.fromRGBO(0, 0, 0, 0.35),
                        spreadRadius: 3,
                        blurRadius: 3,
                        offset: Offset(3, 0))
                  ]),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  const Padding(
                    padding: EdgeInsets.all(16),
                    child: Text(
                      'Explore the app',
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 30.0),
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(bottom: 15),
                    child: Text(
                      'All your health needs in one place',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ),
                  //sign in options
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Container(
                      width: 353,
                      height: 54,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(28),
                          color: const Color.fromRGBO(24, 90, 135, 100)),
                      child: const Align(
                          alignment: Alignment(-0.3, 0),
                          child: Text(
                            'Sign in with Google',
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          )),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Container(
                      width: 353,
                      height: 54,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(28),
                          color: const Color.fromRGBO(24, 90, 135, 100)),
                      child: const Align(
                          alignment: Alignment(-0.3, 0),
                          child: Text(
                            'Sign in with Apple',
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          )),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Container(
                      width: 353,
                      height: 54,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(28),
                          color: const Color.fromRGBO(24, 90, 135, 100)),
                      child: const Align(
                          alignment: Alignment(-0.3, 0),
                          child: Text(
                            'Continue with Email',
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          )),
                    ),
                  )
                ],
              ),
            ),
          ),
          const Padding(
            padding: const EdgeInsets.all(60.0),
            child: Text('Already have an account? Log in'),
          )
        ]));
  }
}
