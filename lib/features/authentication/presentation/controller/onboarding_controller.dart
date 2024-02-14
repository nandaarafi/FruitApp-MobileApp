
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../screen/login.dart';


class AuthScreenController extends GetxController {
  static AuthScreenController get instance => Get.find();

  /// Variables
  /// final pageController = PageController();
  final pageController = PageController();
  RxBool isChecked = false.obs;
  RxBool isChecked_1 = false.obs;
  RxBool showPassword = false.obs;
  RxBool showPassword_2 = false.obs;
  Rx<int> currentPageIndex = 0.obs;

  /// Update Current Index when Page Scroll
  void updatePageIndicator(index) => currentPageIndex.value = index;

  /// Jump to the specific dot selected image
  void dotNavigationClick(index) {
    currentPageIndex.value = index;
    pageController.jumpTo(index);
  }
  /// Update Current Index & Jump to next page
  void nextPage() {
    if(currentPageIndex == 2) {
      Get.to(() => const LoginScreen());
      // Get.to(const SignInScreen());
    } else {
      int page = currentPageIndex.value + 1;
      pageController.jumpToPage(page);
    }
  }
  /// Update Current Index & Jump to the last Page
  void skipPage() {
    currentPageIndex.value = 2;
    pageController.jumpToPage(2);
  }



  void togglePasswordVisibility() {
    showPassword.value = !showPassword.value;
    update();
  }

  void togglePasswordVisibility_2() {
    showPassword_2.value = !showPassword_2.value;
    update();
  }

  void toggleCheckbox() {
    isChecked.value = !isChecked.value;
    update();
  }
  void toggleCheckbox_1() {
    isChecked_1.value = !isChecked_1.value;
    // update();
  }

  void ForgetPasswordPage() {
    // Get.to(() => ForgetPasswordPage());
  }

  void GoSignUpPage() {
    // Get.to(() => SignUpScreen());
  }
}