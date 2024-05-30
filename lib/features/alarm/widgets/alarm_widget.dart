import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/common/primary_button.dart';
import '../../../core/utils/app_colors.dart';
import '../../../core/utils/app_styles.dart';

class AlarmWidget extends StatelessWidget {
  const AlarmWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150.h,
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 15.h),
      decoration: AppStyles.container(),
      child: Row(
        children: [
          Expanded(
            flex: 2,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Drug Name:", style: AppStyles.smallSemiBold(size: 12.sp)),
                Text("Drug Frequency:",
                    style: AppStyles.smallSemiBold(size: 12.sp)),
                Text("Drug dosage:",
                    style: AppStyles.smallSemiBold(size: 12.sp)),
                Text("Start date :",
                    style: AppStyles.smallSemiBold(size: 12.sp)),
                Text("End date :", style: AppStyles.smallSemiBold(size: 12.sp)),
                Text("status:", style: AppStyles.smallSemiBold(size: 12.sp)),
              ],
            ),
          ),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                PrimaryButton(
                  onTap: () {},
                  color: const Color(0xffFDE2F6),
                  textColor: AppColors.primary,
                  text: "Edit",
                ),
                PrimaryButton(
                  onTap: () {},
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
