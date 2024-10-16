import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'firebase_options.dart'; // Import Firebase options
import 'menu_page.dart'; // Assuming this is your main menu page
import 'l10n/localization.dart'; // Import localization

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Locale _locale = const Locale('en'); // Initialize locale

  // Define the setLocale function
  void setLocale(Locale newLocale) {
    setState(() {
      _locale = newLocale; // Update locale
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Authentication & Localization',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        fontFamily: 'PixelifySans',
      ),
      locale: _locale, // Use the updated locale
      supportedLocales: AppLocalizations.supportedLocales,
      localizationsDelegates: const [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      home: MenuPage(setLocale: setLocale), // Start with the MenuPage
      debugShowCheckedModeBanner: false,
    );
  }
}
