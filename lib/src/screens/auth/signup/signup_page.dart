import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:marvel/src/utils/constants.dart';
import 'package:marvel/src/widgets/input_password.dart';
import 'package:marvel/src/widgets/inputs.dart';

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
                style: TextStyle(fontWeight: FontWeight.w800, fontSize: 20),
              ),
              const SizedBox(height: 10),
              const Text(
                "Continue With",
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w800,
                    fontSize: 20),
              )
            ],
          ),
        ),
      ),
    );
  }
}
