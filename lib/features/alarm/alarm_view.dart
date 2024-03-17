import 'package:empower_health/core/navigation/custom_navigator.dart';
import 'package:empower_health/core/navigation/routes.dart';
import 'package:empower_health/features/alarm/widgets/alarm_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../core/common/custom_button.dart';
import '../../core/utils/app_colors.dart';
import '../profile/widgets/user_avatar_widget.dart';

class AlarmView extends StatelessWidget {
  const AlarmView({super.key});

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
            SizedBox(height: 20.h),
            Text(
              "Alarms",
              style: TextStyle(
                fontSize: 18.sp,
                fontWeight: FontWeight.w600,
                color: AppColors.primary,
              ),
            ),
            SizedBox(height: 10.h),
            ListView.separated(
              shrinkWrap: true,
              itemCount: 2,
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) => const AlarmWidget(),
              separatorBuilder: (context, index) => SizedBox(height: 10.h),
            ),
            SizedBox(height: 30.h),
            CustomButton(
              title: 'Add another Alarm',
              onTap: () => CustomNavigator.push(Routes.ADDALARM),
            ),
            SizedBox(height: 10.h),
            CustomButton(
              title: 'Profile',
              onTap: () => CustomNavigator.push(Routes.PROFILE),
            ),
            SizedBox(height: 10.h),
            CustomButton(
              title: 'Logout',
              onTap: () {
                CustomNavigator.push(Routes.LOGIN, clean: true);
              },
            ),
            SizedBox(height: 30.h),
          ],
        ),
      ),
    );
  }
}
