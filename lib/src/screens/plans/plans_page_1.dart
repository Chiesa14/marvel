import 'package:flutter/material.dart';
import 'package:marvel/src/widgets/top_number_line_tab.dart';

class PlanPage1 extends StatefulWidget {
  const PlanPage1({super.key});

  @override
  State<PlanPage1> createState() => _PlanPage1State();
}

class _PlanPage1State extends State<PlanPage1> {
  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Container(
        height: screenHeight,
        width: screenWidth,
        color: Colors.black,
        child: const Column(
          children: [
            NumberLine(
              selectedIndex: 1,
            ),
            SizedBox(
              height: 10,
            ),
            Text('Plan page 1'),
          ],
        ),
      ),
    );
  }
}
