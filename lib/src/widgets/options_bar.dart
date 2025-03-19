import 'package:flutter/material.dart';

class CategoryButtonBar extends StatelessWidget {
  final Size screenSize;
  final String activeButton;
  final Function(String) onButtonTap;
  final List<String> buttonLabels;

  const CategoryButtonBar({
    required this.screenSize,
    required this.activeButton,
    required this.onButtonTap,
    required this.buttonLabels,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: buttonLabels.map((label) {
          final isActive = activeButton == label;
          return Expanded(
            child: GestureDetector(
              behavior: HitTestBehavior.opaque,
              onTap: () => onButtonTap(label),
              child: Container(
                margin: const EdgeInsets.symmetric(horizontal: 6),
                decoration: BoxDecoration(
                  color: isActive ? Colors.white : Colors.transparent,
                  border: Border.all(color: Colors.white),
                  borderRadius: BorderRadius.circular(200),
                ),
                child: Center(
                  child: Text(
                    label,
                    style: TextStyle(
                      color: isActive ? Colors.black : Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
}
