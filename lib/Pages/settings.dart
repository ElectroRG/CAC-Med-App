import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Settings extends StatelessWidget {
  const Settings({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: const Color(0xFFB9D1EA),
        child: Container(
          color: Color(0xFF185A87),
          child: CupertinoButton(
          child: Center(child: const Text('Log out')),
          onPressed: () async {
            _signOut();
            print('logged out');
            Navigator.pushNamed(context, '/splash');
          },
                ),
        ),
      )
    );
  }

  Future<void> _signOut() async {
    await FirebaseAuth.instance.signOut();
  }
}
