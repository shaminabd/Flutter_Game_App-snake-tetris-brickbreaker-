import 'package:flutter/material.dart';
import 'package:flutter_application_1/authentication/auth/auth_service.dart';
import 'home_screen.dart';
import 'package:flutter_application_1/authentication/auth/login_screen.dart';

class AuthenticationWrapper extends StatelessWidget {
  const AuthenticationWrapper({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: AuthService().authStateChanges, // Assuming AuthService has an authStateChanges stream
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const CircularProgressIndicator();
        } else if (snapshot.hasData) {
          return const HomeScreen();
        } else {
          return const LoginScreen();
        }
      },
    );
  }
}
