import 'package:cac_med_app/Services/health_repository.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:health/health.dart';
import 'lib/Services/health_repository.dart';

class Home_two extends StatelessWidget {
  Home_two({super.key});

  // Class variables for different health metrics
  int steps = 6192;
  double height = 1.75; // height in meters
  double weight = 70.0; // weight in kg
  double distanceTraveled = 5.4; // distance in kilometers
  double bmi = 22.9; // BMI calculation

  HealthRepository healthRepository = HealthRepository();

  void signUserOut(BuildContext context) async {
    await FirebaseAuth.instance.signOut();
    // Navigate to the login screen or show a message (optional)
    Navigator.pushReplacementNamed(
        context, '/login'); // Replace with your login route
  }

  @override
  Widget build(BuildContext context) {
    healthRepository.init();
    fetchData(HealthDataType.STEPS, 6192);

    return Scaffold(
      backgroundColor: const Color(0xFFB9D1EA),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(height: 75),

            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 20.0),
                  child: Text(
                    'Summary',
                    'Summary',
                    style: TextStyle(
                      fontFamily: GoogleFonts.comfortaa().fontFamily,
                      fontWeight: FontWeight.w700,
                      fontSize: 30,
                      color: Color(0xFF185A87),
                    ),
                  ),
                ), // Correctly placed within the children list

                SizedBox(width: 140),
                Align(
                  alignment: Alignment.topRight,
                  child: Padding(
                    padding: const EdgeInsets.only(right: 15.0),
                    child: Container(
                      width: 60,
                      height: 60,
                      decoration: BoxDecoration(
                        borderRadius:
                            BorderRadius.circular(100), // Circular border
                        border: Border.all(
                          color:
                              Color(0xFF185A87), // Highlight color with opacity
                          width: 4, // Border width
                        ),
                        color: Theme.of(context)
                            .colorScheme
                            .background
                            .withOpacity(0.5), // Background color with opacity
                        boxShadow: [
                          BoxShadow(
                            color:
                                Color(0xFF185A87), // Shadow color with opacity
                            spreadRadius: 0.5,
                            blurRadius: 2,
                          ),
                        ],
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                         CupertinoButton(
                            onPressed: () {
                              Navigator.pushNamed(context, '/settings');
                            },
                            padding: EdgeInsets
                                .zero, // Remove padding for better alignment
                            child: CircleAvatar(
                              radius: 25,
                              backgroundImage:
                                  FirebaseAuth.instance.currentUser?.photoURL !=
                                          null
                                      ? NetworkImage(FirebaseAuth
                                          .instance.currentUser!.photoURL!)
                                      : null,
                              backgroundColor:
                                  Colors.grey.shade200, // Add background color
                              child:
                                  FirebaseAuth.instance.currentUser?.photoURL ==
                                          null
                                      ? const Icon(Icons.person,
                                          size: 40, color: Colors.grey)
                                      : null,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),

            SizedBox(height: 25),

            Material(
              elevation: 2,
              borderRadius: BorderRadius.circular(30.0),
              color: Color.fromRGBO(255, 255, 255, 100),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(30.0),
                child: DecoratedBox(
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Color(0xFF185A87),
                      width: 3,
                    ),
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                  child: Container(
                    width: 350,
                    height: 150,
                  ),
                ),
              ),
            ),

            SizedBox(height: 15),

            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 20),
                  child: Material(
                    elevation: 2,
                    borderRadius: BorderRadius.circular(30.0),
                    color: Color.fromRGBO(255, 255, 255, 100),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(30.0),
                      child: DecoratedBox(
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Color(0xFF185A87),
                            width: 3,
                          ),
                          borderRadius: BorderRadius.circular(30.0),
                        ),
                        child: Container(
                          width: 190,
                          height: 150,
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 15),
                Padding(
                  padding: const EdgeInsets.only(right: 20),
                  child: Material(
                    elevation: 2,
                    borderRadius: BorderRadius.circular(30.0),
                    color: Color.fromRGBO(255, 255, 255, 100),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(30.0),
                      child: DecoratedBox(
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Color(0xFF185A87),
                            width: 3,
                          ),
                          borderRadius: BorderRadius.circular(30.0),
                        ),
                        child: Container(
                          width: 145,
                          height: 150,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),


            SizedBox(height: 15),

            // Row for Distance Traveled and BMI
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 20),
                  child: Material(
                    elevation: 2,
                    borderRadius: BorderRadius.circular(30.0),
                    color: Color.fromRGBO(255, 255, 255, 100),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(30.0),
                      child: DecoratedBox(
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Color(0xFF185A87),
                            width: 3,
                          ),
                          borderRadius: BorderRadius.circular(30.0),
                        ),
                        child: Container(
                          width: 140,
                          height: 150,
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 15),
                Padding(
                  padding: const EdgeInsets.only(right: 20),
                  child: Material(
                    elevation: 2,
                    borderRadius: BorderRadius.circular(30.0),
                    color: Color.fromRGBO(255, 255, 255, 100),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(30.0),
                      child: DecoratedBox(
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Color(0xFF185A87),
                            width: 3,
                          ),
                          borderRadius: BorderRadius.circular(30.0),
                        ),
                        child: Container(
                          width: 195,
                          height: 150,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),

            SizedBox(height: 15),

            Material(
              elevation: 2,
              borderRadius: BorderRadius.circular(30.0),
              color: Color.fromRGBO(255, 255, 255, 100),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(30.0),
                child: DecoratedBox(
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Color(0xFF185A87),
                      width: 3,
                    ),
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                  child: Container(
                    width: 350,
                    height: 150,
                  ),
                ),
              ),
            ),

            SizedBox(height: 15),

            Material(
              elevation: 2,
              borderRadius: BorderRadius.circular(30.0),
              color: Color.fromRGBO(255, 255, 255, 100),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(30.0),
                child: DecoratedBox(
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Color(0xFF185A87),
                      width: 3,
                    ),
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                  child: Container(
                    width: 350,
                    height: 150,
                  ),
                ),
              ),
            ),

            ElevatedButton(
              onPressed: () => signUserOut(context), // Call signUserOut method
              child: const Text('Logout'),
            ),

            //SizedBox(height: 400),
          ],
        ),
      ),
    );
  }
}
