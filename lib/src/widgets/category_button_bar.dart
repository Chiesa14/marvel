import 'dart:ui';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class SlidingButtonBar extends StatelessWidget {
  final Size screenSize;
  final String label1;
  final String label2;
  final bool isActive;
  final ValueChanged<bool> onLabelChange;
  final AnimationController controller;
  final Animation<Offset> offsetAnimation;

  const SlidingButtonBar({
    required this.screenSize,
    required this.label1,
    required this.label2,
    required this.isActive,
    required this.onLabelChange,
    required this.controller,
    required this.offsetAnimation,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    if (isActive) {
      controller.reverse();
    } else {
      controller.forward();
    }

    return Stack(
      children: [
        SlideTransition(
          position: offsetAnimation,
          child: Container(
            width: screenSize.width / 2,
            height: 50,
            decoration: const BoxDecoration(
              color: Color(0xFFED1B24),
            ),
          ),
        ),
        Container(
          height: 50,
          decoration: BoxDecoration(
            border: Border.all(color: const Color(0xFFED1B24)),
          ),
          child: Row(
            children: [
              Expanded(
                child: GestureDetector(
                  behavior: HitTestBehavior.opaque,
                  onTap: () => onLabelChange(true),
                  child: SizedBox(
                    height: double.infinity,
                    child: Center(
                      child: Text(
                        label1, // Changed to dynamic label1
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Expanded(
                child: GestureDetector(
                  behavior: HitTestBehavior.opaque,
                  onTap: () => onLabelChange(false),
                  child: SizedBox(
                    height: double.infinity,
                    child: Center(
                      child: Text(
                        label2, // Changed to dynamic label2
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
