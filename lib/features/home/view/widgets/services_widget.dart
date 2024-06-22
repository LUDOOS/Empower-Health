import 'package:empower_health/core/navigation/custom_navigator.dart';
import 'package:empower_health/core/navigation/routes.dart';
import 'package:empower_health/core/utils/app_colors.dart';
import 'package:empower_health/core/utils/app_strings.dart';
import 'package:empower_health/core/utils/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ServicesWidget extends StatelessWidget {
  const ServicesWidget({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300.h,
      child: Row(
        children: [
          Expanded(
            child: Column(
              children: [
                const Expanded(child: ServiceCard(color: Color(0xffFDE2F6), type: 'Liver',)),
                SizedBox(height: 10.h),
                const Expanded(child: ServiceCard(color: Color(0xffDBEDFF), type: 'Diabetes' )),
              ],
            ),
          ),
          SizedBox(width: 20.w),
          Expanded(
            child: Column(
              children: [
                const Expanded(child: ServiceCard(color: Color(0xffDBEDFF), type: 'Anemia',)),
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
    required this.type,
    this.height,
    this.width,
  });
  final Color color;
  final String type;
  final double? height;
  final double? width;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 16.w),
      decoration: AppStyles.container(
        color: color,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(
                type,
                style: TextStyle(
                  fontSize: 12.sp,
                  fontWeight: FontWeight.bold,
                  color: AppColors.darkBlue,
                ),
              ),
              Text(
                " medical analysis",
                style: TextStyle(
                  fontSize: 12.sp,
                  fontWeight: FontWeight.bold,
                  color: AppColors.darkBlue,
                ),
              ),
            ],
          ),
          SizedBox(height: 5.h),
          if(type == 'Liver')...[Expanded(
            child: SizedBox(
              width: 340.w,
              height: 31.h,
              child: Text(
                AppStrings.showDetailedForLiver,
                style: TextStyle(
                  fontSize: 7.sp,
                  color: AppColors.darkBlue,
                ),
              ),
            ),
          )],
          if(type == 'Diabetes')...[Expanded(
            child: SizedBox(
              width: 128.w,
              height: 31.h,
              child: Text(
                AppStrings.showDetailedForDiabetes,
                style: TextStyle(
                  fontSize: 7.sp,
                  color: AppColors.darkBlue,
                ),
              ),
            ),
          )],
          if(type == 'Anemia')...[Expanded(
            child: SizedBox(
              width: 350.w,
              height: 31.h,
              child: Text(
                AppStrings.showDetailedForAnemia,
                style: TextStyle(
                  fontSize: 7.sp,
                  color: AppColors.darkBlue,
                ),
              ),
            ),
          )],
          SizedBox(height: 5.h),
          InkWell(
            onTap: () {
              if(type == 'Liver') {
                CustomNavigator.push(Routes.LIVER);
              }
              else if(type == 'Diabetes') {
                CustomNavigator.push(Routes.DIABETES);
              }else {
                CustomNavigator.push(Routes.ANEMIA);
              }
              //CustomNavigator.push(Routes.MEDICAL);
            },
            child: Text(
              "upload medical test",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 12.sp,
                color: AppColors.primary,
                decoration: TextDecoration.underline,
                decorationColor: AppColors.primary,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
