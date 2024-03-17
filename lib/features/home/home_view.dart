import 'package:empower_health/core/navigation/custom_navigator.dart';
import 'package:empower_health/core/navigation/routes.dart';
import 'package:empower_health/core/utils/app_colors.dart';
import 'package:empower_health/features/home/widgets/banner_widget.dart';
import 'package:empower_health/features/home/widgets/greetings_widget.dart';
import 'package:empower_health/features/home/widgets/medical_analysis_widget.dart';
import 'package:empower_health/features/home/widgets/services_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../core/common/custom_button.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const GreetingsWidget(),
              SizedBox(height: 20.h),
              const BannerWidget(),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 24.h),
                child: const Text(
                  "What services are you looking for",
                  style: TextStyle(
                      color: AppColors.primary, fontWeight: FontWeight.w700),
                ),
              ),
              const ServicesWidget(),
              const MedicalAnalysisWidget(),
              CustomButton(
                title: 'Profile',
                onTap: () => CustomNavigator.push(Routes.PROFILE),
              ),
              SizedBox(height: 10.h),
              CustomButton(
                title: 'Contact Us',
                onTap: () => CustomNavigator.push(Routes.CONTACT_US),
              ),
              SizedBox(height: 10.h),
              CustomButton(
                title: 'Logout',
                onTap: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}
