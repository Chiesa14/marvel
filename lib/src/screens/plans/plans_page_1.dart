import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:marvel/src/screens/plans/plans_page_2.dart';
import 'package:marvel/src/utils/constants.dart';
import 'package:marvel/src/widgets/button.dart';
import 'package:marvel/src/widgets/payment_button.dart';
import 'package:marvel/src/widgets/top_number_line_tab.dart';

class PlanPage1 extends StatefulWidget {
  const PlanPage1({super.key});

  @override
  State<PlanPage1> createState() => _PlanPage1State();
}

class _PlanPage1State extends State<PlanPage1> {
  int selectedPlan = 0;

  void handleContinue(BuildContext context) {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => const PlanPage2()),
    );
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Container(
        height: screenHeight,
        width: screenWidth,
        color: Colors.black,
        child: Column(
          children: [
            const NumberLine(
              selectedIndex: 1,
            ),
            Container(
              height: 1,
              color: Colors.white24,
            ),
            const SizedBox(height: 50),
            SvgPicture.asset(
              AppAssets.lgLogo,
            ),
            const SizedBox(height: 20),
            const Text(
              'Choose your plan',
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 30),
            ),
            const Text(
              'Cancel at any time',
              style: TextStyle(
                  color: Colors.white24,
                  fontWeight: FontWeight.bold,
                  fontSize: 18),
            ),
            const SizedBox(height: 20),
            Container(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  children: [
                    PaymentButton(
                      title: "Movies & Series",
                      onPressed: () {
                        setState(() {
                          selectedPlan = 1;
                        });
                      },
                      backgroundColor: selectedPlan == 1 ? true : false,
                      textStyle: const TextStyle(
                          color: Colors.white,
                          fontSize: 26,
                          fontWeight: FontWeight.w800),
                      height: 100,
                      subtext: '\$20/mth',
                    ),
                    const SizedBox(height: 10),
                    PaymentButton(
                      title: "Movies",
                      onPressed: () {
                        setState(() {
                          selectedPlan = 2;
                        });
                      },
                      backgroundColor: selectedPlan == 2 ? true : false,
                      textStyle: const TextStyle(
                          color: Colors.white,
                          fontSize: 26,
                          fontWeight: FontWeight.w800),
                      height: 100,
                      subtext: '\$15/mth',
                    ),
                    const SizedBox(height: 10),
                    PaymentButton(
                      title: "Series",
                      onPressed: () {
                        setState(() {
                          selectedPlan = 3;
                        });
                      },
                      backgroundColor: selectedPlan == 3 ? true : false,
                      textStyle: const TextStyle(
                          color: Colors.white,
                          fontSize: 26,
                          fontWeight: FontWeight.w800),
                      height: 100,
                      subtext: '\$15/mth',
                    ),
                    const SizedBox(height: 40),
                    Button(
                        title: "Continue",
                        onPressed: selectedPlan == 0
                            ? () => {}
                            : () => handleContinue(context),
                        backgroundColor: false,
                        textStyle:
                            const TextStyle(color: Colors.white, fontSize: 20),
                        height: 50),
                  ],
                ))
          ],
        ),
      ),
    );
  }
}
