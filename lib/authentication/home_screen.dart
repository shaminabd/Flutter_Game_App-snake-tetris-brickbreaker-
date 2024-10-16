import 'auth/auth_service.dart';
import 'auth/login_screen.dart';
import 'widgets/button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/l10n/localization.dart';


class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key});

  @override
  Widget build(BuildContext context) {
    final auth = AuthService();
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
                  AppLocalizations.of(context).welcomeUser, // Localized welcome message
                  style: TextStyle(
                    fontSize: 40,
                    fontWeight: FontWeight.w500,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 50),
                CustomButton(
                  label: AppLocalizations.of(context).signOut, // Localized sign out button label
                  onPressed: () async {
                    await auth.signOut();
                    goToLogin(context);
                  },
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
}
