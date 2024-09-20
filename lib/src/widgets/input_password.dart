import 'package:flutter/material.dart';

class InputPassword extends StatefulWidget {
  final TextEditingController controller;
  final String placeholder;

  const InputPassword({
    super.key,
    required this.controller,
    required this.placeholder,
  });

  @override
  State<InputPassword> createState() => _InputPasswordState();
}

class _InputPasswordState extends State<InputPassword> {
  bool isObsecuredText = true;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.only(right: 5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: TextField(
              controller: widget.controller,
              keyboardType: TextInputType.text,
              obscureText: isObsecuredText,
              cursorColor: Colors.black,
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.white,
                hintText: widget.placeholder,
                hintStyle: const TextStyle(color: Colors.grey),
                border: InputBorder.none,
              ),
            ),
          ),
          const SizedBox(width: 10), // Add some spacing
          GestureDetector(
            onTap: () {
              setState(() {
                isObsecuredText =
                    !isObsecuredText; // Toggle the text visibility
              });
            },
            child: Text(
              isObsecuredText ? "Show" : "Hide", // Toggle button text
              style: const TextStyle(
                  color: Colors.grey, fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
    );
  }
}
