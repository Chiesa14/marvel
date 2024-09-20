import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:marvel/src/widgets/welcome_page_dots.dart';
import 'button.dart';
import '../utils/constants.dart';

class WelcomeScreen extends StatelessWidget {
  final String text;
  final String bgImage; // Background image path

  const WelcomeScreen({
    super.key,
    required this.text,
    required this.bgImage,
  });

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(color: Colors.black),
        child: Column(
          children: [
            Container(
              height: screenHeight * 0.75,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(bgImage), // Background image
                  fit: BoxFit.cover,
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    SvgPicture.asset(
                      AppAssets.lgLogo,
                    ),
                    const SizedBox(height: 70),
                    const ScreenDots(),
                    const SizedBox(height: 40),
                    Text(
                      text, // Custom text
                      style: const TextStyle(
                        fontSize: 26,
                        fontWeight: FontWeight.w400,
                        color: Colors.white,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: screenHeight * 0.25,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Button(
                      title: "Continue",
                      onPressed: () => {},
                      backgroundColor: true, // Red button
                      textStyle: const TextStyle(
                        fontSize: 20,
                        color: Color.fromARGB(255, 255, 255, 255),
                      ),
                      height: 30,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
