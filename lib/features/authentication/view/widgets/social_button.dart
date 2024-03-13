import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../core/utils/app_colors.dart';

class SocialButton extends StatelessWidget {
  const SocialButton({
    super.key,
    required this.logo,
    required this.title,
    this.onTap,
    required this.color,
  });
  final String logo;
  final String title;
  final Function()? onTap;
  final Color color;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      borderRadius: BorderRadius.circular(8.r),
      child: Container(
        height: 50.h,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(8.r),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(
              logo,
              width: 25.w,
              height: 25.h,
            ),
            SizedBox(width: 10.w),
            Text(
              title,
              style: const TextStyle(color: AppColors.white),
            ),
          ],
        ),
      ),
    );
  }
}
