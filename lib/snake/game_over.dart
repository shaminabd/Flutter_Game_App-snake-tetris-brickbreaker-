import 'package:flutter/material.dart';
import 'package:flutter_application_1/snake/game_page.dart';
import 'package:flutter_application_1/gradient_button.dart';
import 'package:flutter_application_1/l10n/localization.dart';

class GameOver extends StatelessWidget {
  final int score;

  const GameOver({
    required this.score, // Marking score as required
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final localizations = AppLocalizations.of(context);

    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        color: Colors.purple,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Center( // Center the text
              child: Text(
                localizations.gameOver,
                textAlign: TextAlign.center, // Center the text horizontally
                style: TextStyle(
                  color: Colors.yellow,
                  fontSize: 50.0,
                  fontWeight: FontWeight.bold,
                  fontStyle: FontStyle.italic,
                  fontFamily: 'PixelifySans', // Use the custom font
                  shadows: [
                    Shadow(
                      // bottomLeft
                      offset: Offset(-1.5, -1.5),
                      color: Colors.black,
                    ),
                    Shadow(
                      // bottomRight
                      offset: Offset(1.5, -1.5),
                      color: Colors.black,
                    ),
                    Shadow(
                      // topRight
                      offset: Offset(1.5, 1.5),
                      color: Colors.black,
                    ),
                    Shadow(
                      // topLeft
                      offset: Offset(-1.5, 1.5),
                      color: Colors.black,
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 50.0),
            Text(
              '${localizations.yourScore}: $score',
              style: TextStyle(
                color: Colors.white,
                fontSize: 20.0,
                fontFamily: 'PixelifySans', // Use the custom font
              ),
            ),
            SizedBox(height: 50.0),
            SizedBox(
              height: 60.0,
              child: GradientButton(
                text: localizations.tryAgain,
                onPressed: () {
                  Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => GamePage()));
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
