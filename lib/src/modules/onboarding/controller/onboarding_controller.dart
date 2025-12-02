import 'package:arabian_gold_diamonds/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class OnboardingController extends GetxController {
  var pageIndex = 0.obs;

  void onPageChanged(int index) {
    pageIndex.value = index;
  }

  void nextPage(pageController) {
    if (pageIndex.value < 2) {
      pageController.nextPage(
        duration: Duration(milliseconds: 400),
        curve: Curves.ease,
      );
    } else {
      finish();
    }
  }

  void skip() {
    Get.offAllNamed(Routes.startpage);
  }

  void finish() {
    Get.offAllNamed(Routes.startpage);
  }
}
