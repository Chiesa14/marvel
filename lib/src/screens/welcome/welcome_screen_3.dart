import 'package:flutter/material.dart';
import 'package:marvel/src/screens/welcome/welcome_screen_4.dart';
import '../../utils/constants.dart';
import '../../widgets/welcome_screen.dart';

class WelcomeScreen3 extends StatelessWidget {
  const WelcomeScreen3({super.key});

  void handleNextNavigation(BuildContext context) {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => const WelcomeScreen4()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return WelcomeScreen(
      text:
          'Create profiles for diffrent members & get personalised recommendations',
      bgImage: AppAssets.bg3,
      indexValue: 3,
      handleNextScreen: () => handleNextNavigation(context),
    );
  }
}
