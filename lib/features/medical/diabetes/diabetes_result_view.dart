import 'package:empower_health/core/common/custom_button.dart';
import 'package:empower_health/core/common/primary_button.dart';
import 'package:empower_health/core/navigation/custom_navigator.dart';
import 'package:empower_health/core/navigation/routes.dart';
import 'package:empower_health/core/utils/utils.dart';
import 'package:empower_health/features/medical/cubit/medical_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../core/common/custom_app_bar.dart';


class DiabetesResultView extends StatelessWidget {
  const DiabetesResultView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: BlocConsumer<MedicalCubit, MedicalState>(
          listener: (context, state) {},
          builder: (context, state) {
            String result = context.read<MedicalCubit>().diabetesResult??'';
            return SingleChildScrollView(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: Column(
              children: [
                SizedBox(height: 20.h),
                CustomAppBar(icon: true, onPressed: () => CustomNavigator.pop()),
                SizedBox(height: 50.h),
                Container(
                  width: double.infinity,
                  padding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 14.h),
                  decoration: AppStyles.container(),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Result of your diabetes analysis",
                        style: AppStyles.smallSemiBold(size: 24.sp),
                      ),
                      SizedBox(height: 10.h),
                      SizedBox(height: 20.h),
                      Text(
                        "Initial diagnosis:",
                        style: AppStyles.smallSemiBold(),
                      ),
                      Text(
                        result,
                        style: TextStyle(
                          fontSize: 14.sp,
                        ),
                      ),
                      SizedBox(height: 10.h),
                      Text(
                        "Doctor specialization:",
                        style: AppStyles.smallSemiBold(),
                      ),
                      Text(
                        context.read<MedicalCubit>().specialization??'',
                        style: TextStyle(
                          fontSize: 14.sp,
                        ),
                      ),
                      SizedBox(height: 10.h),
                      Text(
                        "Nearest doctor:",
                        style: AppStyles.smallSemiBold(),
                      ),
                      context.read<MedicalCubit>().locationSelected == true
                          ? Text(
                        context.read<MedicalCubit>().location ?? '',
                        style: TextStyle(
                          fontSize: 14.sp,
                        ),
                      )
                          : TextButton(
                        onPressed: () async {
                          context
                              .read<MedicalCubit>()
                              .getLocation()
                              .then((v) {
                            context
                                .read<MedicalCubit>()
                                .findNearestDoc();
                          });
                        },
                        child:
                        const Row(
                          children: [
                            Text('Click to send your Location', style: TextStyle(color: Colors.green),),
                            Icon(Icons.location_on_outlined, color: Colors.green,)
                          ],
                        ),
                      ),
                      SizedBox(height: 40.h),
                      Center(
                        child: PrimaryButton(
                          onTap: () => CustomNavigator.push(Routes.ADDALARM),
                          color: const Color(0xffFDE2F6),
                          width: 290.w,
                          fontSize: 12.sp,
                          textColor: AppColors.primary,
                          text: "you can set alarm for your drugs appointment",
                        ),
                      ),
                      SizedBox(height: 10.h),
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
          );
          },
        ),
      ),
    );
  }
}
