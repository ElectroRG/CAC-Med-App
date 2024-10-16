import 'package:cac_med_app/Pages/home.dart';
import 'package:cac_med_app/Pages/home_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import '../pages/login_page.dart';

class AuthPage extends StatelessWidget {
  const AuthPage({super.key});

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      child: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            // Show a loading indicator while checking auth state
            return Center(child: CupertinoActivityIndicator());
          } else if (snapshot.hasError) {
            // Handle any errors that occur
            return Center(child: Text('Error: ${snapshot.error}', style: TextStyle(color: CupertinoColors.systemRed)));
          } else if (snapshot.hasData) {
            // User is signed in
            return Home_two(); // Ensure Home_two is styled with Cupertino widgets
          } else {
            // User is not signed in
            return Login(); // Ensure Login is styled with Cupertino widgets
          }
        },
      ),
    );
  }
}

