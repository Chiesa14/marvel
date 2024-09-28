import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:marvel/src/screens/payment/payment_page_2.dart';
import 'package:marvel/src/utils/constants.dart';
import 'package:marvel/src/widgets/button.dart';
import 'package:marvel/src/widgets/top_number_line_tab.dart';

class PaymentPage1 extends StatefulWidget {
  const PaymentPage1({super.key});

  @override
  State<PaymentPage1> createState() => _PaymentPage1State();
}

class _PaymentPage1State extends State<PaymentPage1> {
  int selectedPlan = 0;

  void handleContinue(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const PaymentPage2()),
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
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                const NumberLine(
                  selectedIndex: 2,
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
                  'Choose how to pay',
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
                      Button(
                        title: "Credit / Debit Card",
                        onPressed: () {
                          setState(() {
                            selectedPlan = 1;
                          });
                        },
                        backgroundColor: selectedPlan == 1 ? true : false,
                        textStyle: const TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.w800),
                        height: 70,
                      ),
                      const SizedBox(height: 10),
                      Button(
                        title: "Netbanking",
                        onPressed: () {
                          setState(() {
                            selectedPlan = 2;
                          });
                        },
                        backgroundColor: selectedPlan == 2 ? true : false,
                        textStyle: const TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.w800),
                        height: 70,
                      ),
                      const SizedBox(height: 20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            "Movies & Series \$20/month",
                            style: TextStyle(color: Colors.white),
                          ),
                          const SizedBox(width: 40),
                          GestureDetector(
                            onTap: () => Navigator.pop(context),
                            child: const Text(
                              "Change",
                              style: TextStyle(color: Color(0xFFED1B24)),
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              child: Button(
                title: "Continue",
                onPressed: selectedPlan == 0
                    ? () => {}
                    : () => handleContinue(context),
                backgroundColor: selectedPlan != 0 ? true : false,
                textStyle: const TextStyle(color: Colors.white, fontSize: 20),
                height: 50,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
