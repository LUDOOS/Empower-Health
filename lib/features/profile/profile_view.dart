import 'package:empower_health/core/navigation/custom_navigator.dart';
import 'package:empower_health/core/navigation/routes.dart';
import 'package:empower_health/core/utils/app_colors.dart';
import 'package:empower_health/features/profile/cubit/profile_cubit.dart';
import 'package:empower_health/features/profile/widgets/anemia_diagnosis_widget.dart';
import 'package:empower_health/features/profile/widgets/diabetes_diagnosis_widget.dart';
import 'package:empower_health/features/profile/widgets/liver_diagnosis_widget.dart';
import 'package:empower_health/features/profile/widgets/user_avatar_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../core/common/custom_button.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    context.read<ProfileCubit>().getPatientData();
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: AppColors.primary),
          onPressed: () => CustomNavigator.push(Routes.HOME),
        ),
      ),
      body: SafeArea(
        child: BlocConsumer<ProfileCubit, ProfileState>(
          listener: (context, state) {},
          builder: (context, state) {
            var anemia = context.read<ProfileCubit>().anemia;
            var diabetes = context.read<ProfileCubit>().diabetes;
            var liver = context.read<ProfileCubit>().liver;
            return SingleChildScrollView(
              child: Padding(
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
                    anemia == null
                        ? Container()
                        : Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Anemia',
                                style: TextStyle(
                                    fontSize: 18.sp,
                                    fontWeight: FontWeight.bold),
                              ),
                              SizedBox(
                                height: 4.h,
                              ),
                              ListView.separated(
                                shrinkWrap: true,
                                itemCount: anemia.length,
                                physics: const NeverScrollableScrollPhysics(),
                                itemBuilder: (context, index) =>
                                    AnemiaDiagnosisWidget(
                                  anemia: anemia[index],
                                ),
                                separatorBuilder: (context, index) =>
                                    SizedBox(height: 10.h),
                              ),
                              SizedBox(height: 20.h),
                            ],
                          ),
                    diabetes == null
                        ? Container()
                        : Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Diabetes',
                          style: TextStyle(
                              fontSize: 18.sp,
                              fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          height: 4.h,
                        ),
                        ListView.separated(
                          shrinkWrap: true,
                          itemCount: diabetes.length,
                          physics: const NeverScrollableScrollPhysics(),
                          itemBuilder: (context, index) =>
                              DiabetesDiagnosisWidget(
                                diabetes: diabetes[index],
                              ),
                          separatorBuilder: (context, index) =>
                              SizedBox(height: 10.h),
                        ),
                        SizedBox(height: 20.h),
                      ],
                    ),
                    liver == null
                        ? Container()
                        : Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Liver',
                          style: TextStyle(
                              fontSize: 18.sp,
                              fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          height: 4.h,
                        ),
                        ListView.separated(
                          shrinkWrap: true,
                          itemCount: liver.length,
                          physics: const NeverScrollableScrollPhysics(),
                          itemBuilder: (context, index) =>
                              LiverDiagnosisWidget(
                                liver: liver[index],
                              ),
                          separatorBuilder: (context, index) =>
                              SizedBox(height: 10.h),
                        ),
                        SizedBox(height: 20.h),
                      ],
                    ),
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
          },
        ),
      ),
    );
  }
}
