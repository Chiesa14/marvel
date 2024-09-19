import 'package:flutter/material.dart';

class ScreenDots extends StatelessWidget {
  const ScreenDots({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(6, (index) {
        return Container(
          width: 10, // Size of each dot
          height: 10,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: index == 0 ? const Color(0xFFED1B24) : Colors.white,
          ),
          margin: const EdgeInsets.all(6),
        );
      }),
    );
  }
}
