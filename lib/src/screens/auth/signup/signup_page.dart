import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:marvel/src/screens/auth/login/login_page.dart';
import 'package:marvel/src/utils/constants.dart';
import 'package:marvel/src/widgets/button.dart';
import 'package:marvel/src/widgets/input_password.dart';
import 'package:marvel/src/widgets/inputs.dart';
import 'package:marvel/src/widgets/site_button.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Container(
        height: screenHeight,
        width: screenWidth,
        decoration: const BoxDecoration(color: Colors.black),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              const SizedBox(height: 120),
              SvgPicture.asset(
                AppAssets.lgLogo,
              ),
              const SizedBox(height: 50),
              Input(
                controller: _emailController,
                keyboardType: TextInputType.emailAddress,
                placeholder: 'Enter your email ID',
              ),
              const SizedBox(height: 10),
              InputPassword(
                controller: _passwordController,
                placeholder: 'Password',
              ),
              const SizedBox(height: 20),
              Button(
                  title: 'Signup',
                  onPressed: () => {},
                  backgroundColor: false,
                  textStyle: const TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold),
                  height: 50),
              const SizedBox(height: 5),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  GestureDetector(
                    child: const Text(
                      "Forgor Passord?",
                      style: TextStyle(
                          color: Colors.grey, fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              const Text(
                "or",
                style: TextStyle(
                    color: Colors.white54,
                    fontWeight: FontWeight.w800,
                    fontSize: 20),
              ),
              const SizedBox(height: 10),
              const Text(
                "Continue With",
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w800,
                    fontSize: 20),
              ),
              const SizedBox(height: 20),
              const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SiteButton(title: "Facebook", logoURL: AppAssets.facebook),
                  SiteButton(title: "Google", logoURL: AppAssets.google)
                ],
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "Already have another account?",
                    style: TextStyle(
                      color: Colors.white54,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                  const SizedBox(width: 2),
                  GestureDetector(
                    onTap: () => {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (context) => const LogIn()),
                      )
                    },
                    child: const Text(
                      "Login",
                      style: TextStyle(
                          color: Color(0xFFED1B24),
                          fontWeight: FontWeight.w800),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
