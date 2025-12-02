import 'package:arabian_gold_diamonds/app/routes/app_pages.dart';
import 'package:arabian_gold_diamonds/app/themedata/appcolor.dart';
import 'package:arabian_gold_diamonds/app/utils/spaces.dart';
import 'package:arabian_gold_diamonds/gen/assets.gen.dart';
import 'package:arabian_gold_diamonds/src/core/app_text_field.dart';
import 'package:arabian_gold_diamonds/src/core/appbutton.dart';
import 'package:arabian_gold_diamonds/src/modules/auth/controller/auth_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class LoginView extends StatelessWidget {
  final email = TextEditingController();
  final password = TextEditingController();
  final authController = Get.put(AuthController());
  final _formKey = GlobalKey<FormState>();

  LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: 40.h),

                /// TOP PURPLE HEADER
                Container(
                  height: 120.h,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: AppColors.secondary500,
                    borderRadius: BorderRadius.circular(20.r),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "GOLD & DIAMONDS",
                        style: TextStyle(
                          fontSize: 16.sp,

                          color: AppColors.gold500,
                        ),
                      ),
                      defaultSpacer,
                      Image.asset(Assets.images.logo.keyName),
                    ],
                  ),
                ),

                SizedBox(height: 40.h),

                /// LOGIN TITLE
                Text(
                  "Login",
                  style: TextStyle(
                    fontFamily: "Inter",
                    fontSize: 26.sp,
                    fontWeight: FontWeight.w700,
                  ),
                ),

                SizedBox(height: 30.h),
                Container(
                  padding: EdgeInsets.all(16.w),
                  decoration: BoxDecoration(
                    color: AppColors.loginbg,
                    borderRadius: BorderRadius.circular(16.r),
                  ),

                  child: Column(
                    children: [
                      AppTextField(
                        label: "Email",
                        hint: "Enter Email",
                        controller: email,
                        keyboardType: TextInputType.emailAddress,
                        validator: (v) {
                          if (v == null || v.isEmpty)
                            return "Email is required";
                          if (!GetUtils.isEmail(v)) return "Enter valid email";
                          return null;
                        },
                      ),
                      defaultSpacer,

                      AppTextField(
                        label: "Password",
                        hint: "Enter Password",
                        controller: password,
                        isPassword: true,
                        validator: (v) {
                          if (v == null || v.isEmpty)
                            return "Password required";
                          if (v.length < 3) return "Minimum 3 characters";
                          return null;
                        },
                      ),
                    ],
                  ),
                ),

                SizedBox(height: 30.h),

                Obx(() {
                  return AppButton(
                    title: "Login",
                    isLoading: authController.isLoading.value,
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        authController.login(
                          email.text.trim(),
                          password.text.trim(),
                        );
                      }
                    },
                  );
                }),

                SizedBox(height: 12.h),

                TextButton(
                  onPressed: () {},
                  child: Text(
                    "Forgot Password?",
                    style: TextStyle(color: AppColors.gold500),
                  ),
                ),

                SizedBox(height: 20.h),

                SizedBox(height: 30.h),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("You don’t have an account?"),
                    SizedBox(width: 4),
                    GestureDetector(
                      onTap: () => Get.toNamed(Routes.signup),
                      child: Text(
                        "Sign up",
                        style: TextStyle(
                          fontFamily: "Inter",
                          color: AppColors.textColordefault,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _inputField(String label, String hint, TextEditingController ctrl) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyle(fontFamily: "Inter", fontSize: 14.sp),
        ),
        SizedBox(height: 6),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 14.w),
          decoration: BoxDecoration(
            color: Color(0xFFF8EED8),
            borderRadius: BorderRadius.circular(12.r),
          ),
          child: TextField(
            controller: ctrl,
            decoration: InputDecoration(
              border: InputBorder.none,
              hintText: hint,
            ),
          ),
        ),
      ],
    );
  }

  Widget _inputFieldPassword(
    String label,
    String hint,
    TextEditingController ctrl,
  ) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyle(fontFamily: "Inter", fontSize: 14.sp),
        ),
        SizedBox(height: 6),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 14.w),
          decoration: BoxDecoration(
            color: Color(0xFFF8EED8),
            borderRadius: BorderRadius.circular(12.r),
          ),
          child: TextField(
            controller: ctrl,
            obscureText: true,
            decoration: InputDecoration(
              border: InputBorder.none,
              hintText: hint,
              suffixIcon: Icon(Icons.visibility_off),
            ),
          ),
        ),
      ],
    );
  }
}
