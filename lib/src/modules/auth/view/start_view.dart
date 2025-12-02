
import 'package:arabian_gold_diamonds/app/routes/app_pages.dart';
import 'package:arabian_gold_diamonds/app/themedata/appcolor.dart';
import 'package:arabian_gold_diamonds/app/themedata/text_style.dart';
import 'package:arabian_gold_diamonds/app/utils/spaces.dart';
import 'package:arabian_gold_diamonds/gen/assets.gen.dart';
import 'package:arabian_gold_diamonds/src/core/appbutton.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class StartView extends StatelessWidget {
  const StartView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: Column(
            children: [
              SizedBox(height: 40.h),

              /// BIG LOGO IMAGE
              Container(
                height: 450.h,
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20.r),
                  image: DecorationImage(
                    image: AssetImage(Assets.images.startimage.keyName),
                    fit: BoxFit.fill,
                  ),
                ),
              ),

              defaultSpacerLarge,

              /// LOGIN BUTTON
              AppButton(
                
                title: "Login",
                onPressed: () => Get.toNamed(Routes.loginscreen),
                height: 50.h,
              ),

              SizedBox(height: 16.h),

              /// REGISTER BUTTON
              SizedBox(
                width: double.infinity,
                height: 50.h,
                child: OutlinedButton(
                  onPressed: () => Get.toNamed(Routes.signup),
                  style: OutlinedButton.styleFrom(
                    side: BorderSide(color: AppColors.gold500, width: 1.5),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12.r),
                    ),
                  ),
                  child: Text(
                    "Register",
                    style:goldbuttonstyle
                  ),
                ),
              ),

              SizedBox(height: 30.h),

              Text(
                "Make Investing Easy: Discover the Benefits of Gold!",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontFamily: "Inter",
                  fontSize: 13.sp,
                  color: Colors.black87,
                ),
              ),

              SizedBox(height: 20.h),

              Text(
                "Version 1.0",
                style: TextStyle(
                  color: Colors.grey[400],
                  fontSize: 12.sp,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
