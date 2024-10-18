import 'package:cac_med_app/Pages/registration_page.dart';
//import 'package:cac_med_app/pages/splash_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Med App',
      home: Registration(),
      debugShowCheckedModeBanner: false,
    );
  }
}
