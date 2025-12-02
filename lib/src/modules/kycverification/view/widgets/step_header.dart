import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class StepHeader extends StatelessWidget {
  final int step;

  const StepHeader({super.key, required this.step});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("Step $step of 3"),
            Text(
              "ID Upload",
              style: TextStyle(
                color: Colors.black54,
                fontSize: 13.sp,
              ),
            ),
          ],
        ),
        SizedBox(height: 8.h),
        LinearProgressIndicator(
          value: step / 3,
          backgroundColor: Colors.grey.shade300,
          color: const Color(0xFFD09F56),
        ),
      ],
    );
  }
}
