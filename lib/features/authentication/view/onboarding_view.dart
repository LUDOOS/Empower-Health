import 'package:empower_health/core/caching/caching_helper.dart';
import 'package:empower_health/core/caching/caching_key.dart';
import 'package:empower_health/core/common/custom_app_bar.dart';
import 'package:empower_health/core/common/primary_button.dart';
import 'package:empower_health/core/navigation/custom_navigator.dart';
import 'package:empower_health/core/navigation/routes.dart';
import 'package:empower_health/core/utils/app_images.dart';
import 'package:empower_health/core/utils/app_strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OnboardingView extends StatelessWidget {
  const OnboardingView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffBDBBBB),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 20.h),
              const CustomAppBar(),
              SizedBox(height: 30.h),
              Text(
                AppStrings.onboardingTitle,
                style: TextStyle(
                  fontSize: 24.sp,
                  fontWeight: FontWeight.w600,
                  color: Colors.white,
                ),
              ),
              SizedBox(height: 5.h),
              const Text(
                AppStrings.onboardingBody,
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  color: Colors.white,
                ),
              ),
              SizedBox(height: 60.h),
              Image.asset(AppImages.home),
              SizedBox(height: 43.h),
              PrimaryButton(
                onTap: () {
                  CachingHelper.instance
                      ?.writeData(CachingKey.ONBOARDING, true);
                  CustomNavigator.push(Routes.HOME, clean: true);
                },
                icon: Icons.arrow_forward_rounded,
                text: "Get Started ",
              )
            ],
          ),
        ),
      ),
    );
  }
}
