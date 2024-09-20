import 'package:flutter/material.dart';
import 'package:marvel/src/screens/welcome/welcome_screen_5.dart';
import '../../utils/constants.dart';
import '../../widgets/welcome_screen.dart';

class WelcomeScreen4 extends StatelessWidget {
  const WelcomeScreen4({super.key});

  void handleNextNavigation(BuildContext context) {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => const WelcomeScreen5()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return WelcomeScreen(
      text: 'Plans according to your needs at affordable prices',
      bgImage: AppAssets.bg4,
      indexValue: 4,
      handleNextScreen: () => handleNextNavigation(context),
    );
  }
}
