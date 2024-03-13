import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../core/utils/app_colors.dart';
import '../../../core/utils/app_images.dart';
import '../../../core/utils/app_strings.dart';

class DiagnosisWidget extends StatelessWidget {
  const DiagnosisWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 156.h,
      padding: EdgeInsets.symmetric(vertical: 18.h),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(5.r),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 5,
            blurRadius: 7,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Row(
        children: [
          SizedBox(width: 5.w),
          SvgPicture.asset(AppImages.diagnosis),
          SizedBox(width: 7.w),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Initial diagnosis:",
                style: TextStyle(
                    fontWeight: FontWeight.w600,
                    color: Color(0xff2980B9),
                    fontSize: 14.sp),
              ),
              SizedBox(
                width: 250.w,
                child: Text(
                  AppStrings.empowerWireless,
                  style: TextStyle(fontSize: 14.sp),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
