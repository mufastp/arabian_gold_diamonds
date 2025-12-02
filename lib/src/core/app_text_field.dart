import 'package:arabian_gold_diamonds/app/themedata/appcolor.dart';
import 'package:arabian_gold_diamonds/app/themedata/text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppTextField extends StatefulWidget {
  final String? label;
  final String hint;
  final TextEditingController controller;
  final bool isPassword;
  final TextInputType keyboardType;
  final TextStyle? lablestyle;

  // Extra features from old widget
  final bool readOnly;
  final bool digitsOnly;
  final bool filled;
  final Color? fillColor;
  final int maxLines;
  final double borderRadius;
  final double hintSize;
  final Color? hintColor;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final Function()? onTap;
  final Function(String)? onChanged;
  final FormFieldValidator<String>? validator;

  const AppTextField({
    super.key,
     this.label,
     this.lablestyle,
    required this.hint,
    required this.controller,
    this.isPassword = false,
    this.keyboardType = TextInputType.text,

    // old widget props
    this.readOnly = false,
    this.digitsOnly = false,
    this.filled = false,
    this.fillColor,
    this.maxLines = 1,
    this.borderRadius = 10,
    this.hintSize = 15,
    this.hintColor,
    this.prefixIcon,
    this.suffixIcon,
    this.onTap,
    this.onChanged,
    this.validator,
  });

  @override
  State<AppTextField> createState() => _AppTextFieldState();
}

class _AppTextFieldState extends State<AppTextField> {
  bool _obscure = false;

  @override
  void initState() {
    super.initState();
    _obscure = widget.isPassword;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        /// LABEL
       widget.label==""||widget.label==null?SizedBox(): Text(
          widget.label??"",
          style:widget.lablestyle?? textFieldlable, // your model text style
        ),
        SizedBox(height: 6.h),

        /// TEXTFIELD WRAPPER
        Container(
          decoration: BoxDecoration(
            color: widget.filled
                ? widget.fillColor ?? Colors.white
                : Colors.white,
            borderRadius: BorderRadius.circular(widget.borderRadius.r),
            border: Border.all(
              color: const Color(0xFFD7D7D7),
              width: 1,
            ),
          ),
          padding: EdgeInsets.only(left: 14.w),

          child: TextFormField(
            validator: widget.validator,
            controller: widget.controller,
            keyboardType: widget.keyboardType,
            readOnly: widget.readOnly,
            obscureText: _obscure,
            maxLines: widget.maxLines,
            onTap: widget.onTap,
            onChanged: widget.onChanged,

            inputFormatters: widget.digitsOnly
                ? [FilteringTextInputFormatter.digitsOnly]
                : [],

            style: TextStyle(
              fontSize: 15.sp,
              fontFamily: "Inter",
              color: Colors.black87,
            ),

            decoration: InputDecoration(
              border: InputBorder.none,
              hintText: widget.hint,
              hintStyle: TextStyle(
                fontFamily: "Inter",
                fontSize: widget.hintSize.sp,
                color: widget.hintColor ?? Colors.grey,
              ),

              /// PREFIX ICON
              prefixIcon: widget.prefixIcon,

              /// SUFFIX ICON (password toggle or custom)
              suffixIcon: widget.isPassword
                  ? GestureDetector(
                      onTap: () => setState(() => _obscure = !_obscure),
                      child: Icon(
                        _obscure ? Icons.visibility_off : Icons.visibility,
                        color: Colors.black54,
                      ),
                    )
                  : widget.suffixIcon,
            ),
          ),
        ),
      ],
    );
  }
}
