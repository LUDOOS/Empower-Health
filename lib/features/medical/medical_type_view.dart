import 'package:empower_health/core/common/custom_button.dart';
import 'package:empower_health/core/utils/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import '../../core/navigation/custom_navigator.dart';
import '../../core/navigation/routes.dart';
import '../../core/utils/app_colors.dart';
import '../../core/utils/app_images.dart';
import '../../core/utils/app_strings.dart';
import '../home/view/widgets/greetings_widget.dart';

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
              const MedicalTypeServiceWidget(color: Color(0xffDBEDFF), type: 'Liver',),
              SizedBox(height: 30.h),
              const MedicalTypeServiceWidget(color: Color(0xffFDE2F6), type: 'Diabetes',),
              SizedBox(height: 30.h),
              const MedicalTypeServiceWidget(color: Color(0xffDBEDFF), type: 'Anemia',),
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
    required this.type,
  });
  final Color color;
  final String type;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150.h,
      width: 180.w,
      padding: EdgeInsets.symmetric(vertical: 10.h),
      decoration: AppStyles.container(color: color),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                type,
                style: TextStyle(
                  fontSize: 14.sp,
                  fontWeight: FontWeight.bold,
                  color: AppColors.darkBlue,
                ),
              ),
              Text(
                " medical analysis",
                style: TextStyle(
                  fontSize: 14.sp,
                  fontWeight: FontWeight.bold,
                  color: AppColors.darkBlue,
                ),
              ),
            ],
          ),
          if(type == 'Liver')...[SizedBox(
            //width: 200.w,
            //height: 70.h,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                AppStrings.showDetailedForLiver,
                style: TextStyle(
                  fontSize: 7.sp,
                  color: AppColors.darkBlue,
                ),
              ),
            ),
          )],
          if(type == 'Diabetes')...[SizedBox(
            // width: 128.w,
            // height: 31.h,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                AppStrings.showDetailedForDiabetes,
                style: TextStyle(
                  fontSize: 7.sp,
                  color: AppColors.darkBlue,
                ),
              ),
            ),
          )],
          if(type == 'Anemia')...[SizedBox(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                AppStrings.showDetailedForAnemia,
                style: TextStyle(
                  fontSize: 7.sp,
                  color: AppColors.darkBlue,
                ),
              ),
            ),
          )],
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
