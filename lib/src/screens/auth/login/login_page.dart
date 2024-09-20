import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:marvel/src/utils/constants.dart';
import 'package:marvel/src/widgets/input_password.dart';
import 'package:marvel/src/widgets/inputs.dart';

class LogIn extends StatefulWidget {
  const LogIn({super.key});

  @override
  State<LogIn> createState() => _LogInState();
}

class _LogInState extends State<LogIn> {
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
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset(
                AppAssets.lgLogo,
              ),
              Input(
                controller: _emailController,
                keyboardType: TextInputType.emailAddress,
                placeholder: 'Enter your email ID',
              ),
              const SizedBox(height: 10),
              InputPassword(
                controller: _passwordController,
                placeholder: 'Password',
              )
            ],
          ),
        ),
      ),
    );
  }
}
