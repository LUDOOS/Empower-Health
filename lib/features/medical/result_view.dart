import 'package:empower_health/core/common/custom_button.dart';
import 'package:empower_health/core/navigation/custom_navigator.dart';
import 'package:empower_health/core/navigation/routes.dart';
import 'package:empower_health/core/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../core/common/custom_app_bar.dart';

class ResultView extends StatelessWidget {
  const ResultView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: Column(
            children: [
              SizedBox(height: 20.h),
              CustomAppBar(icon: true, onPressed: () {}),
              SizedBox(height: 50.h),
              Container(
                width: double.infinity,
                padding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 14.h),
                decoration: AppDecoration.style(),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Result of your medical analysis",
                      style: TextStyle(
                        fontSize: 24.sp,
                        fontWeight: FontWeight.w600,
                        color: const Color(0xff2980B9),
                      ),
                    ),
                    SizedBox(height: 10.h),
                    Center(
                        child: SvgPicture.asset(
                      AppImages.diagnosis,
                      height: 120.h,
                      width: 120.w,
                    )),
                    SizedBox(height: 20.h),
                    Text(
                      "Initial diagnosis:",
                      style: TextStyle(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w600,
                        color: const Color(0xff2980B9),
                      ),
                    ),
                    Text(
                      AppStrings.empowerWireless,
                      style: TextStyle(
                        fontSize: 14.sp,
                      ),
                    ),
                    SizedBox(height: 10.h),
                    Text(
                      "Doctor specialization:",
                      style: TextStyle(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w600,
                        color: const Color(0xff2980B9),
                      ),
                    ),
                    SizedBox(height: 16.h),
                    Text(
                      "Nearest doctor:",
                      style: TextStyle(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w600,
                        color: const Color(0xff2980B9),
                      ),
                    ),
                    SizedBox(height: 20.h),
                  ],
                ),
              ),
              SizedBox(height: 30.h),
              CustomButton(
                title: 'Show Medical History',
                onTap: () => CustomNavigator.push(Routes.PROFILE),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
