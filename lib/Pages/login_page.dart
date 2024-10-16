import 'package:cac_med_app/components/MyButton.dart';
import 'package:cac_med_app/components/squaretiles.dart';
import 'package:cac_med_app/services/auth_service.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cac_med_app/components/textfield.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  bool isLoading = false;

  void signUserIn() async {
    setState(() => isLoading = true);

    try {
      final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: usernameController.text.trim(),
        password: passwordController.text.trim(),
      );
      print("Login successful! User: ${credential.user?.email}");
      // Navigate to home page
      // Navigator.pushReplacementNamed(context, '/home');
    } on FirebaseAuthException catch (e) {
      String errorMessage;
      if (e.code == 'user-not-found') {
        errorMessage = 'No user found for that email.';
      } else if (e.code == 'wrong-password') {
        errorMessage = 'Wrong password provided.';
      } else {
        errorMessage = 'An unexpected error occurred.';
      }
      _showErrorSnackBar(errorMessage);
    } catch (e) {
      _showErrorSnackBar('An error occurred. Please try again.');
    } finally {
      setState(() => isLoading = false);
    }
  }

  void _showErrorSnackBar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message)),
    );
  }

  @override
  void dispose() {
    usernameController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      backgroundColor: const Color(0xFFB9D1EA),
      child: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(height: 175),
              _buildHeader(),
              const SizedBox(height: 30),
              _buildCupertinoTextField(usernameController, 'Username', false),
              const SizedBox(height: 30),
              _buildCupertinoTextField(passwordController, 'Password', true),
              const SizedBox(height: 10),
              _buildForgotPassword(),
              const SizedBox(height: 20),
              isLoading
                  ? const CupertinoActivityIndicator()
                  : MyButton(onTap: signUserIn, buttonText: 'Log in'),
              const SizedBox(height: 50),
              _buildDividerWithText('Or Continue With'),
              const SizedBox(height: 75),
              _buildSocialLogin(),
              const SizedBox(height: 75),
              _buildRegisterNow(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: const [
          Text(
            "Log in",
            style: TextStyle(
              color: Colors.black,
              fontSize: 30,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCupertinoTextField(
      TextEditingController controller, String placeholder, bool obscureText) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25),
      child: CupertinoTextField(
        controller: controller,
        placeholder: placeholder,
        obscureText: obscureText,
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8),
        ),
      ),
    );
  }

  Widget _buildForgotPassword() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          GestureDetector(
            onTap: () {
              // Navigator.pushNamed(context, '/forgot-password');
            },
            child: const Text(
              'Forgot Password?',
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDividerWithText(String text) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25.0),
      child: Row(
        children: [
          const Expanded(
            child: Divider(thickness: 0.5, color: Colors.white),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: Text(text),
          ),
          const Expanded(
            child: Divider(thickness: 0.5, color: Colors.white),
          ),
        ],
      ),
    );
  }

  Widget _buildSocialLogin() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SquareTile(
          onTap: () => AuthService().signInWithGoogle(),
          imagePath: 'lib/images/Apple.png',
        ),
      ],
    );
  }

  Widget _buildRegisterNow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text(
          'New User?',
          style: TextStyle(color: Colors.black),
        ),
        const SizedBox(width: 4),
        GestureDetector(
          onTap: () {
            // Navigator.pushNamed(context, '/register');
          },
          child: const Text(
            'Register Now',
            style: TextStyle(
              color: CupertinoColors.activeBlue,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
    );
  }
}


