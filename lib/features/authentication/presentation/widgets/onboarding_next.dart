import 'package:fruit_app/core/utils/constants/colors.dart';
import 'package:fruit_app/features/authentication/presentation/controller/onboarding_controller.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';


class onBoardingNextNavigation extends StatelessWidget {
  const onBoardingNextNavigation({
    super.key,
  });

  @override
  Widget build(BuildContext context){

    return Positioned(
      right: 24,
      bottom: kBottomNavigationBarHeight,
      child: ElevatedButton(
        onPressed: () => AuthScreenController.instance.nextPage(),
        style: ElevatedButton.styleFrom(
            shape: const CircleBorder(),
              backgroundColor: FColors.black),
        child: const Icon(Iconsax.arrow_right_3,
            color: FColors.white),
      ),

    );
  }
}