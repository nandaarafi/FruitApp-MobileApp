
import 'package:flutter/material.dart';
import 'package:fruit_app/core/utils/constants/colors.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:iconsax/iconsax.dart';

import '../../features/home/presentation/screen/home.dart';






class NavigationMenu extends StatelessWidget {
  const NavigationMenu({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(NavigationController());

    return Scaffold(
      bottomNavigationBar:
      Obx(() => NavigationBar(
        height: 80,
        elevation: 0,
        selectedIndex: controller.selectedIndex.value,
        onDestinationSelected: (index) => controller.selectedIndex.value = index,
        backgroundColor: FColors.white,
        indicatorColor: FColors.black.withOpacity(0.1),

        destinations: const [
          NavigationDestination(icon: Icon(Iconsax.home), label: 'home'),
          NavigationDestination(icon: Icon(Iconsax.shop), label: 'Store'),
          NavigationDestination(icon: Icon(Iconsax.heart), label: 'Wishlist'),
          NavigationDestination(icon: Icon(Iconsax.user), label: 'Profile'),
        ],),),
      body: Obx(() => controller.screens[controller.selectedIndex.value]),
    );
  }
}


class NavigationController extends GetxController{
  final Rx<int> selectedIndex = 0.obs;
  final screens = [
    const HomeScreen(),
    Container(color: Colors.blue),
    Container(color: Colors.black)];
    // const SignOutScreen()];
// final screens = [
//   Container(color: Colors.green),
//   Container(color: Colors.blue),
//   Container(color: Colors.black),
//   Container(color: Colors.yellow)];
}
