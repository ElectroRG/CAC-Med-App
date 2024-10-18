import 'package:cac_med_app/Pages/home_page.dart';
import 'package:cac_med_app/components/textfield.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:cac_med_app/components/textfield.dart';

class Registration extends StatefulWidget {
  const Registration({super.key});

  @override
  State<Registration> createState() => _RegistrationState();
}

class _RegistrationState extends State<Registration> {
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  bool isChecked = false; // State for checkbox

  bool isLoginValid() {
    bool isEmailValid = EmailValidator.validate(emailController.text.trim(), true, true);

    RegExp passwordRegex = RegExp(r'^(?=.*?[A-Z])(?=.*?[0-9]).{6,}$');
    bool isPasswordValid = passwordRegex.hasMatch(passwordController.text.trim());

    print("HIIII");

    return isEmailValid && isPasswordValid && isChecked;
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
            const SizedBox(height: 25),
            MyCupertinoTextField(
              controller: emailController,
              hintText: 'Email',
              obscureText: false,
            ),
            const SizedBox(height: 30),
            MyCupertinoTextField(
              controller: passwordController,
              hintText: 'Password',
              obscureText: true,
            ),
            const SizedBox(height: 10),

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
                        isChecked = !isChecked; // Update checkbox state
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

            const SizedBox(height: 10),

            SizedBox(
              width: 250,
              height: 55,
              child: CupertinoButton(
                onPressed: isLoginValid() ? () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => Homepage(),
                          ),
                        );
                        SystemChannels.textInput.invokeMethod('TextInput.hide');
                      }
                      : null,
                color: CupertinoColors.activeBlue,
                disabledColor: CupertinoColors.systemGrey,
                child: Text(
                  'Sign Up',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),

            const SizedBox(height: 30),

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
