import 'package:flutter/material.dart';

class Input extends StatelessWidget {
  final TextEditingController controller;
  final String placeholder;
  final TextInputType keyboardType;
  final bool obscureText;
  final InputDecoration? className;
  final double? height;
  final TextStyle? inputTextStyle;
  final Color cursorColor;

  const Input({
    super.key,
    required this.controller,
    required this.placeholder,
    required this.keyboardType,
    this.obscureText = false,
    this.className,
    this.height,
    this.inputTextStyle,
    this.cursorColor = Colors.black,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: height ?? 50,
      child: TextField(
        controller: controller,
        keyboardType: keyboardType,
        obscureText: obscureText,
        cursorColor: cursorColor,
        style: inputTextStyle,
        decoration: className?.copyWith(
              filled: true,
              hintText: placeholder,
              border: InputBorder.none,
            ) ??
            InputDecoration(
              filled: true,
              fillColor: Colors.white,
              hintText: placeholder,
              hintStyle: const TextStyle(color: Colors.grey),
              border: InputBorder.none,
            ),
      ),
    );
  }
}
