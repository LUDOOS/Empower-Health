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
      appBar: AppBar(),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 18.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const UserAvatarWidget(),
            SizedBox(height: 56.h),
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
              separatorBuilder: (context, index) => SizedBox(height: 14.h),
            ),
            SizedBox(height: 26.h),
            CustomButton(
              title: 'Logout',
              onTap: () {},
            ),
          ],
        ),
      ),
    );
  }
}
