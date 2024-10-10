import 'package:cac_med_app/AppBars/appbarMedShop.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Medshop extends StatelessWidget {
  const Medshop({super.key});

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: Appbar1(
        height: 170,
      ),
      backgroundColor: const Color.fromRGBO(185, 209, 234, 1),
      child: Container(

      )
    );
  }
}