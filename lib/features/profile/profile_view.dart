import 'package:empower_health/core/navigation/custom_navigator.dart';
import 'package:empower_health/core/navigation/routes.dart';
import 'package:empower_health/core/utils/app_colors.dart';
import 'package:empower_health/features/profile/widgets/diagnosis_widget.dart';
import 'package:empower_health/features/profile/widgets/user_avatar_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../core/common/custom_button.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: AppColors.primary),
          onPressed: () => CustomNavigator.push(Routes.HOME),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 18.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const UserAvatarWidget(),
            SizedBox(height: 30.h),
            Text(
              "Medical Analysis History",
              style: TextStyle(
                fontSize: 18.sp,
                fontWeight: FontWeight.w600,
                color: AppColors.primary,
              ),
            ),
            SizedBox(height: 14.h),
            ListView.separated(
              shrinkWrap: true,
              itemCount: 3,
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) => const DiagnosisWidget(),
              separatorBuilder: (context, index) => SizedBox(height: 10.h),
            ),
            SizedBox(height: 20.h),
            CustomButton(
              title: 'Your Alarms',
              onTap: () => CustomNavigator.push(Routes.ALARM),
            ),
            SizedBox(height: 10.h),
            CustomButton(
              title: 'Logout',
              onTap: () {
                CustomNavigator.push(Routes.LOGIN, clean: true);
              },
            ),
          ],
        ),
      ),
    );
  }
}
