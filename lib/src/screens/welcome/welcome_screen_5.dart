import 'package:flutter/material.dart';
import 'package:marvel/src/screens/welcome/welcome_screen_6.dart';
import '../../utils/constants.dart';
import '../../widgets/welcome_screen.dart';

class WelcomeScreen5 extends StatelessWidget {
  const WelcomeScreen5({super.key});

  void handleNextNavigation(BuildContext context) {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => const WelcomeScreen6()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return WelcomeScreen(
      text: 'Let’s Get Started !!!',
      bgImage: AppAssets.bg5,
      indexValue: 5,
      handleNextScreen: () => handleNextNavigation(context),
    );
  }
}
