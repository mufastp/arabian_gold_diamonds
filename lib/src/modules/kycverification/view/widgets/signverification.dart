import 'dart:io';
import 'package:arabian_gold_diamonds/app/themedata/appcolor.dart';
import 'package:arabian_gold_diamonds/app/themedata/text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:get/get.dart';
import '../../controller/kyc_controller.dart';

class PhotoVerificationBox2 extends StatelessWidget {
  final KycController controller = Get.find<KycController>();
  final VoidCallback onTap;

  PhotoVerificationBox2({super.key, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(24.r),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.06),
            blurRadius: 10,
            spreadRadius: 1,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          /// Title
          Text(
            "Photo Verification",
            style:photoverifictStyle
          ),

          SizedBox(height: 16.h),

          /// MAIN BOX
          Center(
            child: Obx(() {
              File? image = controller.signatureImage.value;

              return InkWell(
                onTap: controller.pickSignature,
                child: image == null
                    ? _dottedEmptyBox()
                    : _imagePreviewBox(image),
              );
            }),
          ),
        ],
      ),
    );
  }

  /// 🔹 DOTTED BORDER EMPTY BOX
  Widget _dottedEmptyBox() {
    return DottedBorder(
     options: RectDottedBorderOptions(
                  dashPattern: [3, 5],
                  strokeWidth: 1,
                  color: AppColors.bordercolor
                
                ),
      child: Container(
        width: 167.w,
        height: 144.h,
        padding: EdgeInsets.symmetric(vertical: 16.h, horizontal: 8.w),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20.r),
          color: Colors.white,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.camera_alt_rounded,
                size: 42.sp, color: AppColors.gold500),

            SizedBox(height: 12.h),

            Text(
              "Take Selfie Photo",
              style: TextStyle(
                fontFamily: "Inter",
                fontWeight: FontWeight.w600,
                fontSize: 17.sp,
                color: AppColors.secondary500,
              ),
            ),

            SizedBox(height: 6.h),

            Text(
              "Tap to capture",
              style: TextStyle(
                fontFamily: "Inter",
                fontWeight: FontWeight.w400,
                fontSize: 13.sp,
                color: Colors.grey,
              ),
            ),
          ],
        ),
      ),
    );
  }

  /// 🔹 IMAGE PREVIEW BOX + REMOVE BUTTON
  Widget _imagePreviewBox(File image) {
    return Stack(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(20.r),
          child: Image.file(
            image,
            width: 167.w,
            height: 144.h,
            fit: BoxFit.cover,
          ),
        ),

        /// REMOVE BUTTON (TOP RIGHT)
        Positioned(
          top: 6,
          right: 6,
          child: InkWell(
            onTap: controller.clearSelfie,
            child: Container(
              padding: EdgeInsets.all(4),
              decoration: BoxDecoration(
                color: Colors.black54,
                shape: BoxShape.circle,
              ),
              child: Icon(
                Icons.close,
                size: 18,
                color: Colors.white,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
