import 'package:cac_med_app/Medstore/med_shop_page.dart';
import 'package:cac_med_app/Pages/Doctor_chat.dart';
import 'package:cac_med_app/Pages/auth_page.dart';
import 'package:cac_med_app/Pages/chatbot_page.dart';
import 'package:cac_med_app/Pages/home.dart';
// import 'package:cac_med_app/Pages/home_page.dart';
//import 'package:cac_med_app/Pages/home_page.dart';
import 'package:cac_med_app/Pages/registration_page.dart';
import 'package:cac_med_app/Pages/splash_page.dart';
import 'package:cac_med_app/navigation_menu.dart';
//import 'package:cac_med_app/pages/splash_page.dart';
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
    return MaterialApp(
      title: 'Med App',
      home: Home_two(),
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/home': (context) => Home_two(),
        '/registration': (context) => Registration(),
        '/auth': (context) => AuthPage(),
        '/medshop': (context) => Medshop(),
        '/homepage': (context) => Home_two(),
        '/aichat': (context) => Chatbot(),
        '/doctchat': (context) => DoctorChat(),
      },
      onGenerateRoute: _generateRoute,
    );
  }
  Route _generateRoute(RouteSettings settings) {
    Widget page;
    switch (settings.name) {
      case '/home':
        page = Home_two();
        break;
      case '/registration':
        page = Registration();
        break;
      case '/auth':
        page = AuthPage();
        break;
      case '/medshop':
        page = Medshop();
        break;
      case '/homepage':
        page = Home_two();
        break;
      case '/aichat':
        page = Chatbot();
        break;
      case '/doctchat':
        page = DoctorChat();
        break;
      case '/navmenu':
        page = NavigationMenu();
        break;
      default:
        page = Scaffold(
          body: Center(
            child: Text('No route defined for ${settings.name}'),
          ),
        );
    }
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => page,
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        const begin = Offset(0.0, 1.0); // From bottom to top
        const end = Offset.zero; // End at normal position
        const curve = Curves.ease;

        var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

        return SlideTransition(
          position: animation.drive(tween),
          child: child,
        );
      },
    );
  }
}
