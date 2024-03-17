import 'package:empower_health/core/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../animations/button_animation.dart';

class PrimaryButton extends StatelessWidget {
  final VoidCallback onTap;
  final String text;
  final double? width;
  final double? height;
  final double? borderRadius;
  final double? fontSize;
  final IconData? icon;
  final Color? color;
  final Color? textColor;
  const PrimaryButton({
    required this.onTap,
    required this.text,
    this.height,
    this.width,
    this.borderRadius,
    this.fontSize,
    this.color,
    super.key,
    this.icon,
    this.textColor,
  });
  @override
  Widget build(BuildContext context) {
    return ButtonAnimation(
      onTap: onTap,
      child: Container(
        height: height ?? 40.h,
        alignment: Alignment.center,
        width: width ?? 150.w,
        decoration: BoxDecoration(
          color: color ?? AppColors.primary,
          borderRadius: BorderRadius.circular(borderRadius ?? 12.r),
        ),
        child: icon != null
            ? Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    text,
                    style: TextStyle(
                      color: textColor ?? Colors.white,
                      fontSize: fontSize ?? 16.sp,
                    ),
                  ),
                  SizedBox(width: 3.w),
                  Icon(icon, color: AppColors.white),
                ],
              )
            : Text(
                text,
                style: TextStyle(
                  color: textColor ?? AppColors.white,
                  fontSize: fontSize ?? 16.sp,
                ),
              ),
      ),
    );
  }
}
