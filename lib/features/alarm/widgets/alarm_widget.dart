import 'package:empower_health/features/medical/cubit/medical_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/common/primary_button.dart';
import '../../../core/utils/app_colors.dart';
import '../../../core/utils/app_styles.dart';
import '../../model/alarm.dart';

class AlarmWidget extends StatelessWidget {
  AlarmWidget({super.key,
    required this.alarm,
  });

  Data alarm;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 170.h,
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 15.h),
      decoration: AppStyles.container(),
      child: Row(
        children: [
          Expanded(
            flex: 2,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text.rich(
                    TextSpan(text: 'Drug Name: ', style: AppStyles.smallSemiBold(size: 16.sp)
                    ,children: <InlineSpan>[
                      TextSpan(text: alarm.drugName, style: TextStyle(color: AppColors.primary),)
                        ])
                ),
                Text.rich(
                    TextSpan(text: 'Drug Frequency: ', style: AppStyles.smallSemiBold(size: 16.sp)
                        ,children: <InlineSpan>[
                          TextSpan(text: alarm.frequency.toString(), style: TextStyle(color: AppColors.primary),)
                        ])
                ),
                Text.rich(
                    TextSpan(text: 'Drug dosage: ', style: AppStyles.smallSemiBold(size: 16.sp)
                        ,children: <InlineSpan>[
                          TextSpan(text: alarm.dosage, style: TextStyle(color: AppColors.primary),)
                        ])
                ),
                Text.rich(
                    TextSpan(text: 'Start date: ', style: AppStyles.smallSemiBold(size: 16.sp)
                        ,children: <InlineSpan>[
                          TextSpan(text: alarm.startDate, style: TextStyle(color: AppColors.primary),)
                        ])
                ),
                Text.rich(
                    TextSpan(text: 'End date: ', style: AppStyles.smallSemiBold(size: 16.sp)
                        ,children: <InlineSpan>[
                          TextSpan(text: alarm.endDate, style: TextStyle(color: AppColors.primary),)
                        ])
                ),
                Text.rich(
                    TextSpan(text: 'status: ', style: AppStyles.smallSemiBold(size: 16.sp)
                        ,children: <InlineSpan>[
                          TextSpan(text: alarm.status, style: TextStyle(color: AppColors.primary),)
                        ])
                ),
              ],
            ),
          ),
          Expanded(
            child: Column(
              //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                // PrimaryButton(
                //   onTap: () {},
                //   color: const Color(0xffFDE2F6),
                //   textColor: AppColors.primary,
                //   text: "Edit",
                // ),
                PrimaryButton(
                  onTap: () {
                    context.read<MedicalCubit>().deleteAlarm(alarm.id);
                  },
                  color: const Color(0xffDBEDFF),
                  textColor: AppColors.primary,
                  text: "Delete",
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
