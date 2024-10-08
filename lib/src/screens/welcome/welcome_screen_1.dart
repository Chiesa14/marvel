import 'package:flutter/material.dart';
import 'package:marvel/src/screens/welcome/welcome_screen_2.dart';
import '../../utils/constants.dart';
import '../../widgets/welcome_screen.dart';

class WelcomeScreen1 extends StatelessWidget {
  const WelcomeScreen1({super.key});

  void handleNextNavigation(BuildContext context) {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => const WelcomeScreen2()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return WelcomeScreen(
      text: 'All your favourite MARVEL Movies & Series at one place',
      bgImage: AppAssets.bg1,
      indexValue: 1,
      handleNextScreen: () => handleNextNavigation(context),
    );
  }
}
