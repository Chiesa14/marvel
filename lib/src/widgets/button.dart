import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  final String title;
  final VoidCallback onPressed;
  final bool backgroundColor;
  final TextStyle textStyle;
  final double height;

  const Button({
    super.key,
    required this.title,
    required this.onPressed,
    required this.backgroundColor,
    required this.textStyle,
    required this.height,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
          backgroundColor:
              backgroundColor ? const Color(0xFFED1B24) : Colors.black,
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
          minimumSize: Size(double.infinity, height),
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.zero, // Set to 0 to remove rounding
          ),
          side: const BorderSide(color: Color(0xFFED1B24), width: 4)),
      child: Text(
        title,
        style: textStyle,
      ),
    );
  }
}
