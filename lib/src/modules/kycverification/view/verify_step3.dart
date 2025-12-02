import 'dart:io';
import 'package:arabian_gold_diamonds/app/themedata/appcolor.dart';
import 'package:arabian_gold_diamonds/app/themedata/text_style.dart';
import 'package:arabian_gold_diamonds/app/utils/spaces.dart';
import 'package:arabian_gold_diamonds/gen/assets.gen.dart';
import 'package:arabian_gold_diamonds/src/core/appbutton.dart';
import 'package:arabian_gold_diamonds/src/modules/kycverification/controller/kyc_controller.dart';
import 'package:arabian_gold_diamonds/src/modules/kycverification/view/widgets/signverification.dart';
import 'package:arabian_gold_diamonds/src/modules/kycverification/view/widgets/step_header.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class VerifyStep3 extends StatelessWidget {
  final controller = Get.find<KycController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              StepHeader(step: 3),

              SizedBox(height: 20.h),

              Container(
                width: double.infinity,
                padding: EdgeInsets.all(20.w),
                decoration: BoxDecoration(
                  color: AppColors.secondary500,
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(20.r),
                    bottomRight: Radius.circular(20.r),
                  ),
                ),
                child: Column(
                  crossAxisAlignment:
                      CrossAxisAlignment.center, // 🔥 ensures center alignment
                  children: [
                    Image.asset(Assets.icons.kycheadimage.keyName, scale: 4),
                    SizedBox(height: 10),

                    Text(
                      "Verify Your Identity",
                      style: kyccardtitle,
                      textAlign: TextAlign.center, // (Optional)
                    ),

                    defaultSpacer,

                    Text(
                      "Complete your KYC to start saving securely.",
                      style: kyccardsubtitle,
                      textAlign: TextAlign.center, // 🔥 THIS IS THE FIX
                    ),

                    defaultSpacerLarge,
                    defaultSpacerLarge,
                  ],
                ),
              ),
            PhotoVerificationBox2(onTap: () => controller.pickSignature()),

              /// CHECKBOX
              Obx(
                () => Row(
                  children: [
                    Checkbox(
                      value: controller.isAgreed.value,
                      activeColor: AppColors.gold500,
                      onChanged: (v) {
                        controller.isAgreed.value = v ?? false;
                      },
                    ),
                    const Text("I agree to the "),
                    Text(
                      "terms & policy",
                      style: TextStyle(
                        color: AppColors.gold500,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ),

              Spacer(),

              /// FINAL SUBMIT BUTTON
              AppButton(
                  title: "Finish",
                  isLoading: false,
                 
                     onPressed: () => controller.submitKyc(),
               
                ),

              SizedBox(height: 20.h),
            ],
          ),
        ),
      ),
    );
  }


  // 🔹 Signature Upload Box
  Widget _signatureBox() {
    return Obx(() {
      File? img = controller.signatureImage.value;

      return InkWell(
        onTap: controller.pickSignature,
        child: img == null
            ? _dottedEmptySignatureBox()
            : _signaturePreview(img),
      );
    });
  }

  /// When NO image is uploaded
  Widget _dottedEmptySignatureBox() {
    return DottedBorder(
      options: RectDottedBorderOptions(
        dashPattern: [3, 5],
        strokeWidth: 1,
        color: AppColors.bordercolor,
      ),
      child: Container(
        width: double.infinity,
        height: 150.h,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16.r),
          color: Colors.white,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.camera_alt_rounded,
              size: 40.sp,
              color: AppColors.gold500,
            ),
            SizedBox(height: 8),
            Text(
              "Take Sign Photo",
              style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 16.sp,
                fontFamily: "Inter",
                color: AppColors.secondary500,
              ),
            ),
            SizedBox(height: 4),
            Text(
              "Tap to capture",
              style: TextStyle(color: Colors.grey, fontSize: 13.sp),
            ),
          ],
        ),
      ),
    );
  }

  /// When IMAGE selected
  Widget _signaturePreview(File img) {
    return Stack(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(16.r),
          child: Image.file(
            img,
            width: double.infinity,
            height: 150.h,
            fit: BoxFit.cover,
          ),
        ),

        /// CLEAR BUTTON
        Positioned(
          top: 8,
          right: 8,
          child: InkWell(
            onTap: controller.clearSignature,
            child: Container(
              padding: EdgeInsets.all(5),
              decoration: const BoxDecoration(
                color: Colors.black54,
                shape: BoxShape.circle,
              ),
              child: const Icon(Icons.close, color: Colors.white, size: 18),
            ),
          ),
        ),
      ],
    );
  }
}
