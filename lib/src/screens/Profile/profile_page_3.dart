import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../utils/constants.dart';
import '../../widgets/button.dart';
import '../../widgets/inputs.dart';
import 'controllers.dart';

class ProfilePage3 extends StatefulWidget {
  const ProfilePage3({super.key});

  @override
  State<ProfilePage3> createState() => _ProfilePage3State();
}

class _ProfilePage3State extends State<ProfilePage3> {
  final TextEditingController _userNameController = TextEditingController();
  bool isPasswordValid = false;

  @override
  void initState() {
    super.initState();
    _userNameController.addListener(_checkPasswordStrength);
  }

  @override
  void dispose() {
    _userNameController.removeListener(_checkPasswordStrength);
    _userNameController.dispose();
    super.dispose();
  }

  void _checkPasswordStrength() {
    final password = _userNameController.text;
    final passwordRegex = RegExp(r'^(?=.*[.,_\-/&])[A-Za-z0-9.,_\-/&]{8,}$');

    setState(() {
      isPasswordValid = passwordRegex.hasMatch(password);
    });
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
                    "Choose a Password",
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
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Image.asset(selectedAvatar["2x"]!),
                              GestureDetector(
                                onTap: () => {Navigator.pop(context)},
                                child: const Text(
                                  "Change",
                                  style: TextStyle(
                                    color: Color(0xFFED1B24),
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 20),
                          Input(
                            controller: _userNameController,
                            placeholder: 'Create a password',
                            keyboardType: TextInputType.text,
                            cursorColor: Colors.white,
                            obscureText: true,
                            inputTextStyle: const TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                            ),
                            className: InputDecoration(
                              fillColor: Colors.white.withOpacity(0.2),
                              hintStyle: TextStyle(
                                color: Colors.white.withOpacity(0.3),
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Minimum 8 characters",
                                  style: TextStyle(
                                    color: _userNameController.text.length >= 8
                                        ? const Color(0xFF0E9B02)
                                        : Colors.white.withOpacity(0.3),
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Text(
                                  "Only A-Z, a-z, 0-9",
                                  style: TextStyle(
                                    color: _userNameController.text.length >= 8
                                        ? const Color(0xFF0E9B02)
                                        : Colors.white.withOpacity(0.3),
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Text(
                                  "1 special charcter (. , _ - / &)",
                                  style: TextStyle(
                                    color: _userNameController.text.length >= 8
                                        ? const Color(0xFF0E9B02)
                                        : Colors.white.withOpacity(0.3),
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
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
                  title: "Looks Strong",
                  onPressed:
                      _userNameController.text.isNotEmpty && isPasswordValid
                          ? () => {}
                          : () => {},
                  backgroundColor:
                      _userNameController.text.isNotEmpty && isPasswordValid,
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
