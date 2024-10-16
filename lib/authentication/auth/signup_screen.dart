import 'dart:developer';
import 'auth_service.dart';
import 'login_screen.dart';
import 'package:flutter_application_1/authentication/home_screen.dart';
import 'package:flutter_application_1/authentication/widgets/button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/l10n/localization.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({Key? key}) : super(key: key);

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final _auth = AuthService();

  final _name = TextEditingController();
  final _email = TextEditingController();
  final _password = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    _name.dispose();
    _email.dispose();
    _password.dispose();
  }

  @override
  Widget build(BuildContext context) {
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
                      icon: Icon(Icons.arrow_back),
                      color: Colors.white,
                    ),
                  ],
                ),
                const Spacer(),
                Text(
                  AppLocalizations.of(context).signup, // Localized text for Signup
                  style: TextStyle(
                    fontSize: 40,
                    fontWeight: FontWeight.w500,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 50),
                TextField(
                  controller: _name,
                  style: TextStyle(color: Colors.white),
                  decoration: InputDecoration(
                    hintText: AppLocalizations.of(context).enterName, // Localized hint text for Name
                    hintStyle: TextStyle(color: Colors.white70),
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
                  controller: _email,
                  style: TextStyle(color: Colors.white),
                  decoration: InputDecoration(
                    hintText: AppLocalizations.of(context).enterEmail, // Localized hint text for Email
                    hintStyle: TextStyle(color: Colors.white70),
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
                  style: TextStyle(color: Colors.white),
                  decoration: InputDecoration(
                    hintText: AppLocalizations.of(context).enterPassword, // Localized hint text for Password
                    hintStyle: TextStyle(color: Colors.white70),
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
                  label: AppLocalizations.of(context).signup, // Localized label for Signup button
                  onPressed: _signup,
                ),
                const SizedBox(height: 5),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      AppLocalizations.of(context).alreadyHaveAccount, // Localized text for Already have an account
                      style: TextStyle(color: Colors.white),
                    ),
                    InkWell(
                      onTap: () => goToLogin(context),
                      child: Text(
                        AppLocalizations.of(context).login, // Localized text for Login
                        style: TextStyle(color: Colors.red),
                      ),
                    ),
                  ],
                ),
                const Spacer(),
              ],
            ),
          ),
        ],
      ),
    );
  }

  goToLogin(BuildContext context) => Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const LoginScreen()),
      );

  goToHome(BuildContext context) => Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const HomeScreen()),
      );

  _signup() async {
    final user = await _auth.createUserWithEmailAndPassword(
      _email.text,
      _password.text,
    );
    if (user != null) {
      log("User Created Successfully");
      goToHome(context);
    }
  }
}
