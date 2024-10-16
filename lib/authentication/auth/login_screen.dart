import 'package:flutter/material.dart';
import 'dart:developer';
import 'auth_service.dart';
import 'signup_screen.dart';
import 'package:flutter_application_1/authentication/home_screen.dart';
import 'package:flutter_application_1/authentication/widgets/button.dart';
import 'package:flutter_application_1/l10n/localization.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _auth = AuthService();
  final _email = TextEditingController();
  final _password = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    _email.dispose();
    _password.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final localizations = AppLocalizations.of(context);

    return Scaffold(
      body: Stack(
        children: [
          // Background photo
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/background.png'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          // Content
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(height: 50),
                Row(
                  children: [
                    IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: const Icon(Icons.arrow_back),
                      color: Colors.white,
                    ),
                  ],
                ),
                const Spacer(),
                Text(
                  localizations.login,
                  style: const TextStyle(
                    fontSize: 40,
                    fontWeight: FontWeight.w500,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 50),
                TextField(
                  controller: _email,
                  style: const TextStyle(color: Colors.white),
                  decoration: InputDecoration(
                    hintText: localizations.enterEmail,
                    hintStyle: const TextStyle(color: Colors.white70),
                    filled: true,
                    fillColor: Colors.purple.shade800,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide.none,
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                TextField(
                  controller: _password,
                  obscureText: true,
                  style: const TextStyle(color: Colors.white),
                  decoration: InputDecoration(
                    hintText: localizations.enterPassword,
                    hintStyle: const TextStyle(color: Colors.white70),
                    filled: true,
                    fillColor: Colors.purple.shade800,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide.none,
                    ),
                  ),
                ),
                const SizedBox(height: 30),
                CustomButton(
                  label: localizations.login,
                  onPressed: _login,
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () => goToSignup(context),
                  child: Text(
                    localizations.signup,
                    style: const TextStyle(color: Colors.white),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.purple,
                    foregroundColor: Colors.white,
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
                const Spacer(),
              ],
            ),
          ),
        ],
      ),
    );
  }

  goToSignup(BuildContext context) => Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const SignupScreen()),
      );

  goToHome(BuildContext context) => Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const HomeScreen()),
      );

  _login() async {
    final user = await _auth.loginUserWithEmailAndPassword(
      _email.text,
      _password.text,
    );

    if (user != null) {
      log("User Logged In");
      goToHome(context);
    }
  }
}
