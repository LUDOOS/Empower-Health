import 'package:empower_health/core/utils/app_colors.dart';
import 'package:empower_health/core/utils/app_images.dart';
import 'package:empower_health/core/utils/app_strings.dart';
import 'package:empower_health/core/utils/app_styles.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ServicesWidget extends StatelessWidget {
  const ServicesWidget({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 240.h,
      child: Row(
        children: [
          Expanded(
            child: Column(
              children: [
                const Expanded(child: ServiceCard(color: Color(0xffFDE2F6))),
                SizedBox(height: 10.h),
                const Expanded(child: ServiceCard(color: Color(0xffDBEDFF))),
              ],
            ),
          ),
          SizedBox(width: 20.w),
          Expanded(
            child: Column(
              children: [
                const Expanded(child: ServiceCard(color: Color(0xffDBEDFF))),
                SizedBox(height: 10.h),
                const Expanded(child: SizedBox.shrink()),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class ServiceCard extends StatelessWidget {
  const ServiceCard({
    super.key,
    required this.color,
  });
  final Color color;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 16.w),
      decoration: AppStyles.container(
        color: color,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              SvgPicture.asset(AppImages.scanDiagnosis),
              SizedBox(width: 5.w),
              Text(
                "medical analysis",
                style: TextStyle(
                  fontSize: 12.sp,
                  fontWeight: FontWeight.bold,
                  color: AppColors.darkBlue,
                ),
              ),
            ],
          ),
          SizedBox(height: 5.h),
          SizedBox(
            width: 128.w,
            height: 28.h,
            child: Text(
              AppStrings.showDetailed,
              style: TextStyle(
                fontSize: 7.sp,
                color: AppColors.darkBlue,
              ),
            ),
          ),
          SizedBox(height: 5.h),
          Text(
            "upload medical test",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 12.sp,
              color: AppColors.primary,
              decoration: TextDecoration.underline,
              decorationColor: AppColors.primary,
            ),
          ),
        ],
      ),
    );
  }
}
