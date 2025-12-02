import 'package:arabian_gold_diamonds/app/themedata/appcolor.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';



class TcSnackbar {
  static void success(String title, String message) {
    _showSnackbar(
      title: title,
      message: message,
      backgroundColor: AppColors.successMain,
      textColor: Colors.white,
    );
  }

  static void warning(String title, String message) {
    _showSnackbar(
      title: title,
      message: message,
      backgroundColor: AppColors.warningMain,
      textColor: Colors.white,
    );
  }

  static void error(String title, String message) {
    _showSnackbar(
      title: title,
      message: message,
      backgroundColor: AppColors.errorMain,
      textColor: Colors.white,
    );
  }

  static void _showSnackbar({
    required String title,
    required String message,
    required Color backgroundColor,
    required Color textColor,
  }) {
    Get.snackbar(
      title,
      message,
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: backgroundColor,
      colorText: textColor,
      margin: const EdgeInsets.all(12),
      borderRadius: 8,
      duration: const Duration(seconds: 3),
    );
  }
}
