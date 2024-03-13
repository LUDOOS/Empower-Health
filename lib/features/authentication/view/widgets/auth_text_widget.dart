import 'package:flutter/material.dart';

import '../../../../core/utils/app_colors.dart';

class AuthText extends StatelessWidget {
  const AuthText({
    super.key,
    this.onTap,
    required this.dummyText,
    required this.link,
  });
  final Function()? onTap;
  final String dummyText;
  final String link;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: InkWell(
        onTap: onTap,
        child: Text.rich(
          TextSpan(
            text: dummyText,
            style: const TextStyle(color: AppColors.grey),
            children: [
              TextSpan(
                text: link,
                style: const TextStyle(color: AppColors.primary),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
