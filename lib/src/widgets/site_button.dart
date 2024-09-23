import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class SiteButton extends StatelessWidget {
  final String title;
  final String logoURL;
  const SiteButton({super.key, required this.title, required this.logoURL});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(4),
      height: 50,
      width: 120,
      margin: const EdgeInsets.symmetric(horizontal: 8),
      color: Colors.white,
      child: Row(
        children: [
          SvgPicture.asset(
            logoURL,
          ),
          const SizedBox(width: 5),
          Text(
            title,
            style: const TextStyle(fontWeight: FontWeight.bold),
          )
        ],
      ),
    );
  }
}
