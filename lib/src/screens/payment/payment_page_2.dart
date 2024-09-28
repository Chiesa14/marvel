import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
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
                const Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Fill your Credit / Debit Card Details',
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 30),
                      ),
                    ],
                  ),
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
                        controller: _firtNameController,
                        placeholder: 'Last Name',
                        keyboardType: TextInputType.text,
                      ),
                      const SizedBox(height: 20),
                      Input(
                        controller: _firtNameController,
                        placeholder: 'Card Number',
                        keyboardType: TextInputType.number,
                      ),
                      const SizedBox(height: 10),
                      Input(
                        controller: _firtNameController,
                        placeholder: 'Expiration Date (MM/YY)',
                        keyboardType: TextInputType.datetime,
                      ),
                      const SizedBox(height: 10),
                      Input(
                        controller: _firtNameController,
                        placeholder: 'Security Code (CVV)',
                        keyboardType: TextInputType.datetime,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
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
