import 'package:flutter/material.dart';
import 'package:marvel/src/screens/welcome/welcome_screen_3.dart';
import '../../utils/constants.dart';
import '../../widgets/welcome_screen.dart';

class WelcomeScreen2 extends StatelessWidget {
  const WelcomeScreen2({super.key});

  void handleNextNavigation(BuildContext context) {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => const WelcomeScreen3()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return WelcomeScreen(
      text: 'Watch Online or Download Offline',
      bgImage: AppAssets.bg2,
      indexValue: 2,
      handleNextScreen: () => handleNextNavigation(context),
    );
  }
}
