import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/utils/app_colors.dart';

class OrWithEmail extends StatelessWidget {
  const OrWithEmail({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 20.h),
      child: Row(
        children: [
          const Expanded(child: Divider()),
          Container(
              margin: EdgeInsets.symmetric(horizontal: 10.w),
              child: const Text(
                "Or with Email",
                style: TextStyle(color: AppColors.grey),
              )),
          const Expanded(child: Divider()),
        ],
      ),
    );
  }
}
