import 'package:cac_med_app/components/MyButton.dart';
import 'package:cac_med_app/components/textfield.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';



class Regisration extends StatefulWidget {
  const Regisration({super.key});

  @override
  State<Regisration> createState() => _RegisrationState();
}

class _RegisrationState extends State<Regisration> {
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  bool isChecked = false; // State for checkbox

  void logUserIn() {
    // Add your login logic here
  }

  @override
  void dispose() {
    usernameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFB9D1EA),
      body: Center(
        child: Column(
          children: [
            SizedBox(height: 175),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    "Registration",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 30),
            MyTextField(
              controller: usernameController,
              hintText: 'Username',
              obscureText: false,
            ),
            const SizedBox(height: 30),
            MyTextField(
              controller: emailController,
              hintText: 'Email',
              obscureText: false,
            ),
            const SizedBox(height: 30),
            MyTextField(
              controller: passwordController,
              hintText: 'Password',
              obscureText: true,
            ),
            const SizedBox(height: 5),

            // Checkbox for accepting terms and privacy policy
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Row(
                mainAxisAlignment:
                    MainAxisAlignment.start, // Align checkbox to top
                children: [
                  Checkbox(
                    value: isChecked,
                    activeColor:
                        Color(0xFF185A87), // Color when checkbox is checked
                    checkColor: Colors.white,
                    onChanged: (value) {
                      setState(() {
                        isChecked = value ?? false; // Update checkbox state
                      });
                    },
                  ),
                  Expanded(
                    child: RichText(
                      text: TextSpan(
                        style: TextStyle(color: Colors.black, fontSize: 16),
                        children: [
                          TextSpan(text: "I accept the "),
                          TextSpan(
                            text: "terms",
                            style: TextStyle(
                              decoration:
                                  TextDecoration.underline, // Underline "terms"
                            ),
                          ),
                          TextSpan(text: " and "),
                          TextSpan(
                            text: "privacy policy",
                            style: TextStyle(
                              decoration: TextDecoration
                                  .underline, // Underline "privacy policy"
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 20),

            MyButton(
              onTap: isChecked
                  ? logUserIn
                  : null, // Disable button if checkbox is not checked
              buttonText: 'Sign Up',
            ),

            const SizedBox(height: 200),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Already have an account?',
                  style: TextStyle(color: Colors.black),
                ),
                const SizedBox(width: 4),
                Text(
                  'Log in',
                  style: TextStyle(
                    color: Colors.blue,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
