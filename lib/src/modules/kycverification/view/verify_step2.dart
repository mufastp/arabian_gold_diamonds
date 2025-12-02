import 'package:arabian_gold_diamonds/app/themedata/appcolor.dart';
import 'package:arabian_gold_diamonds/app/themedata/text_style.dart';
import 'package:arabian_gold_diamonds/app/utils/spaces.dart';
import 'package:arabian_gold_diamonds/gen/assets.gen.dart';
import 'package:arabian_gold_diamonds/src/core/appbutton.dart';
import 'package:arabian_gold_diamonds/src/modules/kycverification/controller/kyc_controller.dart';
import 'package:arabian_gold_diamonds/src/modules/kycverification/view/widgets/PhotoVerificationBox.dart';
import 'package:arabian_gold_diamonds/src/modules/kycverification/view/widgets/step_header.dart';
import 'package:arabian_gold_diamonds/src/modules/kycverification/view/verify_step3.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class VerifyStep2 extends StatelessWidget {
  final controller = Get.find<KycController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: Column(
            children: [
              StepHeader(step: 2),

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

              SizedBox(height: 20.h),

              /// Selfie box
              PhotoVerificationBox(onTap: () => controller.pickSelfie()),

              Spacer(),

              AppButton(
                title: "Continue →",
                onPressed: () => Get.to(() => VerifyStep3()),
              ),

              SizedBox(height: 20.h),
           
            ],
          ),
        ),
      ),
    );
  }
}
