
import 'package:flutter/material.dart';
import 'package:fruit_app/core/utils/constants/images.dart';
import 'package:get/get.dart';

import '../controller/onboarding_controller.dart';
import '../widgets/on_boarding_dot_navigation.dart';
import '../widgets/onboarding_next.dart';
import '../widgets/onboarding_skip.dart';




class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(AuthScreenController());

    return Scaffold(
      body: Stack(
        children: [
          PageView(
            controller: controller.pageController,
            onPageChanged: controller.updatePageIndicator,
            children: const [
              onBoardingPage(
                  image: FImages.onBoardingImage1,
                  title: 'Choose your product',
                  subTitle: "Welcome to a World of Limitless Choices - Your Perfect Product Awaits!"
              ),
              onBoardingPage(
                  image: FImages.onBoardingImage2,
                  title: "Select Payment Method",
                  subTitle: "For Seamless Transactions, Choose Your Payment Path - Your Convenience, Our Priority!"
              ),
              onBoardingPage(
                  image: FImages.onBoardingImage3,
                  title: "Deliver at your door step",
                  subTitle: "From Our Doorstep to Yours - Swift, Secure, and Contactless Delivery!"
              ),
            ],
          ),
          // Skip button
          const onBoardingSkip(),

          // Dot Navigation SmoothPageIndicator
          const onBoardingDotNavigation(),

          // Circular Next Button
          const onBoardingNextNavigation(),
        ],
      ),
    );
  }
}



class onBoardingPage extends StatelessWidget {
  const onBoardingPage({super.key,
    required this.image,
    required this.title,
    required this.subTitle,
  });

  final String image, title, subTitle;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: Column(
        children: [
          Image(
            width: MediaQuery.of(Get.context!).size.width * 0.8,
            height: MediaQuery.of(Get.context!).size.height * 0.6,
            image: AssetImage(image),
          ),
          Text(
              title,
              style: Theme.of(context).textTheme.headlineMedium,
              textAlign: TextAlign.center
          ),
          const SizedBox(height: 16.0,),
          Text(
            subTitle,
            style: Theme.of(context).textTheme.bodyMedium,
            textAlign: TextAlign.center,
          )

        ],
      ),
    );
  }
}



