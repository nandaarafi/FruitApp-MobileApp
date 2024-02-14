import 'package:flutter/material.dart';
import 'package:fruit_app/core/utils/constants/colors.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';


import '../controller/onboarding_controller.dart';

class onBoardingDotNavigation extends StatelessWidget {
  const onBoardingDotNavigation({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = AuthScreenController.instance;

    return Positioned(
      bottom: kBottomNavigationBarHeight + 25,
      left: 24,
      child: SmoothPageIndicator(
        controller: controller.pageController,
        onDotClicked: controller.dotNavigationClick,
        count: 3,
        effect: const ExpandingDotsEffect(
            activeDotColor: FColors.dark,
            dotHeight: 6),
      ),
    );
  }
}