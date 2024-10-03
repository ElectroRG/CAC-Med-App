import 'package:flutter/material.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        color: Color.fromRGBO(185, 209, 234, 100),
        child: Column(mainAxisAlignment: MainAxisAlignment.start, children: [
          Padding(
            padding: const EdgeInsets.only(top: 100.0),
            child: Container(
              height: 597,
              width: 371,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(32),
                  color: Color.fromRGBO(103, 150, 198, 100),
                  boxShadow: const [
                    BoxShadow(
                        color: Color.fromARGB(99, 42, 42, 42),
                        spreadRadius: 5,
                        blurRadius: 3,
                        offset: Offset(3, 0))
                  ]),
              child: Column(
                children: [Container()],
              ),
            ),
          ),
        ]));
  }
}
