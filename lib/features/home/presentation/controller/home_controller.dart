import 'package:carousel_slider/carousel_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class HomeScreenController extends GetxController {
  static HomeScreenController get instance => Get.find();

  final CarouselController carouselController = CarouselController();

  RxInt currentIndex = 0.obs;

}