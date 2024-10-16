import 'package:flutter/material.dart';
import 'brickhead/src/widgets/game_app.dart';
import 'l10n/localization.dart';
import 'snake/game_page.dart';
import 'tetrisgame/tetris/board.dart';
import 'gradient_button.dart';
import 'map/mappage.dart';
import 'package:flutter_application_1/authentication/auth/login_screen.dart';

class MenuPage extends StatelessWidget {
  final Function(Locale) setLocale;

  const MenuPage({
    required this.setLocale,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var localizations = AppLocalizations.of(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(
          localizations.title,
          style: const TextStyle(fontFamily: 'PixelifySans'),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.language),
            onPressed: () {
              showDialog(
                context: context,
                builder: (context) => LanguageDialog(setLocale: setLocale),
              );
            },
          ),
          IconButton(
            icon: const Icon(Icons.map), // Use a map icon
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => MapPage()), // Navigate to your MapPage
              );
            },
          ),
        ],
      ),
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/background.png'), // Ensure this path is correct
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Spacer(flex: 2),
              SizedBox(
                width: 200,
                child: GradientButton(
                  text: localizations.snake,
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) =>   GamePage()), // Ensure GamePage is correctly implemented
                    );
                  },
                ),
              ),
              const SizedBox(height: 30),
              SizedBox(
                width: 200,
                child: GradientButton(
                  text: localizations.ataribreakout,
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const GameApp()), // Ensure GameApp is correctly implemented
                    );
                  },
                ),
              ),
              const SizedBox(height: 30),
              SizedBox(
                width: 200,
                child: GradientButton(
                  text: localizations.tetris,
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const GameBoard()), // Ensure GameBoard is correctly implemented
                    );
                  },
                ),
              ),
              const SizedBox(height: 30),
              SizedBox(
                width: 200,
                child: GradientButton(
                  text: localizations.login,
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const LoginScreen()), // Ensure GameBoard is correctly implemented
                    );
                  },
                ),
              ),
              const Spacer(flex: 1),
            ],
          ),
        ),
      ),
    );
  }
}

class LanguageDialog extends StatelessWidget {
  final Function(Locale) setLocale;

  const LanguageDialog({required this.setLocale, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(
        AppLocalizations.of(context).changeLanguage,
        style: const TextStyle(fontFamily: 'VT323'),
      ),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          ListTile(
            title: const Text(
              'English',
              style: TextStyle(fontFamily: 'PixelifySans'),
            ),
            onTap: () {
              setLocale(const Locale('en'));
              Navigator.of(context, rootNavigator: true).pop();
            },
          ),
          ListTile(
            title: const Text(
              'Русский',
              style: TextStyle(fontFamily: 'PixelifySans'),
            ),
            onTap: () {
              setLocale(const Locale('ru'));
              Navigator.of(context, rootNavigator: true).pop();
            },
          ),
        ],
      ),
    );
  }
}
