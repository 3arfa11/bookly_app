import 'package:bookly_app/core/utils/app_router.dart';
import 'package:bookly_app/core/utils/assets.dart';
import 'package:flutter/material.dart';

import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';

class SplashViewBody extends StatefulWidget {
  const SplashViewBody({
    super.key,
  });

  @override
  State<SplashViewBody> createState() => _SplashViewBodyState();
}

class _SplashViewBodyState extends State<SplashViewBody>
    with TickerProviderStateMixin {
  late AnimationController animationController;
  late Animation<Offset> slideAnimation;

  late AnimationController logoAnimationController;
  late Animation<Offset> logoSlideAnimation;

  @override
  void initState() {
    super.initState();
    // Initialize the animation controllers and animations
    // Initialize the text animation
    initSlidingAnimation();
    navigateToHomePage();
  }

  @override
  dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        AnimatedBuilder(
          animation: logoSlideAnimation,
          builder: (context, _) {
            return SlideTransition(
              position: logoSlideAnimation,
              child: SvgPicture.asset(
                AssetsData.appLogo,
                width: 320,
              ),
            );
          },
        ),
        const SizedBox(
          height: 20,
        ),
        AnimatedBuilder(
            animation: slideAnimation,
            builder: (context, _) {
              return SlideTransition(
                position: slideAnimation,
                child: const Text(
                  'Read Free Books',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              );
            }),
      ],
    );
  }

  void initSlidingAnimation() {
    animationController =
        AnimationController(vsync: this, duration: const Duration(seconds: 1));
    slideAnimation =
        Tween<Offset>(begin: const Offset(0, 3), end: const Offset(0, 0))
            .animate(animationController);
    animationController.forward();
    // Initialize the logo animation
    logoAnimationController =
        AnimationController(vsync: this, duration: const Duration(seconds: 1));
    logoSlideAnimation =
        Tween<Offset>(begin: const Offset(0, -3), end: const Offset(0, 0))
            .animate(logoAnimationController);
    logoAnimationController.forward();
  }

  void navigateToHomePage() {
    Future.delayed(const Duration(seconds: 2), () {
      if (context.mounted) {
        GoRouter.of(context).push(AppRouter.kHomeView);
      }
    });
  }
}
