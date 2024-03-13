import 'package:empower_health/core/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppDecoration {
  static BoxDecoration style(
          {Color? color = AppColors.white,
          double? borderRadius,
          bool withShadow = true}) =>
      BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(borderRadius ?? 10.r),
        boxShadow: [
          if (withShadow)
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 5,
              blurRadius: 7,
              offset: const Offset(0, 3),
            ),
        ],
      );
}
