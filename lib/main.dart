import 'package:flutter/material.dart';

import 'landing_screen.dart';
import 'constants.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Crypto Price Checker',
      theme: Theme.of(context).copyWith(
        appBarTheme: const AppBarTheme(
          backgroundColor: kAppBarColor,
          toolbarHeight: 60,
          centerTitle: true,
          elevation: 5,
          titleTextStyle: TextStyle(
            fontSize: 25,
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        scaffoldBackgroundColor: kScaffoldColor,
      ),
      home: const LandingScreen(),
    );
  }
}
