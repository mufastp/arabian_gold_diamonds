import 'package:arabian_gold_diamonds/app/themedata/appcolor.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class AppbarBackbutton extends StatelessWidget {
  const AppbarBackbutton({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40.h,
      width: 40.w,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.r),
        border: Border.all(color: AppColors.errorMain),
      ),
      child: IconButton(
        icon:  Icon(Icons.arrow_back, color: Colors.black),
        onPressed: () {
          Get.back();
        },
      ),
    );
  }
}
