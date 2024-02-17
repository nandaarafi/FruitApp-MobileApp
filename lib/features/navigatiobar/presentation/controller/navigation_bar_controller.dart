import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../home/presentation/screen/home.dart';

class NavigationController extends GetxController {
  final Rx<int> selectedIndex = 0.obs;
  final RxList<Color> iconColors = [
    Colors.black, // Home
    Colors.black, // Store
    Colors.black, // Wishlist
    Colors.black, // Profile
  ].obs;
  final screens = [
    const HomeScreen(),
    Container(color: Colors.blue),
    Container(color: Colors.black),
    Container(color: Colors.red),
  ];

  final selectedIconIndex = 0.obs;

  void toggleIcon(int index) {
    if (selectedIconIndex.value == index) {
      selectedIconIndex.value = 0;
    } else {
      selectedIconIndex.value = index;
    }
  }
}

// const SignOutScreen()];
// final screens = [
//   Container(color: Colors.green),
//   Container(color: Colors.blue),
//   Container(color: Colors.black),
//   Container(color: Colors.yellow)];
