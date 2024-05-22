import 'package:empower_health/core/navigation/custom_navigator.dart';
import 'package:empower_health/core/navigation/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/common/primary_button.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_images.dart';
import '../../../../core/utils/app_strings.dart';


class MedicalAnalysisWidget extends StatelessWidget {
  const MedicalAnalysisWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 220.h,
      margin: EdgeInsets.symmetric(vertical: 24.h),
      padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.r),
        image: const DecorationImage(
            image: AssetImage(AppImages.medicalComposition), fit: BoxFit.cover),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          SizedBox(
            width: 125.w,
            child: Text(
              AppStrings.ourPatients,
              style: TextStyle(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w600,
                  color: AppColors.darkBlue),
            ),
          ),
          SizedBox(
            width: 160.w,
            height: 60.h,
            child: Text(
              AppStrings.showDetailed,
              style: TextStyle(fontSize: 12.sp, color: AppColors.darkBlue),
            ),
          ),
          PrimaryButton(
            onTap: () => CustomNavigator.push(Routes.MEDICAL_TYPE),
            height: 28.h,
            width: 180.w,
            borderRadius: 7.r,
            text: "Upload Medical Analysis Now",
            fontSize: 12.sp,
          )
        ],
      ),
    );
  }
}
