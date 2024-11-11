import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../utils/constants.dart';
import '../../widgets/button.dart';
import 'controllers.dart';

class ProfileConfirm extends StatefulWidget {
  const ProfileConfirm({super.key});

  @override
  _ProfileConfirmState createState() => _ProfileConfirmState();
}

class _ProfileConfirmState extends State<ProfileConfirm> {
  bool isReversed = false;
  late Timer _timer;

  @override
  void initState() {
    super.initState();
    _timer = Timer.periodic(const Duration(seconds: 2), (timer) {
      setState(() {
        isReversed = !isReversed;
      });
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  void handleContinue(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const ProfileConfirm()),
    );
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    var selectedAvatar = avatars[userAvatar];

    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          height: screenHeight,
          width: screenWidth,
          color: Colors.black,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  const SizedBox(height: 20),
                  SvgPicture.asset(
                    AppAssets.lgLogo,
                    height: 80,
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    'Your Profile is Created Successfully!!',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w900,
                        fontSize: 30),
                  ),
                ],
              ),
              if (selectedAvatar != null && selectedAvatar["1x"] != null)
                Column(
                  children: [
                    Container(
                      height: 300,
                      width: 300,
                      child: Stack(
                        alignment: Alignment.center,
                        children: [
                          AnimatedSwitcher(
                            duration: const Duration(seconds: 2),
                            transitionBuilder:
                                (Widget child, Animation<double> animation) {
                              return FadeTransition(
                                  opacity: animation, child: child);
                            },
                            child: SvgPicture.asset(
                              isReversed
                                  ? 'assets/icons/round_red_rev.svg'
                                  : 'assets/icons/round_red.svg',
                              fit: BoxFit.cover,
                              key: ValueKey<bool>(isReversed),
                            ),
                          ),
                          Image.asset(
                            selectedAvatar["3x"]!,
                            fit: BoxFit.contain,
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 20),
                    const Text(
                      "UIUXDIVYANSHU",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w900,
                          fontSize: 20),
                    ),
                  ],
                ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                child: Button(
                  title: "Eat Your Green Vegetables",
                  onPressed: () => handleContinue(context),
                  backgroundColor: true,
                  textStyle: const TextStyle(color: Colors.white, fontSize: 20),
                  height: 50,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
