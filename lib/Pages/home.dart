import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Home_two extends StatefulWidget {
  @override
  _Home_twoState createState() => _Home_twoState();
}

class _Home_twoState extends State<Home_two> {
  // Class variables for different health metrics
  int steps = 6192;
  double heightMeters = 1.75; // height in meters
  double weightKg = 70.0; // weight in kg
  double distanceKm = 5.4; // distance in kilometers
  double bmi = 22.9; // BMI calculation

  Map<String, int?> goals = {
    'Steps': null,
    'Height': null,
    'Weight': null,
    'Distance': null,
    'BMI': null,
  };

  // Conversion methods
  String metersToFeetAndInches(double meters) {
    double totalInches = meters * 39.4;
    int feet = totalInches ~/ 12;
    int inches = totalInches % 12 ~/ 1;
    return '$feet\'$inches"';
  }

  String kgToPounds(double kg) {
    double pounds = kg * 2.2;
    return '${pounds.toStringAsFixed(2)} lbs';
  }

  String kmToMiles(double km) {
    double miles = km * 0.621371;
    return '${miles.toStringAsFixed(2)} mi';
  }

  void signUserOut(BuildContext context) async {
    await FirebaseAuth.instance.signOut();
    Navigator.pushReplacementNamed(context, '/login');
  }

  Future<void> setGoal(String label) async {
    int? goal = goals[label];

    TextEditingController goalController = TextEditingController();

    // Show a dialog to input a goal
    await showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Set $label Goal'),
          content: TextField(
            controller: goalController,
            keyboardType: TextInputType.number,
            decoration: InputDecoration(hintText: 'Enter your $label goal'),
          ),
          actions: [
            TextButton(
              child: const Text('Cancel'),
              onPressed: () => Navigator.pop(context),
            ),
            TextButton(
              child: const Text('Set'),
              onPressed: () {
                setState(() {
                  goals[label] = int.tryParse(goalController.text);
                });
                Navigator.pop(context);
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
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
                      child: CircleAvatar(
                        radius: 25,
                        backgroundImage: NetworkImage(
                          FirebaseAuth.instance.currentUser?.photoURL ?? "https://example.com/default-profile.png",
                        ),
                        child: FirebaseAuth.instance.currentUser?.photoURL == null
                            ? const Icon(Icons.person, size: 40)
                            : null,
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
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                buildMetricCard('Height', metersToFeetAndInches(heightMeters), '', Icons.height, width: 145),
                buildMetricCard('Weight', kgToPounds(weightKg), 'Stable', Icons.monitor_weight, width: 175),
              ],
            ),

            SizedBox(height: 15),

            // Row for Distance Traveled and BMI
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                buildMetricCard('Distance', kmToMiles(distanceKm), 'Up 10% from yesterday', Icons.directions_run, width: 140),
                SizedBox(width: 15),
                buildMetricCard('BMI', '${bmi.toStringAsFixed(1)}', 'Healthy range', Icons.accessibility_new, width: 195),
              ],
            ),

            SizedBox(height: 15),

            // Other metric box
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
    int? goal = goals[label];
    return GestureDetector(
      onDoubleTap: () => setGoal(label),
      child: Padding(
        padding: const EdgeInsets.only(left: 15, right: 15),
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
                            goal != null ? '$value/$goal' : value,
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
                    Icon(icon, size: 60, color: Color(0xFF185A87)),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
