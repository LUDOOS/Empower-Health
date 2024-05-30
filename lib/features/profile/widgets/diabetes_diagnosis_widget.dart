import 'package:empower_health/features/profile/analysis_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/utils/app_colors.dart';

class DiabetesDiagnosisWidget extends StatelessWidget {
  DiabetesDiagnosisWidget({
    super.key,
    required this.diabetes,
  });
Diabetes diabetes;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 500.w,
      //height: 170.h,
      padding: EdgeInsets.symmetric(vertical: 14.h, horizontal: 18.w),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(5.r),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 5,
            blurRadius: 7,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(
                "Age: ",
                style: TextStyle(
                    fontWeight: FontWeight.w700,
                    color: const Color(0xff2980B9),
                    fontSize: 14.sp),
              ),
              Text(
                diabetes.Age.toString(),
                style: TextStyle(fontSize: 14.sp),
              ),
            ],
          ),
          Row(
            children: [
              Text(
                "Pregnancies: ",
                style: TextStyle(
                    fontWeight: FontWeight.w700,
                    color: const Color(0xff2980B9),
                    fontSize: 14.sp),
              ),
              Text(
                diabetes.Pregnancies.toString(),
                style: TextStyle(fontSize: 14.sp),
              ),
            ],
          ),
          Row(
            children: [
              Text(
                "BloodPressure: ",
                style: TextStyle(
                    fontWeight: FontWeight.w700,
                    color: const Color(0xff2980B9),
                    fontSize: 14.sp),
              ),
              Text(
                diabetes.BloodPressure.toString(),
                style: TextStyle(fontSize: 14.sp),
              ),
            ],
          ),
          Row(
            children: [
              Text(
                "Glucose: ",
                style: TextStyle(
                    fontWeight: FontWeight.w700,
                    color: const Color(0xff2980B9),
                    fontSize: 14.sp),
              ),
              Text(
                diabetes.Glucose.toString(),
                style: TextStyle(fontSize: 14.sp),
              ),
            ],
          ),
          Row(
            children: [
              Text(
                "Insulin: ",
                style: TextStyle(
                    fontWeight: FontWeight.w700,
                    color: const Color(0xff2980B9),
                    fontSize: 14.sp),
              ),
              Text(
                diabetes.Insulin.toString(),
                style: TextStyle(fontSize: 14.sp),
              ),
            ],
          ),
          Row(
            children: [
              Text(
                "SkinThickness: ",
                style: TextStyle(
                    fontWeight: FontWeight.w700,
                    color: const Color(0xff2980B9),
                    fontSize: 14.sp),
              ),
              Text(
                diabetes.SkinThickness.toString(),
                style: TextStyle(fontSize: 14.sp),
              ),
            ],
          ),
          Row(
            children: [
              Text(
                "BMI: ",
                style: TextStyle(
                    fontWeight: FontWeight.w700,
                    color: const Color(0xff2980B9),
                    fontSize: 14.sp),
              ),
              Text(
                diabetes.BMI.toString(),
                style: TextStyle(fontSize: 14.sp),
              ),
            ],
          ),
          Row(
            children: [
              Text(
                "DiabetesPedigreeFunction: ",
                style: TextStyle(
                    fontWeight: FontWeight.w700,
                    color: const Color(0xff2980B9),
                    fontSize: 14.sp),
              ),
              Text(
                diabetes.DiabetesPedigreeFunction.toString(),
                style: TextStyle(fontSize: 14.sp),
              ),
            ],
          ),
          Text(
            "result: ",
            style: TextStyle(
                fontWeight: FontWeight.w700,
                color: const Color(0xff2980B9),
                fontSize: 14.sp),
          ),
          Text(
            diabetes.result,
            //overflow: TextOverflow.ellipsis,
            style: TextStyle(fontSize: 14.sp),
          ),
          Row(
            children: [
              Text(
                "created_at: ",
                style: TextStyle(
                    fontWeight: FontWeight.w700,
                    color: Colors.grey,
                    fontSize: 14.sp),
              ),
              Text(
                diabetes.createdAt,
                style: TextStyle(fontSize: 14.sp, color: Colors.grey,),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
