import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ProfileAnimatedComponent extends StatelessWidget {
  final double height;
  final double width;
  final String image;
  final bool isReversed;

  const ProfileAnimatedComponent({
    super.key,
    required this.height,
    required this.width,
    required this.image,
    required this.isReversed,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: width,
      child: Stack(
        alignment: Alignment.center,
        children: [
          AnimatedSwitcher(
            duration: const Duration(seconds: 1),
            transitionBuilder: (Widget child, Animation<double> animation) {
              return FadeTransition(opacity: animation, child: child);
            },
            child: SvgPicture.asset(
              isReversed
                  ? 'assets/icons/round_red_rev.svg'
                  : 'assets/icons/round_red.svg',
              fit: BoxFit.cover,
              key: ValueKey<bool>(isReversed),
            ),
          ),
          Image.asset(
            image,
            fit: BoxFit.contain,
          ),
        ],
      ),
    );
  }
}
