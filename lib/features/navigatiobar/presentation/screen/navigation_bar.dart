import 'package:ficonsax/ficonsax.dart';
import 'package:flutter/material.dart';
import 'package:fruit_app/core/utils/constants/colors.dart';
import 'package:fruit_app/core/utils/helper/helper_functions.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import '../controller/navigation_bar_controller.dart';

class NavigationMenu extends StatelessWidget {
  const NavigationMenu({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(NavigationController());
    List<IconData> iconsBefore = [
      IconsaxOutline.home,
      IconsaxOutline.shop,
      IconsaxOutline.heart,
      IconsaxOutline.profile_circle,
    ];
    List<IconData> iconsAfter = [
      IconsaxBold.home,
      IconsaxBold.shop,
      IconsaxBold.heart,
      IconsaxBold.profile_circle,
    ];
    List<String> labelIcon = [
      "Home",
      "Shop",
      "Favorite",
      "Profile",
    ];

    return Scaffold(
      bottomNavigationBar: BottomAppBar(
        shape: const CircularNotchedRectangle(),
        notchMargin: 8.0,
        height: FHelperFunctions.screenHeight() * 0.12,
        child: SizedBox(
          // height: 50.0,
          child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                IconAnimationNav(iconBefore: iconsBefore[0], controller: controller, iconAfter: iconsAfter[0], text: labelIcon[0], index: 0),
                IconAnimationNav(iconBefore: iconsBefore[1], controller: controller, iconAfter: iconsAfter[1], text: labelIcon[1], index: 1),
                const SizedBox(),
                IconAnimationNav(iconBefore: iconsBefore[2], controller: controller, iconAfter: iconsAfter[2], text: labelIcon[2], index: 2),
                IconAnimationNav(iconBefore: iconsBefore[3], controller: controller, iconAfter: iconsAfter[3], text: labelIcon[3], index: 3)
              ]),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Add the action you want to perform on button press
        },
        backgroundColor: FColors.primary,
        child: const Icon(Iconsax.scan_barcode4),
      ),
      body: Obx(() => controller.screens[controller.selectedIconIndex.value]),
    );
  }
}

class IconAnimationNav extends StatelessWidget {
  const IconAnimationNav(
      {Key? key,
      required this.iconBefore,
      required this.controller,
      required this.iconAfter,
      required this.text,
      required this.index})
      : super(key: key);

  final IconData iconBefore;
  final NavigationController controller;
  final IconData iconAfter;
  final String text;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Obx(
          () => AnimatedCrossFade(

            duration: const Duration(milliseconds: 500),
            firstChild: IconButton(
              icon: Icon(iconBefore, size: 30),
              color: Colors.black87,
              onPressed: () => controller.toggleIcon(index),
            ),
            secondChild: IconButton(
              icon: Icon(iconAfter, size: 30),
              color: Colors.black87,
              onPressed: () => controller.toggleIcon(index),
            ),
            crossFadeState: (controller.selectedIconIndex.value == index)
                ? CrossFadeState.showSecond
                : CrossFadeState.showFirst,
          ),
        ),
        Obx(
          () => Text(
            text,
            style: TextStyle(
                fontFamily: 'Poppins',
                fontSize: 14,
                fontWeight: (controller.selectedIconIndex.value == index)
                    ? FontWeight.w600
                    : FontWeight.w100),
          ),
        ),
      ],
    );
  }
}