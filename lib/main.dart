import 'package:cac_med_app/Medstore/med_shop_page.dart';
import 'package:cac_med_app/Pages/auth_page.dart';
import 'package:cac_med_app/Pages/chatbot_page.dart';
import 'package:cac_med_app/Pages/login_page.dart';
import 'package:cac_med_app/Pages/registration_page.dart';
import 'package:cac_med_app/Pages/splash_page.dart';
//import 'package:cac_med_app/pages/splash_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:google_generative_ai/google_generative_ai.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const CupertinoApp(
      title: 'Flutter Demo',
      home:Login( ),
      debugShowCheckedModeBanner: false,
    );
  }
}
