import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:marvel/src/utils/constants.dart';
import 'package:marvel/src/widgets/button.dart';
import 'package:marvel/src/widgets/welcome_page_dots.dart';

class WelcomeScreen6 extends StatelessWidget {
  const WelcomeScreen6({
    super.key,
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
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(AppAssets.bg6),
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
                    const ScreenDots(
                      indexValue: 6,
                    ),
                    const SizedBox(height: 40),
                    Button(
                      title: "Signup",
                      onPressed: () => {},
                      backgroundColor: true,
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
            SizedBox(
              height: screenHeight * 0.25,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Button(
                      title: "login",
                      onPressed: () => {},
                      backgroundColor: false,
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
