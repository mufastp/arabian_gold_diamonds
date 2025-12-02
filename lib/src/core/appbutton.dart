import 'package:arabian_gold_diamonds/app/themedata/text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:arabian_gold_diamonds/app/themedata/appcolor.dart';

class AppButton extends StatelessWidget {
  final String title;
  final bool isLoading;
  final VoidCallback onPressed;
  final double? width;
  final double height;
  final double radius;
  final Color? color;
  final TextStyle? textStyle;

  const AppButton({
    super.key,
    required this.title,
    required this.onPressed,
    this.isLoading = false,
    this.width,
    this.height = 52,
    this.radius = 10,
    this.color,
    this.textStyle,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width ?? double.infinity,
      height: height.h,
      child: ElevatedButton(
        onPressed: isLoading ? null : onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: color ?? AppColors.gold500,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(radius.r),
          ),
        ),
        child: isLoading
            ? SizedBox(
                height: 22.h,
                width: 22.h,
                child: CircularProgressIndicator(
                  color: Colors.white,
                  strokeWidth: 2,
                ),
              )
            : Text(
                title,
                style: textStyle ??

                    buttonstyle,
              ),
      ),
    );
  }
}
