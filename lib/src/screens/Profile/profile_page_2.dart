import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:marvel/src/screens/Profile/controllers.dart';

import '../../utils/constants.dart';
import '../../widgets/button.dart';

class ProfilePage2 extends StatefulWidget {
  const ProfilePage2({super.key});

  @override
  State<ProfilePage2> createState() => _ProfilePage2State();
}

class _ProfilePage2State extends State<ProfilePage2> {
  final TextEditingController _userNameCotroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    var selectedAvatar = avatars[userAvatar];

    return Scaffold(
      body: Container(
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
                  'Enter your Username',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w900,
                      fontSize: 30),
                ),
                const SizedBox(height: 40),
                if (selectedAvatar != null && selectedAvatar["1x"] != null)
                  SizedBox(
                    width: 300,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Image.asset(selectedAvatar["2x"]!),
                        GestureDetector(
                          child: const Text(
                            "Change",
                            style: TextStyle(
                              color: Color(0xFFED1B24),
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        )
                      ],
                    ),
                  )
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              child: Button(
                title: "Call me this",
                onPressed:
                    _userNameCotroller.text.isNotEmpty ? () => {} : () => {},
                backgroundColor: _userNameCotroller.text.isNotEmpty,
                textStyle: const TextStyle(color: Colors.white, fontSize: 20),
                height: 50,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
