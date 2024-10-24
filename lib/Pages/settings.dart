import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Settings extends StatelessWidget {
  const Settings({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 70,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 16.0),
              child: Text(
                'Settings',
                style: TextStyle(
                  color: const Color(0xFF185A87),
                  fontSize: 40,
                  fontFamily: GoogleFonts.comfortaa().fontFamily,
                ),
              ),
            ),
          ],
        ),
        backgroundColor: const Color(0xFFB9D1EA),
      ),
      backgroundColor: const Color(0xFFB9D1EA),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 50.0, right: 20, left: 20),
              child: Container(
                color: const Color(0xFFB9D1EA),
                child: Container(
                  height: 55,
                  width: 350,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Color(0xFF185A87),
                  ),
                  child: CupertinoButton(
                    child: Center(
                        child: const Text(
                      'Log out',
                      style: TextStyle(color: Colors.white),
                    )),
                    onPressed: () async {
                      _signOut();
                      print('logged out');
                      Navigator.pushNamed(context, '/splash');
                    },
                  ),
                ),
              ),
            ),
            // Use Expanded or Flexible to constrain the height of ListView
            Expanded(
              child: ListView(
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.all(16.0),
                    child: Container(
                      decoration: BoxDecoration(
                        border: Border(bottom:BorderSide())
                      ),
                      child: ListTile(
                        trailing: Icon(Icons.arrow_forward_ios),
                        title: Text('App Theme',
                        style: TextStyle(
                          fontSize: 18
                        ),),
                      ),
                    ),
                  ),
                  
                  Padding(
                    padding: EdgeInsets.all(10.0),
                    child: Container(
                      decoration:
                          BoxDecoration(border: Border(bottom: BorderSide())),
                      child: ListTile(
                        trailing: Icon(Icons.arrow_forward_ios),
                        title: Text(
                          'Privacy and Security',
                          style: TextStyle(fontSize: 18),
                        ),
                      ),
                    ),
                  ),

                  Padding(
                    padding: EdgeInsets.all(16.0),
                    child: Container(
                      decoration:
                          BoxDecoration(border: Border(bottom: BorderSide())),
                      child: ListTile(
                        trailing: Icon(Icons.arrow_forward_ios),
                        title: Text(
                          'User Information',
                          style: TextStyle(fontSize: 18),
                        ),
                      ),
                    ),
                  ),

                  Padding(
                    padding: EdgeInsets.all(16.0),
                    child: Container(
                      decoration:
                          BoxDecoration(border: Border(bottom: BorderSide())),
                      child: ListTile(
                        trailing: Icon(Icons.arrow_forward_ios),
                        title: Text(
                          'Help',
                          style: TextStyle(fontSize: 18),
                        ),
                      ),
                    ),
                  ),

                  Padding(
                    padding: EdgeInsets.all(16.0),
                    child: Container(
                      decoration:
                          BoxDecoration(border: Border(bottom: BorderSide())),
                      child: ListTile(
                        trailing: Icon(Icons.arrow_forward_ios),
                        title: Text(
                          'About',
                          style: TextStyle(fontSize: 18),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(bottom: 30),
              child: GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, '/terms');
                },
                child: Text(
                  'Terms and Conditions',
                  style: TextStyle(fontSize: 20,
                  color: Color(0xFF185A87),
                  )
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _signOut() async {
    await FirebaseAuth.instance.signOut();
  }
}
