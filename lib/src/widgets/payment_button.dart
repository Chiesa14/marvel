import 'package:flutter/material.dart';

class PaymentButton extends StatelessWidget {
  final String title;
  final VoidCallback onPressed;
  final bool backgroundColor;
  final TextStyle textStyle;
  final double height;
  final String subtext;

  const PaymentButton({
    super.key,
    required this.title,
    required this.onPressed,
    required this.backgroundColor,
    required this.textStyle,
    required this.height,
    required this.subtext,
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
        side: const BorderSide(color: Color(0xFFED1B24), width: 4),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // Wrap text with Flexible to avoid overflow
          Flexible(
            child: Text(
              title,
              style: textStyle,
              overflow: TextOverflow.visible, // Ensure text wraps
              maxLines: 2, // You can adjust this to control max lines
            ),
          ),
          const SizedBox(width: 10), // Add spacing between the texts
          Flexible(
            child: Text(
              subtext,
              style: textStyle,
              overflow: TextOverflow.visible,
              maxLines: 2,
            ),
          ),
        ],
      ),
    );
  }
}
