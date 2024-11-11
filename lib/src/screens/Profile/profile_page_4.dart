import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:marvel/src/screens/Profile/profile_confirm.dart';
import 'package:marvel/src/screens/Profile/profile_page_2.dart';
import 'package:marvel/src/widgets/otp_input.dart';

import '../../utils/constants.dart';
import '../../widgets/button.dart';
import 'controllers.dart';

class ProfilePage4 extends StatefulWidget {
  const ProfilePage4({super.key});

  @override
  State<ProfilePage4> createState() => _ProfilePage4State();
}

class _ProfilePage4State extends State<ProfilePage4> {
  String pinValue = "";

  void _onPinChanged(String otp) {
    setState(() {
      pinValue = otp;
    });
  }

  void _onPinCompleted(String otp) {
    setState(() {
      pinValue = otp;
    });
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
                    'Create a Pin',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w900,
                        fontSize: 30),
                  ),
                  const SizedBox(height: 20),
                  if (selectedAvatar != null && selectedAvatar["1x"] != null)
                    SizedBox(
                      width: 300,
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset(selectedAvatar["2x"]!),
                            ],
                          ),
                          const SizedBox(height: 40),
                          OTPInput(
                              onCompleted: _onPinCompleted,
                              onChanged: _onPinChanged),
                          const SizedBox(height: 20),
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 30.0),
                            child: Text(
                              'This pin will be used to log-in to your profile',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: Colors.white.withOpacity(0.5),
                                  fontWeight: FontWeight.w600,
                                  fontSize: 20),
                            ),
                          ),
                        ],
                      ),
                    ),
                ],
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                child: Button(
                  title: "I’m all safe now",
                  onPressed: pinValue.length == 4
                      ? () => handleContinue(context)
                      : () => {},
                  backgroundColor: pinValue.length == 4,
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
