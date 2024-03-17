import 'package:empower_health/core/common/custom_button.dart';
import 'package:empower_health/core/utils/app_styles.dart';
import 'package:empower_health/features/home/widgets/greetings_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../core/navigation/custom_navigator.dart';
import '../../core/navigation/routes.dart';
import '../../core/utils/app_colors.dart';
import '../../core/utils/app_images.dart';
import '../../core/utils/app_strings.dart';

class MedicalTypeView extends StatelessWidget {
  const MedicalTypeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
          child: Column(
            children: [
              const GreetingsWidget(),
              SizedBox(height: 50.h),
              const Text("What services are you looking for"),
              SizedBox(height: 30.h),
              const MedicalTypeServiceWidget(color: Color(0xffDBEDFF)),
              SizedBox(height: 30.h),
              const MedicalTypeServiceWidget(color: Color(0xffFDE2F6)),
              SizedBox(height: 30.h),
              const MedicalTypeServiceWidget(color: Color(0xffDBEDFF)),
              SizedBox(height: 50.h),
              CustomButton(
                title: 'Profile',
                onTap: () => CustomNavigator.push(Routes.PROFILE),
              ),
              SizedBox(height: 15.h),
              CustomButton(
                title: 'Logout',
                onTap: () {
                  CustomNavigator.push(Routes.LOGIN, clean: true);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class MedicalTypeServiceWidget extends StatelessWidget {
  const MedicalTypeServiceWidget({
    super.key,
    required this.color,
  });
  final Color color;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 140.h,
      width: 180.w,
      padding: EdgeInsets.symmetric(vertical: 10.h),
      decoration: AppStyles.container(color: color),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          SvgPicture.asset(AppImages.scanDiagnosis),
          Text(
            "medical analysis",
            style: TextStyle(
              fontSize: 12.sp,
              fontWeight: FontWeight.bold,
              color: AppColors.darkBlue,
            ),
          ),
          SizedBox(
            width: 128.w,
            height: 30.h,
            child: Text(
              AppStrings.showDetailed,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 7.sp,
                color: AppColors.darkBlue,
              ),
            ),
          ),
          Text(
            "upload medical test",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 10.sp,
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
