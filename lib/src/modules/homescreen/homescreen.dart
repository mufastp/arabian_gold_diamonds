import 'package:arabian_gold_diamonds/app/routes/app_pages.dart';
import 'package:arabian_gold_diamonds/app/themedata/appcolor.dart';
import 'package:arabian_gold_diamonds/gen/assets.gen.dart';
import 'package:arabian_gold_diamonds/src/core/appbutton.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class HomeScreeen extends StatelessWidget {
  HomeScreeen({super.key});

  final storage = GetStorage();

  void logout() {
    storage.erase(); // clears token + user data
    Get.offAllNamed(Routes.loginscreen); // go to login screen
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      body: SafeArea(
        child: Center(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 22.w),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                /// LOGO
                Image.asset(
                  Assets.images.logo.keyName,
                  height: 140.h,
                ),

                SizedBox(height: 40.h),

                /// BUTTONS SECTION
                AppButton(
                  title: "Start Saving",
                  onPressed: () {},
                ),
                SizedBox(height: 18.h),

                AppButton(
                  title: "Gold Plans",
                  onPressed: () {},
                ),
                SizedBox(height: 18.h),

                AppButton(
                  title: "My Profile",
                  onPressed: () {},
                ),

                SizedBox(height: 40.h),

                /// LOGOUT BUTTON
                TextButton(
                  onPressed: logout,
                  child: Text(
                    "Logout",
                    style: TextStyle(
                      fontFamily: "Inter",
                      color: AppColors.gold500,
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
