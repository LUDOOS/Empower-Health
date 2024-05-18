import 'package:empower_health/core/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final IconData? icon;
  final bool isMultiline;
  final String? Function(String?)? validator;
  const CustomTextField({
    Key? key,
    required this.controller,
    required this.hintText,
    this.icon,
    this.isMultiline = false,
    this.validator,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: isMultiline ? null : 53.h,
      padding: EdgeInsets.symmetric(
          horizontal: 14.w, vertical: isMultiline ? 10.h : 0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.0),
        color: AppColors.textFieldBackground,
      ),
      alignment: Alignment.center,
      child: isMultiline
          ? TextFormField(
              controller: controller,
              keyboardType: TextInputType.multiline,
              maxLines: null,
              validator: validator,
              minLines: 3,
              decoration: InputDecoration(
                prefixIcon: icon != null ? Icon(icon) : null,
                hintText: hintText,
                hintStyle: TextStyle(
                  fontSize: 14.sp,
                  color: const Color(0xffE18CB0),
                ),
                border: InputBorder.none,
              ),
            )
          : Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: controller,
                    decoration: InputDecoration(
                      prefixIcon: icon != null ? Icon(icon) : null,
                      hintText: hintText,
                      hintStyle: TextStyle(
                        fontSize: 14.sp,
                        color: const Color(0xffE18CB0),
                      ),
                      border: InputBorder.none,
                    ),
                  ),
                ),
              ],
            ),
    );
  }
}
