import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        color: const Color.fromRGBO(185, 209, 234, 1),
        child: Column(mainAxisAlignment: MainAxisAlignment.start, children: [
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
                children: [Container()],
              ),
            ),
          ),
        ]));
  }
}
