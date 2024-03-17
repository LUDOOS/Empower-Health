import 'package:empower_health/core/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppStyles {
  static BoxDecoration container(
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

  static TextStyle text({double? size, FontWeight? weight, Color? color}) =>
      TextStyle(
        fontSize: size ?? 24.sp,
        fontWeight: weight,
        color: color,
      );

  static TextStyle bigText({double? size, FontWeight? weight, Color? color}) =>
      TextStyle(
        fontSize: size ?? 24.sp,
        fontWeight: weight ?? FontWeight.w600,
        color: color ?? AppColors.darkBlue,
      );
  static TextStyle smallGreyText(
          {double? size, FontWeight? weight, Color? color}) =>
      TextStyle(
        fontSize: size ?? 11.sp,
        fontWeight: weight ?? FontWeight.normal,
        color: color ?? AppColors.grey,
      );

  static TextStyle smallSemiBold({double? size}) => TextStyle(
        fontSize: size ?? 14.sp,
        fontWeight: FontWeight.w600,
        color: const Color(0xff2980B9),
      );
}
