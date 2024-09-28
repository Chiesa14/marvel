import 'package:flutter/material.dart';

class NumberLine extends StatelessWidget {
  final int selectedIndex;
  const NumberLine({super.key, required this.selectedIndex});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: List.generate(3, (index) {
          int value = index + 1;
          return Row(
            children: [
              const SizedBox(height: 50),
              if (index > 0)
                Container(
                  height: 6,
                  width: 60,
                  margin: const EdgeInsets.symmetric(horizontal: 4),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: selectedIndex >= value
                        ? const Color(0xFFED1B24)
                        : const Color.fromARGB(71, 137, 27, 38),
                  ),
                ),
              Container(
                height: 30,
                width: 30,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(40),
                  color: selectedIndex >= value
                      ? const Color(0xFFED1B24)
                      : const Color.fromARGB(71, 137, 27, 38),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      value.toString(),
                      style: const TextStyle(color: Colors.white54),
                    )
                  ],
                ),
              ),
            ],
          );
        }),
      ),
    );
  }
}
