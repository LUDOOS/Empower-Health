import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/utils/app_colors.dart';
import '../../../core/utils/app_strings.dart';

class DiagnosisWidget extends StatelessWidget {
  const DiagnosisWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 500.w,
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
          SizedBox(width: 15.w),
          // SvgPicture.asset(AppImages.diagnosis),
          // SizedBox(width: 7.w),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Initial diagnosis:",
                style: TextStyle(
                    fontWeight: FontWeight.w600,
                    color: const Color(0xff2980B9),
                    fontSize: 14.sp),
              ),
              SizedBox(
                width: 350.w,
                height: 80.h,
                child: Text(
                  AppStrings.empowerWireless,
                  overflow: TextOverflow.visible,
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
