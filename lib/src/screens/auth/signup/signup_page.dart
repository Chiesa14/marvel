import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:marvel/src/screens/auth/login/login_page.dart';
import 'package:marvel/src/services/auth_services.dart';
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
  bool isLoading = false;
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  void handleSignup(BuildContext context) async {
    setState(() {
      isLoading = true;
    });
    await AuthServices()
        .signUp(
            email: _emailController.text,
            password: _passwordController.text,
            context: context)
        .then((value) => {
              setState(() {
                isLoading = false;
              })
            });
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          height: screenHeight,
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
                  title: isLoading == true ? 'Loading...' : 'Signup',
                  onPressed: () => _emailController.text.isNotEmpty &&
                          _passwordController.text.isNotEmpty
                      ? handleSignup(context)
                      : null,
                  backgroundColor: _emailController.text.isNotEmpty &&
                          _passwordController.text.isNotEmpty
                      ? true
                      : false,
                  textStyle: const TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold),
                  height: 50,
                ),
                const SizedBox(height: 5),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    GestureDetector(
                      child: const Text(
                        "Forgot Password?",
                        style: TextStyle(
                            color: Colors.white54, fontWeight: FontWeight.bold),
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
                      "Don't have an account?",
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
                          MaterialPageRoute(
                              builder: (context) => const LogIn()),
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
      ),
    );
  }
}
