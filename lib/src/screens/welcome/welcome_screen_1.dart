import 'package:flutter/material.dart';
import '../../utils/constants.dart';
import '../../widgets/welcome_screen.dart';

class WelcomeScreen1 extends StatelessWidget {
  const WelcomeScreen1({super.key});

  @override
  Widget build(BuildContext context) {
    return const WelcomeScreen(
      text: 'All your favourite MARVEL Movies & Series at one place',
      bgImage: AppAssets.bg1,
    );
  }
}
