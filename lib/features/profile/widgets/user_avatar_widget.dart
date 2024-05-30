import 'package:empower_health/core/caching/caching_helper.dart';
import 'package:empower_health/core/caching/caching_key.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../core/utils/app_colors.dart';
import '../../../core/utils/app_images.dart';

class UserAvatarWidget extends StatelessWidget {
  const UserAvatarWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: Column(
        children: [
          SvgPicture.asset(
            AppImages.user,
            width: 70.w,
            height: 70.h,
          ),
          SizedBox(height: 8.h),
          Text(
            CachingHelper.instance!.readString(CachingKey.NAME),
            style: TextStyle(
              fontSize: 14.sp,
              color: AppColors.primary,
            ),
          ),
        ],
      ),
    );
  }
}
