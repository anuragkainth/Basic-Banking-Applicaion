import 'package:flutter/material.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:page_transition/page_transition.dart';
import 'home_screen.dart';
import 'package:basic_banking_app/constants.dart';

class AnimationScreen extends StatelessWidget {
  const AnimationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
      backgroundColor: kAppThemeBlackColor,
      splash: Image.asset(
        'images/Splash_logo_2.jpeg',
      ),
      splashIconSize: kSplashLogoSize,
      splashTransition: SplashTransition.fadeTransition,
      pageTransitionType: PageTransitionType.fade,
      nextScreen: HomeScreen(), // from home_scree.dart
    );
  }
}