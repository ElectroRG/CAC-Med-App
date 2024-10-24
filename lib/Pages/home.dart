import 'package:cac_med_app/Services/health_repository.dart';
import 'package:firebase_auth/firebase_auth.dart';
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
    Navigator.pushReplacementNamed(context, '/login');
  }

  Future<void> fetchData(HealthDataType type, int value) async {
    steps = (await healthRepository.fetchData(type, value))!;
    print('Data written to health');
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
                    style: TextStyle(
                      fontFamily: GoogleFonts.comfortaa().fontFamily,
                      fontWeight: FontWeight.w700,
                      fontSize: 30,
                      color: Color(0xFF185A87),
                    ),
                  ),
                ),
                SizedBox(width: 140),
                Align(
                  alignment: Alignment.topRight,
                  child: Padding(
                    padding: const EdgeInsets.only(right: 15.0),
                    child: Container(
                      width: 60,
                      height: 60,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(100),
                        border: Border.all(
                          color: Color(0xFF185A87),
                          width: 4,
                        ),
                        color: Theme.of(context).colorScheme.background.withOpacity(0.5),
                        boxShadow: [
                          BoxShadow(
                            color: Color(0xFF185A87),
                            spreadRadius: 0.5,
                            blurRadius: 2,
                          ),
                        ],
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          CircleAvatar(
                            radius: 25,
                            backgroundImage: NetworkImage(
                              FirebaseAuth.instance.currentUser?.photoURL ?? "https://example.com/default-profile.png",
                            ),
                            onBackgroundImageError: (_, __) {
                              print("Failed to load profile picture.");
                            },
                            child: FirebaseAuth.instance.currentUser?.photoURL == null
                                ? const Icon(Icons.person, size: 40)
                                : null,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),

            SizedBox(height: 25),

            // Steps box
            buildMetricCard('Steps', steps.toString(), 'Up 16% from yesterday', Icons.directions_walk),

            SizedBox(height: 15),

            // Row for Height and Weight
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                buildMetricCard('Height', '${height.toStringAsFixed(2)} m', '', Icons.height, width: 190),
                SizedBox(width: 15),
                buildMetricCard('Weight', '${weight.toStringAsFixed(1)} kg', 'Stable', Icons.monitor_weight, width: 145),
              ],
            ),

            SizedBox(height: 15),

            // Row for Distance Traveled and BMI
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                buildMetricCard('Distance', '${distanceTraveled.toStringAsFixed(1)} km', 'Up 10% from yesterday', Icons.directions_run, width: 140),
                SizedBox(width: 15),
                buildMetricCard('BMI', '${bmi.toStringAsFixed(1)}', 'Healthy range', Icons.accessibility_new, width: 195),
              ],
            ),

            SizedBox(height: 15),

            // Add more metrics as needed
            buildMetricCard('Other Metric', 'Value', 'Trend info', Icons.insights),

            ElevatedButton(
              onPressed: () => signUserOut(context),
              child: const Text('Logout'),
            ),
          ],
        ),
      ),
    );
  }

  // Helper method to build metric cards
  Widget buildMetricCard(String label, String value, String trend, IconData icon, {double width = 350, double height = 150}) {
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20),
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
              width: width,
              height: height,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 20),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          label,
                          style: TextStyle(
                            fontFamily: GoogleFonts.comfortaa().fontFamily,
                            fontWeight: FontWeight.w700,
                            fontSize: 20,
                            color: Color(0xFF185A87),
                          ),
                        ),
                        SizedBox(height: 10),
                        Text(
                          value,
                          style: TextStyle(
                            fontFamily: GoogleFonts.comfortaa().fontFamily,
                            fontWeight: FontWeight.w700,
                            fontSize: 20,
                            color: Color(0xFF185A87),
                          ),
                        ),
                        if (trend.isNotEmpty)
                          Text(
                            trend,
                            style: TextStyle(
                              fontFamily: GoogleFonts.comfortaa().fontFamily,
                              fontWeight: FontWeight.w400,
                              fontSize: 14,
                              color: Color(0xFF185A87),
                            ),
                          ),
                      ],
                    ),
                  ),
                  Icon(icon, size: 70, color: Color(0xFF185A87)),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
