import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:lottie/lottie.dart';
import 'package:marvel/src/screens/Profile/profile_page_1.dart';
import 'package:marvel/src/screens/home/homeScreen.dart';
import 'package:marvel/src/utils/constants.dart';
import 'package:marvel/src/widgets/top_number_line_tab.dart';

import '../../widgets/button.dart';

class PaymentPage4 extends StatefulWidget {
  final String otpInput;

  const PaymentPage4({super.key, required this.otpInput});

  @override
  State<PaymentPage4> createState() => _PaymentPage4State();
}

class _PaymentPage4State extends State<PaymentPage4> {
  bool isLoading = true;
  bool isVerified = false;

  @override
  void initState() {
    super.initState();

    // Start OTP verification process
    _verifyOTP();
  }

  void _verifyOTP() async {
    setState(() {
      isLoading = true;
    });

    await Future.delayed(const Duration(seconds: 5));

    if (widget.otpInput == '2345') {
      setState(() {
        isVerified = true;
        isLoading = false;
      });
    } else {
      setState(() {
        isVerified = false;
        isLoading = false;
      });
    }
  }

  void handleContinue(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const ProfilePage1()),
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
                  selectedIndex: 3,
                ),
                Container(height: 1, color: Colors.white24),
                const SizedBox(height: 20),
                SvgPicture.asset(AppAssets.lgLogo),
                const SizedBox(height: 20),
                const Text(
                  'Verifying Payment',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 30),
                ),
                const SizedBox(height: 20),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    children: [
                      isLoading
                          ? const Text(
                              'Please wait while we verify your payment from the bank...',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 16),
                            )
                          : isVerified
                              ? const Text(
                                  'Payment Verified',
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 16),
                                )
                              : const Text(
                                  'Payment Failed. Incorrect OTP.',
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 16),
                                ),
                      const SizedBox(height: 20),
                      isLoading
                          ? Lottie.asset('assets/animations/loading_dots.json',
                              height: 230)
                          : isVerified
                              ? Column(
                                  children: [
                                    const SizedBox(height: 60),
                                    Lottie.asset(
                                      'assets/animations/completed.json',
                                      height: 150,
                                      repeat: false,
                                    ),
                                  ],
                                )
                              : Lottie.asset(
                                  'assets/animations/failed.json',
                                  height: 250,
                                  repeat: false,
                                ),
                    ],
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              child: Button(
                title: isLoading || isVerified ? "Continue" : "Go Back",
                onPressed: isVerified
                    ? () => handleContinue(context)
                    : () => Navigator.pop(context),
                backgroundColor: isLoading == false ? true : false,
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
