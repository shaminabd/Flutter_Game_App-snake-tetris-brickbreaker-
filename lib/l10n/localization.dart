import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart'; // Import this for SynchronousFuture

class AppLocalizations {
  AppLocalizations(this.locale);

  final Locale locale;

  static AppLocalizations of(BuildContext context) {
    final instance = Localizations.of<AppLocalizations>(context, AppLocalizations);
    assert(instance != null, 'No AppLocalizations found in context');
    return instance!;
  }

  static const LocalizationsDelegate<AppLocalizations> delegate = _AppLocalizationsDelegate();

  static List<Locale> supportedLocales = [
    const Locale('en', ''),
    const Locale('ru', ''),
  ];

  static final Map<String, Map<String, String>> _localizedValues = {
    'en': {
      'title': 'Select a Game',
      'snake': 'snake',
      'ataribreakout': 'atari breakout',
      'tetris': 'tetris',
      'login': 'Login',
      'signup': 'Signup',
      'enterEmail': 'Enter Email',
      'enterPassword': 'Enter Password',
      'enterName': 'Enter Name', // Add enterName key for English
      'welcomeUser': 'Welcome User',
      'alreadyHaveAccount': 'Already have an account?',
      'change_language': 'Change Language',
      'start': 'Start',
      'pause': 'Pause',
      'score': 'Score',
      'app_bar_title': 'SnakeGame',
      'gameOver': 'Game Over',
      'yourScore': 'Your Score is: ',
      'tryAgain': 'Try Again',
      'tapToPlay': 'Tap to Play',
      'useArrowsToSwipe': 'Use arrows to swipe',
      'youWon': 'You Won',
      'tapToPlayAgain': 'Tap to Play Again',
      'best': 'Best',
      'currentScore': 'Current Score',
      'play': 'Play',
      'playing': 'Playing',
      'signOut': 'Sign Out',
    },
    'ru': {
      'title': 'Выберите игру',
      'snake': 'змейка',
      'ataribreakout': 'брэйкаут',
      'tetris': 'тетрис',
      'login': 'Войти',
      'signup': 'Регистрация',
      'enterEmail': 'Введите Email',
      'enterPassword': 'Введите Пароль',
      'enterName': 'Введите имя', // Add enterName key for Russian
      'welcomeUser': 'Добро пожаловать',
      'alreadyHaveAccount': 'Уже есть аккаунт?',
      'change_language': 'Сменить язык',
      'start': 'Начать',
      'pause': 'Пауза',
      'score': 'Очки',
      'app_bar_title': 'Игра Змейка',
      'gameOver': 'Игра окончена',
      'yourScore': 'Ваш счет: ',
      'tryAgain': 'Попробовать снова',
      'tapToPlay': 'Коснитесь, чтобы играть',
      'useArrowsToSwipe': 'Используйте стрелки для свайпа',
      'youWon': 'Вы выиграли',
      'tapToPlayAgain': 'Коснитесь, чтобы играть снова',
      'best': 'Лучший',
      'currentScore': 'Текущий счет',
      'play': 'Играть',
      'playing': 'Играет',
      'signOut': 'Выйти',
    },
  };

  String get title => _localizedValues[locale.languageCode]?['title'] ?? '';
  String get snake => _localizedValues[locale.languageCode]?['snake'] ?? '';
  String get ataribreakout => _localizedValues[locale.languageCode]?['ataribreakout'] ?? '';
  String get tetris => _localizedValues[locale.languageCode]?['tetris'] ?? '';
  String get login => _localizedValues[locale.languageCode]?['login'] ?? '';
  String get signup => _localizedValues[locale.languageCode]?['signup'] ?? '';
  String get enterEmail => _localizedValues[locale.languageCode]?['enterEmail'] ?? '';
  String get enterPassword => _localizedValues[locale.languageCode]?['enterPassword'] ?? '';
  String get enterName => _localizedValues[locale.languageCode]?['enterName'] ?? ''; // Add getter for enterName
  String get welcomeUser => _localizedValues[locale.languageCode]?['welcomeUser'] ?? '';
  String get alreadyHaveAccount => _localizedValues[locale.languageCode]?['alreadyHaveAccount'] ?? '';
  String get changeLanguage => _localizedValues[locale.languageCode]?['change_language'] ?? '';
  String get start => _localizedValues[locale.languageCode]?['start'] ?? '';
  String get pause => _localizedValues[locale.languageCode]?['pause'] ?? '';
  String get score => _localizedValues[locale.languageCode]?['score'] ?? '';
  String get appBarTitle => _localizedValues[locale.languageCode]?['app_bar_title'] ?? '';
  String get gameOver => _localizedValues[locale.languageCode]?['gameOver'] ?? '';
  String get yourScore => _localizedValues[locale.languageCode]?['yourScore'] ?? '';
  String get tryAgain => _localizedValues[locale.languageCode]?['tryAgain'] ?? '';
  String get tapToPlay => _localizedValues[locale.languageCode]?['tapToPlay'] ?? '';
  String get useArrowsToSwipe => _localizedValues[locale.languageCode]?['useArrowsToSwipe'] ?? '';
  String get youWon => _localizedValues[locale.languageCode]?['youWon'] ?? '';
  String get tapToPlayAgain => _localizedValues[locale.languageCode]?['tapToPlayAgain'] ?? '';
  String get best => _localizedValues[locale.languageCode]?['best'] ?? '';
  String get currentScore => _localizedValues[locale.languageCode]?['currentScore'] ?? '';
  String get play => _localizedValues[locale.languageCode]?['play'] ?? '';
  String get playing => _localizedValues[locale.languageCode]?['playing'] ?? '';
  String get signOut => _localizedValues[locale.languageCode]?['signOut'] ?? '';
}

class _AppLocalizationsDelegate extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) {
    return ['en', 'ru'].contains(locale.languageCode);
  }

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(AppLocalizations(locale));
  }

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}
