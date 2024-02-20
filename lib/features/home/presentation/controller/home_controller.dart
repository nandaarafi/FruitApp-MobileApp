import 'package:carousel_slider/carousel_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class HomeScreenController extends GetxController {
  static HomeScreenController get instance => Get.find();

  final CarouselController carouselController = CarouselController();

  RxInt currentIndex = 0.obs;

}

// class SearchOwnController extends GetxController {
//   final TextEditingController textEditingController = TextEditingController();
//   final RxBool isSearchOpen = false.obs;
//
//   void openView() {
//     isSearchOpen.value = true;
//   }
//
//   void closeView(String selectedResult) {
//     isSearchOpen.value = false;
//     // Add your logic here to handle the selected result
//   }
// }
class SliderController extends GetxController {
  RxDouble currentSliderValue = 0.0.obs;
}