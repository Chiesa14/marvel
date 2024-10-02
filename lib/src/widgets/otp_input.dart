import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';

class OTPInput extends StatelessWidget {
  final Function(String) onCompleted;
  final Function(String) onChanged;

  const OTPInput(
      {super.key, required this.onCompleted, required this.onChanged});

  @override
  Widget build(BuildContext context) {
    final defaultPinTheme = PinTheme(
      width: 50,
      height: 60,
      margin: const EdgeInsets.symmetric(horizontal: 8),
      textStyle: const TextStyle(
        fontSize: 20,
        color: Colors.white,
        fontWeight: FontWeight.w600,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: Colors.white30,
      ),
    );

    return Pinput(
      length: 4,
      defaultPinTheme: defaultPinTheme,
      onChanged: onChanged,
      onCompleted: onCompleted,
      showCursor: true,
      cursor: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: 2,
            height: 20,
            color: Colors.white,
          ),
        ],
      ),
    );
  }
}
