import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../utils/constants.dart';
import '../../widgets/button.dart';
import 'controllers.dart';

class ProfilePage1 extends StatefulWidget {
  const ProfilePage1({super.key});

  @override
  State<ProfilePage1> createState() => _ProfilePage1State();
}

class _ProfilePage1State extends State<ProfilePage1> {
  bool isSelectedAvatar = false;
  String selectedAvatar = "";
  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

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
                  'Choose your Avatar',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w900,
                      fontSize: 30),
                ),
              ],
            ),
            SizedBox(
              height: screenHeight - 250,
              child: GridView.count(
                crossAxisCount: 2,
                mainAxisSpacing: 50,
                crossAxisSpacing: 20,
                childAspectRatio: 2,
                children: avatars.entries.map((avatar) {
                  return Center(
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(100),
                      child: Container(
                        decoration: BoxDecoration(
                          boxShadow: selectedAvatar == avatar.key
                              ? [
                                  const BoxShadow(
                                    color: Colors.white,
                                    offset: Offset(4, 4),
                                    blurRadius: 8,
                                    spreadRadius: 2,
                                  ),
                                ]
                              : null,
                        ),
                        child: GestureDetector(
                          onTap: () {
                            setState(() {
                              isSelectedAvatar = true;
                              selectedAvatar = avatar.key;
                            });
                          },
                          child: Image.asset(
                            avatar.value["1x"]!, // Access the "1x" path here
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                  );
                }).toList(),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              child: Button(
                title: "Looks Good",
                onPressed: isSelectedAvatar ? () => {} : () => {},
                backgroundColor: isSelectedAvatar,
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
