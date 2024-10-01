import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:marvel/src/utils/constants.dart';
import 'package:marvel/src/widgets/button.dart';
import 'package:marvel/src/widgets/otp_input.dart';
import 'package:marvel/src/widgets/top_number_line_tab.dart';

class PaymentPage3 extends StatefulWidget {
  const PaymentPage3({super.key});

  @override
  State<PaymentPage3> createState() => _PaymentPage3State();
}

class _PaymentPage3State extends State<PaymentPage3> {
  void handleContinue(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const PaymentPage3()),
    );
  }

  void _onOtpCompleted(String otp) {
    print('OTP Entered: $otp');
    // Handle OTP submission here
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
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
                    'Enter your OTP',
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
                        const Text(
                          'Please enter the OTP that we’ve sent on your phone number 55XXXXXX99 linked with your bank account.',
                          style: TextStyle(color: Colors.white, fontSize: 16),
                        ),
                        const SizedBox(height: 20),
                        OTPInput(onCompleted: _onOtpCompleted)
                      ],
                    ),
                  ),
                ],
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                child: Button(
                  title: "Continue",
                  onPressed: () => {},
                  backgroundColor: false,
                  textStyle: const TextStyle(color: Colors.white, fontSize: 20),
                  height: 50,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
