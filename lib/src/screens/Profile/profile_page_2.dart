import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:marvel/src/screens/Profile/controllers.dart';
import 'package:marvel/src/screens/Profile/profile_page_3.dart';
import 'package:marvel/src/widgets/inputs.dart';
import '../../utils/constants.dart';
import '../../widgets/button.dart';

class ProfilePage2 extends StatefulWidget {
  const ProfilePage2({super.key});

  @override
  State<ProfilePage2> createState() => _ProfilePage2State();
}

class _ProfilePage2State extends State<ProfilePage2> {
  final TextEditingController _userNameController = TextEditingController();
  bool isAvailable = true;

  void handleContinue(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const ProfilePage3()),
    );
  }

  @override
  void initState() {
    super.initState();
    _userNameController.addListener(_checkUsernameAvailability);
  }

  @override
  void dispose() {
    _userNameController.removeListener(_checkUsernameAvailability);
    _userNameController.dispose();
    super.dispose();
  }

  void _checkUsernameAvailability() {
    final typedUsername = _userNameController.text;
    setState(() {
      isAvailable = !usedUsers.any(
        (used) => used.toLowerCase() == typedUsername.toLowerCase(),
      );
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
                            placeholder: 'Username',
                            keyboardType: TextInputType.name,
                            cursorColor: Colors.white,
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
                          const SizedBox(height: 20),
                          if (_userNameController.text.isNotEmpty)
                            Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                isAvailable
                                    ? "Username is available"
                                    : "Username is taken",
                                style: TextStyle(
                                  color: isAvailable
                                      ? const Color(0xFF0E9B02)
                                      : Colors.red,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            )
                        ],
                      ),
                    ),
                ],
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                child: Button(
                  title: "Call me this",
                  onPressed: _userNameController.text.isNotEmpty && isAvailable
                      ? () => handleContinue(context)
                      : () => {},
                  backgroundColor:
                      _userNameController.text.isNotEmpty && isAvailable,
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
