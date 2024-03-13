import 'package:empower_health/core/utils/app_colors.dart';
import 'package:empower_health/core/utils/app_images.dart';
import 'package:empower_health/core/utils/app_strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({
    super.key,
    this.icon = false,
    this.onPressed,
  });
  final bool icon;
  final Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40.h,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset(AppImages.logo, fit: BoxFit.contain),
          SizedBox(width: 9.w),
          Text(
            AppStrings.title,
            style: TextStyle(
              color: AppColors.primary,
              fontSize: 20.sp,
              fontWeight: FontWeight.bold,
            ),
          ),
          Spacer(),
          if (icon)
            IconButton(
              onPressed: onPressed,
              icon: const Icon(
                Icons.arrow_forward_rounded,
                color: AppColors.primary,
              ),
            )
        ],
      ),
    );
  }
}
