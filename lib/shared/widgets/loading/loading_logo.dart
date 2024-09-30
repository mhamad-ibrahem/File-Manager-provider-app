import 'package:flutter/material.dart';

import '../../../core/common/assets/app_assets.dart';

class AnimatedLogo extends StatefulWidget {
  const AnimatedLogo({super.key, this.height, this.width});
  final double? height;
  final double? width;
  @override
  State<AnimatedLogo> createState() => _AnimatedLogoState();
}

class _AnimatedLogoState extends State<AnimatedLogo>
    with SingleTickerProviderStateMixin {
  late AnimationController animationController;
  late Animation<double> animation;
  @override
  void initState() {
    animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 900),
    )..repeat(reverse: true);

    animation = Tween<double>(
      begin: 0,
      end: 1,
    ).animate(animationController);
    super.initState();
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: animation,
      builder: (context, child) => AnimatedOpacity(
          opacity: animation.value,
          duration: const Duration(milliseconds: 900),
          child: SizedBox(
            height: widget.height ?? 100,
            width: widget.width ?? 100,
            child: Image.asset(AppAssets().appIcon),
          )),
    );
  }
}
