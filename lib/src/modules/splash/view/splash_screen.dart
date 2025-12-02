import 'package:arabian_gold_diamonds/gen/assets.gen.dart';
import 'package:arabian_gold_diamonds/app/themedata/appcolor.dart';
import 'package:arabian_gold_diamonds/src/modules/splash/controller/splash_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class SplashView extends StatelessWidget {
  final controller = Get.put(SplashController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      body: SafeArea(
        child: Column(
          children: [
            /// MAIN LOGO CENTERED
            Expanded(
              child: Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Image.asset(
                      Assets.icons.splashlogo.keyName, // your AGD logo
                      height: 120.h,
                    ),
                    SizedBox(height: 20.h),
                  ],
                ),
              ),
            ),

            /// TAGLINE
            Padding(
              padding: EdgeInsets.only(bottom: 8.h),
              child: Text(
                "Make Investing Easy: Discover the Benefits of Gold!",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontFamily: "Inter",
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w400,
                  color: Colors.black87,
                ),
              ),
            ),

            /// VERSION TEXT
            Padding(
              padding: EdgeInsets.only(bottom: 22.h),
              child: Text(
                "Version 1.0",
                style: TextStyle(
                  fontFamily: "Inter",
                  fontSize: 13.sp,
                  color: Colors.grey,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
