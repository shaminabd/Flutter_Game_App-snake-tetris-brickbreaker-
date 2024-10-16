import 'dart:async';
import 'dart:math';

import 'package:flutter_application_1/snake/game_over.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/l10n/localization.dart';

class GamePage extends StatefulWidget {
  @override
  _GamePageState createState() => _GamePageState();
}

class _GamePageState extends State<GamePage> with TickerProviderStateMixin {
  late int _playerScore;
  late bool _hasStarted;
  late Animation<double> _snakeAnimation;
  late AnimationController _snakeController;
  List<int> _snake = [404, 405, 406, 407];
  final int _noOfSquares = 500;
  final Duration _duration = Duration(milliseconds: 250);
  final int _squareSize = 20;
  late String _currentSnakeDirection;
  late int _snakeFoodPosition;
  Random _random = new Random();

  @override
  void initState() {
    super.initState();
    _setUpGame();
  }

  void _setUpGame() {
    _playerScore = 0;
    _currentSnakeDirection = 'RIGHT';
    _hasStarted = true;
    do {
      _snakeFoodPosition = _random.nextInt(_noOfSquares);
    } while (_snake.contains(_snakeFoodPosition));
    _snakeController = AnimationController(vsync: this, duration: _duration);
    _snakeAnimation = CurvedAnimation(curve: Curves.easeInOut, parent: _snakeController);
  }

  void _gameStart() {
    Timer.periodic(Duration(milliseconds: 250), (Timer timer) {
      _updateSnake();
      if (_hasStarted) timer.cancel();
    });
  }

  bool _gameOver() {
    for (int i = 0; i < _snake.length - 1; i++) {
      if (_snake.last == _snake[i]) return true;
    }
    return false;
  }

  void _updateSnake() {
    if (!_hasStarted) {
      setState(() {
        _playerScore = (_snake.length - 4) * 100;
        switch (_currentSnakeDirection) {
          case 'DOWN':
            if (_snake.last > _noOfSquares) _snake.add(_snake.last + _squareSize - (_noOfSquares + _squareSize));
            else _snake.add(_snake.last + _squareSize);
            break;
          case 'UP':
            if (_snake.last < _squareSize) _snake.add(_snake.last - _squareSize + (_noOfSquares + _squareSize));
            else _snake.add(_snake.last - _squareSize);
            break;
          case 'RIGHT':
            if ((_snake.last + 1) % _squareSize == 0) _snake.add(_snake.last + 1 - _squareSize);
            else _snake.add(_snake.last + 1);
            break;
          case 'LEFT':
            if ((_snake.last) % _squareSize == 0) _snake.add(_snake.last - 1 + _squareSize);
            else _snake.add(_snake.last - 1);
        }

        if (_snake.last != _snakeFoodPosition) _snake.removeAt(0);
        else {
          do {
            _snakeFoodPosition = _random.nextInt(_noOfSquares);
          } while (_snake.contains(_snakeFoodPosition));
        }

        if (_gameOver()) {
          setState(() {
            _hasStarted = !_hasStarted;
          });
          Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => GameOver(score: _playerScore)));
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final localizations = AppLocalizations.of(context);

    return Scaffold(
  appBar: AppBar(
    flexibleSpace: Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [Color(0xFF6A0DAD), Color(0xFF800000)], // Purple to maroon gradient
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
      ),
    ),
    title: Text(
      localizations.appBarTitle,
      style: TextStyle(
        color: Colors.white, // Text color changed to white
        fontSize: 20.0,
        fontFamily: 'PixelifySans', // Use the custom font
      ),
    ),
    centerTitle: false,
    actions: <Widget>[
      Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Text(
            '${localizations.score}: $_playerScore',
            style: TextStyle(
              fontSize: 16.0,
              color: Colors.white, // Text color changed to white
              fontFamily: 'PixelifySans', // Use the custom font
            ),
          ),
        ),
      ),
    ],
  ),
  floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
  floatingActionButton: Transform.scale(
    scale: 1.5, // Increase the scale of the button
    child: Container(
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [Color(0xFF6A0DAD), Color(0xFF800000)], // Purple to maroon gradient
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
        borderRadius: BorderRadius.circular(50),
      ),
      child: FloatingActionButton.extended(
        backgroundColor: Colors.transparent, // Transparent to show gradient
        elevation: 20,
        label: Text(
          _hasStarted ? localizations.start : localizations.pause,
          style: TextStyle(
            color: Colors.white, // Text color changed to white
            fontFamily: 'PixelifySans', // Use the custom font
          ),
        ),
        onPressed: () {
          setState(() {
            if (_hasStarted) _snakeController.forward();
            else _snakeController.reverse();
            _hasStarted = !_hasStarted;
            _gameStart();
          });
        },
        icon: AnimatedIcon(icon: AnimatedIcons.play_pause, progress: _snakeAnimation),
      ),
    ),
  ),
  body: Stack(
    children: [
      Image.asset(
        'assets/background.png', // Path to your background image
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        fit: BoxFit.cover,
      ),
      Center(
        child: GestureDetector(
          onVerticalDragUpdate: (drag) {
            if (drag.delta.dy > 0 && _currentSnakeDirection != 'UP') _currentSnakeDirection = 'DOWN';
            else if (drag.delta.dy < 0 && _currentSnakeDirection != 'DOWN') _currentSnakeDirection = 'UP';
          },
          onHorizontalDragUpdate: (drag) {
            if (drag.delta.dx > 0 && _currentSnakeDirection != 'LEFT') _currentSnakeDirection = 'RIGHT';
            else if (drag.delta.dx < 0 && _currentSnakeDirection != 'RIGHT') _currentSnakeDirection = 'LEFT';
          },
          child: Container(
            width: MediaQuery.of(context).size.width,
            child: GridView.builder(
              itemCount: _squareSize + _noOfSquares,
              physics: NeverScrollableScrollPhysics(),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: _squareSize),
              itemBuilder: (BuildContext context, int index) {
                return Center(
                  child: Container(
                    color: Colors.white,
                    padding: _snake.contains(index) ? EdgeInsets.all(1) : EdgeInsets.all(0),
                    child: ClipRRect(
                      borderRadius: index == _snakeFoodPosition || index == _snake.last ? BorderRadius.circular(7) : _snake.contains(index) ? BorderRadius.circular(2.5) : BorderRadius.circular(1),
                      child: Container(
                        color: _snake.contains(index) ? Colors.black : index == _snakeFoodPosition ? Colors.green : Colors.purple,
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ),
      ),
    ],
  ),
);
}
}