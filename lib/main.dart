import 'package:cac_med_app/Medstore/med_shop_page.dart';
import 'package:cac_med_app/Pages/chatbot_page.dart';
import 'package:cac_med_app/Pages/home_page.dart';
import 'package:cac_med_app/Pages/login_page.dart';
import 'package:cac_med_app/Pages/registration_page.dart';
import 'package:cac_med_app/Pages/splash_page.dart';
//import 'package:cac_med_app/pages/splash_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:google_generative_ai/google_generative_ai.dart';
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
