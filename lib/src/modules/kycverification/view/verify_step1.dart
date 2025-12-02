import 'package:arabian_gold_diamonds/app/themedata/appcolor.dart';
import 'package:arabian_gold_diamonds/app/themedata/text_style.dart';
import 'package:arabian_gold_diamonds/app/utils/spaces.dart';
import 'package:arabian_gold_diamonds/gen/assets.gen.dart';
import 'package:arabian_gold_diamonds/src/core/app_text_field.dart';
import 'package:arabian_gold_diamonds/src/core/appbutton.dart';

import 'package:arabian_gold_diamonds/src/modules/kycverification/controller/kyc_controller.dart';
import 'package:arabian_gold_diamonds/src/modules/kycverification/view/widgets/step_header.dart';
import 'package:arabian_gold_diamonds/src/modules/kycverification/view/verify_step2.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class VerifyStep1 extends StatelessWidget {
  final KycController controller = Get.put(KycController());
  final _formKey = GlobalKey<FormState>();
  final _nomineeFormKey = GlobalKey<FormState>(); // For nominee section

  VerifyStep1({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        backgroundColor: AppColors.white,
        centerTitle: true,
        // leading: AppbarBackbutton(),
        // leadingWidth: 80.w,
        title: Image.asset(Assets.icons.brandname.keyName),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // IconButton(
                //   onPressed: () => Get.back(),
                //   icon: Icon(Icons.arrow_back_ios_new),
                // ),
                StepHeader(step: 1),

                SizedBox(height: 20.h),

                /// Purple top card
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
                    crossAxisAlignment: CrossAxisAlignment
                        .center, // 🔥 ensures center alignment
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

                defaultSpacerLarge,

                /// Form Card
                Container(
                  padding: EdgeInsets.all(16.w),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(18.r),
                    border: Border.all(color: AppColors.veriffybordercolor),
                    boxShadow: [
                      BoxShadow(color: Colors.black12, blurRadius: 8),
                    ],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      RichText(
                        text: TextSpan(
                          children: [
                            TextSpan(
                              text: "Full Name ",
                              style: verifylablestyle,
                            ),
                            TextSpan(
                              text: "(As per Government ID)",
                              style: verifylablestyle.copyWith(
                                color: Color(0xFF6D696E),
                              ),
                            ),
                          ],
                        ),
                      ),
                      AppTextField(
                        //  label: "Full Name (As per Government ID)",
                        lablestyle: verifylablestyle,
                        hint: "Enter your full name",
                        controller: controller.nameCtrl,
                      ),
                      defaultSpacer,

                      AppTextField(
                        lablestyle: verifylablestyle,

                        label: "Date of Birth",
                        hint: "mm/dd/yyyy",
                        controller: controller.dobCtrl,
                        suffixIcon: Icon(Icons.calendar_month),
                      ),
                      defaultSpacer,

                      AppTextField(
                        lablestyle: verifylablestyle,

                        label: "Phone Number",
                        hint: "Enter your phone",
                        controller: controller.phoneCtrl,
                      ),
                      defaultSpacer,
                      AppTextField(
                        lablestyle: verifylablestyle,
                        readOnly: true,
                        label: "Nationality",
                        hint: "Enter your phone",
                        controller: controller.nationalityCtrl,
                      ),

                      /// Dropdown 1
                      //_dropdown("Nationality", ["UAE", "India", "UK"]),
                      defaultSpacer,
                      AppTextField(
                        lablestyle: verifylablestyle,
                        readOnly: true,
                        label: "Select Document Type",
                        hint: "Emirates ID",
                        controller: controller.EmiratesIDCtrl,
                      ),

                      /// Dropdown 2
                      // _dropdown("Select Document Type", [
                      //   "Emirates ID",
                      //   "Passport",
                      // ]),
                      defaultSpacer,

                      AppTextField(
                        lablestyle: verifylablestyle,

                        label: "Doc Num",
                        hint: "Enter ID number",
                        controller: controller.docNumCtrl,
                      ),

                      SizedBox(height: 20.h),

                      Row(
                        children: [
                          _photoBox("Upload Front", true),
                          SizedBox(width: 20.w),
                          _photoBox("Upload Back", false),
                        ],
                      ),

                      SizedBox(height: 20.h),

                      addNomineeBox(),
                      Obx(() {
                        if (!controller.isnominee.value)
                          return SizedBox.shrink();

                        return Form(
                          key: _nomineeFormKey,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(height: 20),

                              // ---------------------------
                              //  NOMINEE RELATIONSHIP
                              // ---------------------------
                              SizedBox(height: 8),
                              AppTextField(
                                lablestyle: verifylablestyle,
                                readOnly: true,
                                label: "Nominee Relationship",
                                hint: "Emirates ID",
                                controller: controller.nomineeRelationshipCtrl,
                              ),

                              SizedBox(height: 25),

                              // ---------------------------
                              // NOMINEE DETAILS TITLE
                              // ---------------------------
                              Text(
                                "Nominee Details",
                                style: TextStyle(
                                  fontFamily: "Inter",
                                  fontSize: 18.sp,
                                  fontWeight: FontWeight.w700,
                                  color: Colors.black,
                                ),
                              ),

                              SizedBox(height: 20),

                              // ---------------------------
                              // SELECT DOCUMENT TYPE
                              // ---------------------------
                              AppTextField(
                                lablestyle: verifylablestyle,
                                readOnly: true,
                                label: "Select Document Type",
                                hint: "Emirates ID",
                                controller: controller.EmiratesIDCtrl,
                              ),

                              SizedBox(height: 25),

                              // ---------------------------
                              // FULL NAME
                              // ---------------------------
                              RichText(
                                text: TextSpan(
                                  children: [
                                    TextSpan(
                                      text: "Full Name ",
                                      style: verifylablestyle,
                                    ),
                                    TextSpan(
                                      text: "(Asper the ID)",
                                      style: verifylablestyle.copyWith(
                                        color: Colors.grey,
                                      ),
                                    ),
                                  ],
                                ),
                              ),

                              AppTextField(
                                hint: "Enter your full name",
                                controller: controller.nomineeNameCtrl,
                              ),

                              SizedBox(height: 20),

                              // ---------------------------
                              // CONTACTS
                              // ---------------------------
                              Text(
                                "Contacts",
                                style: verifylablestyle.copyWith(
                                  color: AppColors.secondary500,
                                ),
                              ),

                              AppTextField(
                                hint: "Enter nominee phone number",
                                controller: controller.nomineePhoneCtrl,
                              ),

                              SizedBox(height: 20),

                              // ---------------------------
                              // FRONT + BACK PHOTO
                              // ---------------------------
                              Row(
                                children: [
                                  _nomineePhotoBox("Upload Front Side", true),
                                  SizedBox(width: 14),
                                  _nomineePhotoBox("Upload Back Side", false),
                                ],
                              ),

                              SizedBox(height: 30),
                            ],
                          ),
                        );
                      }),
                    ],
                  ),
                ),

                SizedBox(height: 25.h),

                AppButton(
                  title: "Continue →",
                  onPressed: () {
                    if (!_formKey.currentState!.validate()) {
                      Get.snackbar(
                        "Validation",
                        "Please fill all required fields",
                      );
                      return;
                    }

                    if (controller.frontImage.value == null) {
                      Get.snackbar("Error", "Front document image required");
                      return;
                    }

                    if (controller.backImage.value == null) {
                      Get.snackbar("Error", "Back document image required");
                      return;
                    }

                    if (controller.isnominee.value) {
                      if (!_nomineeFormKey.currentState!.validate()) {
                        Get.snackbar(
                          "Validation",
                          "Please complete nominee details",
                        );
                        return;
                      }

                      if (controller.nomineeFrontImage.value == null) {
                        Get.snackbar("Error", "Nominee front image required");
                        return;
                      }

                      if (controller.nomineeBackImage.value == null) {
                        Get.snackbar("Error", "Nominee back image required");
                        return;
                      }
                    }

                    // SUCCESS → NEXT STEP
                    Get.to(() => VerifyStep2());
                  },
                ),

                SizedBox(height: 20.h),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget addNomineeBox() {
    return Obx(() {
      return Container(
        width: double.infinity,
        padding: EdgeInsets.symmetric(vertical: 18.h, horizontal: 16.w),
        decoration: BoxDecoration(
          color: const Color(0xFFF7F8FC), // soft background
          borderRadius: BorderRadius.circular(24.r),
        ),
        child: Stack(
          children: [
            /// TEXT SECTION
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                /// TITLE
                Text("Add Nominee", style: photoverifictStyle),

                SizedBox(height: 4.h),

                /// OPTIONAL STEP
                Text(
                  "Optional step",
                  style: photoverifictStyle.copyWith(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w400,
                    color: Color(0xFF6B7280),
                  ),
                ),

                SizedBox(height: 14.h),

                /// DESCRIPTION
                Text(
                  "You can add nominee details now or skip for later",
                  style: photoverifictStyle.copyWith(
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w400,
                    color: Color(0xFF9CA3AF),
                  ),
                ),
              ],
            ),

            /// SWITCH — aligned right
            Positioned(
              right: 0,
              top: 0,
              child: Switch(
                value: controller.isnominee.value,
                activeColor: AppColors.gold500,
                onChanged: (v) => controller.isnominee.value = v,
              ),
            ),
          ],
        ),
      );
    });
  }

  Widget _photoBox(String label, bool isFront) {
    return Expanded(
      child: InkWell(
        onTap: () {
          if (isFront) {
            controller.pickFrontImage();
          } else {
            controller.pickBackImage();
          }
        },
        child: Obx(() {
          final file = isFront
              ? controller.frontImage.value
              : controller.backImage.value;

          return Container(
            height: 130.h,
            padding: EdgeInsets.all(12.w),
            decoration: BoxDecoration(
              border: Border.all(color: AppColors.bordercolor),
              borderRadius: BorderRadius.circular(14.r),
            ),
            child: file == null
                ? Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.camera_alt, size: 30.sp),
                      SizedBox(height: 8),
                      Text(label),
                      Text(
                        "Tap to capture",
                        style: TextStyle(color: Colors.grey),
                      ),
                    ],
                  )
                : ClipRRect(
                    borderRadius: BorderRadius.circular(12.r),
                    child: Image.file(
                      file,
                      fit: BoxFit.cover,
                      width: double.infinity,
                    ),
                  ),
          );
        }),
      ),
    );
  }

  Widget _nomineePhotoBox(String label, bool isFront) {
    return Expanded(
      child: InkWell(
        onTap: () {
          if (isFront) {
            controller.pickNomineeFront();
          } else {
            controller.pickNomineeBack();
          }
        },
        child: Obx(() {
          final file = isFront
              ? controller.nomineeFrontImage.value
              : controller.nomineeBackImage.value;

          return Container(
            height: 130.h,
            padding: EdgeInsets.all(12.w),
            decoration: BoxDecoration(
              border: Border.all(color: AppColors.bordercolor),
              borderRadius: BorderRadius.circular(14.r),
            ),
            child: file == null
                ? Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.camera_alt, size: 30.sp),
                      SizedBox(height: 8),
                      Text(label),
                      Text(
                        "Tap to capture",
                        style: TextStyle(color: Colors.grey),
                      ),
                    ],
                  )
                : ClipRRect(
                    borderRadius: BorderRadius.circular(12.r),
                    child: Image.file(
                      file,
                      fit: BoxFit.cover,
                      width: double.infinity,
                    ),
                  ),
          );
        }),
      ),
    );
  }
}
