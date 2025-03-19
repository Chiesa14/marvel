import 'package:flutter/material.dart';
import 'package:marvel/src/widgets/category_button_bar.dart';
import 'package:marvel/src/widgets/options_bar.dart';

class CategoriesScreen extends StatefulWidget {
  const CategoriesScreen({super.key});

  @override
  State<CategoriesScreen> createState() => _CategoriesScreenState();
}

class _CategoriesScreenState extends State<CategoriesScreen>
    with SingleTickerProviderStateMixin {
  bool isMoviesActive = true;
  String activeButton = 'Oldest';

  late final AnimationController _controller;
  late final Animation<Offset> _offsetAnimation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      duration: const Duration(milliseconds: 300),
      vsync: this,
    );

    _offsetAnimation = Tween<Offset>(
      begin: Offset.zero,
      end: const Offset(1.0, 0.0),
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInOut,
    ));

    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    if (isMoviesActive) {
      _controller.reverse();
    } else {
      _controller.forward();
    }

    return Scaffold(
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top: 30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SlidingButtonBar(
                screenSize: screenSize,
                label1: 'Movies',
                label2: 'Series',
                isActive: isMoviesActive,
                onLabelChange: (bool value) {
                  setState(() {
                    isMoviesActive = value;
                  });
                },
                controller: _controller,
                offsetAnimation: _offsetAnimation,
              ),
              const SizedBox(height: 16),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Column(
                  children: [
                    CategoryButtonBar(
                      screenSize: MediaQuery.of(context).size,
                      activeButton: activeButton,
                      onButtonTap: (selectedButton) {
                        setState(() {
                          activeButton =
                              selectedButton; // Update state in your parent widget
                        });
                      },
                      buttonLabels: const [
                        'Newest',
                        'Oldest',
                        'Top',
                        'Order',
                      ], // Provide button texts
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
