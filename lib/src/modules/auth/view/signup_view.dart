import 'package:arabian_gold_diamonds/app/routes/app_pages.dart';
import 'package:arabian_gold_diamonds/app/themedata/appcolor.dart';
import 'package:arabian_gold_diamonds/app/utils/spaces.dart';
import 'package:arabian_gold_diamonds/gen/assets.gen.dart';
import 'package:arabian_gold_diamonds/src/core/app_text_field.dart';
import 'package:arabian_gold_diamonds/src/core/appbar_button.dart';
import 'package:arabian_gold_diamonds/src/core/appbutton.dart';
import 'package:arabian_gold_diamonds/src/modules/auth/controller/auth_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class SignupView extends StatelessWidget {
  final email = TextEditingController();
  final password = TextEditingController();
  final confirmPassword = TextEditingController();
  final authController = Get.put(AuthController());
  final _formKey = GlobalKey<FormState>();

  SignupView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.white,
        centerTitle: true,
        // leading: AppbarBackbutton(),
        // leadingWidth: 80.w,
        title: Image.asset(Assets.icons.brandname.keyName),
      ),
      backgroundColor: Colors.white,

      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                /// BACK BUTTON
                Image.asset(Assets.images.logo.keyName),

                /// TITLE
                Text(
                  "Sign up",
                  style: TextStyle(
                    fontFamily: "Inter",
                    fontSize: 26.sp,
                    fontWeight: FontWeight.w700,
                  ),
                ),

                defaultSpacer24,

                /// SIGNUP FORM CARD
                Container(
                  padding: EdgeInsets.all(16.w),
                  decoration: BoxDecoration(
                    color: AppColors.loginbg, // same bg as login card
                    borderRadius: BorderRadius.circular(16.r),
                  ),
                  child: Column(
                    children: [
                      /// EMAIL
                      AppTextField(
                        label: "Email",
                        hint: "Enter Email",
                        controller: email,
                        validator: (v) {
                          if (v == null || v.isEmpty)
                            return "Email is required";
                          if (!GetUtils.isEmail(v)) return "Enter valid email";
                          return null;
                        },
                      ),

                      defaultSpacer,

                      /// PASSWORD
                      AppTextField(
                        label: "Create Password",
                        hint: "Enter Password",
                        controller: password,
                        validator: (v) {
                          if (v == null || v.isEmpty)
                            return "Password required";
                          if (v.length < 3) return "Minimum 3 characters";
                          return null;
                        },
                      ),

                      defaultSpacer,

                      /// CONFIRM PASSWORD
                      AppTextField(
                        label: "Confirm Password",
                        hint: "Enter Password",
                        controller: confirmPassword,
                        isPassword: true,
                        validator: (v) {
                          if (v == null || v.isEmpty)
                            return "Password required";
                          if (v.length < 3) return "Minimum 3 characters";
                          return null;
                        },
                      ),

                      defaultSpacer,

                      /// TOGGLE OFFERS
                    ],
                  ),
                ),

                defaultSpacerLarge,
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Transform.scale(
                      scale: 0.75, // 🔥 makes switch smaller like your design
                      child: Switch(
                        value: true,
                        onChanged: (v) {},
                        activeColor: Colors.white,
                        activeTrackColor: AppColors.gold500, // gold track
                        inactiveThumbColor: Colors.grey.shade300,
                        inactiveTrackColor: Colors.grey.shade400,
                      ),
                    ),

                    SizedBox(width: 6.w),

                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Get offers and Promotions",
                          style: TextStyle(
                            fontSize: 14.sp,
                            fontFamily: "Inter",
                            fontWeight: FontWeight.w600,
                            color: Colors.black87,
                          ),
                        ),
                        SizedBox(height: 2.h),
                        Text(
                          "Get weekly Offers via email.",
                          style: TextStyle(
                            fontSize: 12.sp,
                            fontFamily: "Inter",
                            color: Colors.grey,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                defaultSpacerSmall,

                /// CREATE ACCOUNT BUTTON
                Obx(() {
                  return AppButton(
                    title: "Create account",
                    isLoading: authController.isLoading.value,
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        authController.signup(
                          email.text.trim(),
                          password.text.trim(),
                        );
                      }
                    },
                  );
                }),

                SizedBox(height: 20.h),

                /// FOOTER
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Already have an account?",
                      style: TextStyle(fontSize: 14.sp),
                    ),
                    SizedBox(width: 4.w),
                    GestureDetector(
                      onTap: () => Get.toNamed(Routes.loginscreen),
                      child: Text(
                        "Log in",
                        style: TextStyle(
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w600,
                          color: AppColors.textColordefault,
                        ),
                      ),
                    ),
                  ],
                ),

                SizedBox(height: 40.h),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
