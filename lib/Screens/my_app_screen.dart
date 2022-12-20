import 'package:flutter/material.dart';
import 'package:basic_banking_app/constants.dart';
import 'animation_screen.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
        appBarTheme: AppBarTheme(
          color: kAppThemeBlackColor,
          titleTextStyle: TextStyle(
            fontFamily: 'Montserrat',
            fontWeight: FontWeight.bold,
            fontSize: 18,
            letterSpacing: 1.5,
          ),
        ),
        primaryColor: kAppThemeBlackColor,
        scaffoldBackgroundColor: kAppThemeWhiteColor,
      ),
      home: AnimationScreen(),// form animation_screen.dart
    );
  }
}