import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:marvel/src/screens/payment/payment_page_3.dart';
import 'package:marvel/src/utils/constants.dart';
import 'package:marvel/src/widgets/button.dart';
import 'package:marvel/src/widgets/inputs.dart';
import 'package:marvel/src/widgets/top_number_line_tab.dart';

class PaymentPage2 extends StatefulWidget {
  const PaymentPage2({super.key});

  @override
  State<PaymentPage2> createState() => _PaymentPage2State();
}

class _PaymentPage2State extends State<PaymentPage2> {
  final TextEditingController _firtNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _cardNumberController = TextEditingController();
  final TextEditingController _expDateController = TextEditingController();
  final TextEditingController _cvvController = TextEditingController();

  void handleContinue(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const PaymentPage3()),
    );
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          width: screenWidth,
          height: screenHeight,
          color: Colors.black,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  const NumberLine(
                    selectedIndex: 2,
                  ),
                  Container(height: 1, color: Colors.white24),
                  const SizedBox(height: 20),
                  SvgPicture.asset(AppAssets.lgLogo),
                  const SizedBox(height: 20),
                  const Text(
                    'Fill your Credit / Debit Card Details',
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
                        Input(
                          controller: _firtNameController,
                          placeholder: 'First Name',
                          keyboardType: TextInputType.text,
                        ),
                        const SizedBox(height: 10),
                        Input(
                          controller: _lastNameController,
                          placeholder: 'Last Name',
                          keyboardType: TextInputType.text,
                        ),
                        const SizedBox(height: 20),
                        Input(
                          controller: _cardNumberController,
                          placeholder: 'Card Number',
                          keyboardType: const TextInputType.numberWithOptions(
                              decimal: false, signed: false),
                        ),
                        const SizedBox(height: 10),
                        Input(
                          controller: _expDateController,
                          placeholder: 'Expiration Date (MM/YY)',
                          keyboardType: TextInputType.datetime,
                        ),
                        const SizedBox(height: 10),
                        Input(
                          controller: _cvvController,
                          placeholder: 'Security Code (CVV)',
                          keyboardType: TextInputType.number,
                        ),
                        const SizedBox(height: 5),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const SizedBox(width: 5),
                            const Text(
                              "Movies & Series \$20/month",
                              style: TextStyle(color: Colors.white),
                            ),
                            const SizedBox(width: 40),
                            GestureDetector(
                              onTap: () {
                                int count = 0;
                                Navigator.popUntil(context, (route) {
                                  return count++ == 2;
                                });
                              },
                              child: const Text(
                                "Change",
                                style: TextStyle(color: Color(0xFFED1B24)),
                              ),
                            ),
                            const SizedBox(width: 5),
                          ],
                        )
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
                  onPressed: _cardNumberController.text.isNotEmpty &&
                          _cvvController.text.isNotEmpty &&
                          _expDateController.text.isNotEmpty
                      ? () => handleContinue(context)
                      : () => {},
                  backgroundColor: _cardNumberController.text.isNotEmpty &&
                          _cvvController.text.isNotEmpty &&
                          _expDateController.text.isNotEmpty
                      ? true
                      : false,
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
