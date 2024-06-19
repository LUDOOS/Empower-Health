import 'package:empower_health/core/navigation/custom_navigator.dart';
import 'package:empower_health/core/navigation/routes.dart';
import 'package:empower_health/features/alarm/widgets/alarm_widget.dart';
import 'package:empower_health/features/medical/cubit/medical_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../core/common/custom_button.dart';
import '../../core/utils/app_colors.dart';
import '../model/alarm.dart';
import '../profile/widgets/user_avatar_widget.dart';

class AlarmView extends StatelessWidget {
  const AlarmView({super.key});

  @override
  Widget build(BuildContext context) {
    //context.read<MedicalCubit>().getAlarms();
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: BlocConsumer<MedicalCubit, MedicalState>(
          listener: (context, state) {},
          builder: (context, state) {
            return SingleChildScrollView(
              child: Padding(
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
                    FutureBuilder(
                      future: context.read<MedicalCubit>().getAlarms(),
                      builder: (context, snapshot) {
                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          return Center(child: CircularProgressIndicator());
                        } else if (snapshot.hasError) {
                          return Center(
                              child: Text('Error: ${snapshot.error}'));
                        } else if (!snapshot.hasData) {
                          return Center(child: Text('No Data Available'));
                        } else {
                          Alarm items = snapshot.data;
                          return ListView.separated(
                            shrinkWrap: true,
                            itemCount: items.data.length,
                            physics: const NeverScrollableScrollPhysics(),
                            itemBuilder: (context, index) =>
                                AlarmWidget(alarm: items.data[index],),
                            separatorBuilder: (context, index) =>
                                SizedBox(height: 10.h),
                          );
                        }
                      },
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
          },
        ),
      ),
    );
  }
}
