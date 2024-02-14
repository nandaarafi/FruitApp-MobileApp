import 'package:flutter/material.dart';


import '../controller/onboarding_controller.dart';

class onBoardingSkip extends StatelessWidget {
  const onBoardingSkip({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: kToolbarHeight,
      right: 24,
      child: TextButton(
          onPressed: () => AuthScreenController.instance.skipPage(),
          child: const Text('Skip')
      ),
    );
  }
}
