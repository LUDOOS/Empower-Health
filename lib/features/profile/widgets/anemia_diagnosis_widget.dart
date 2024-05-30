import 'package:empower_health/features/profile/analysis_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../core/utils/app_colors.dart';

class AnemiaDiagnosisWidget extends StatelessWidget {
  AnemiaDiagnosisWidget({
    super.key,
    required this.anemia,
  });

  Anemia anemia;
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
                "Gender: ",
                style: TextStyle(
                    fontWeight: FontWeight.w700,
                    color: const Color(0xff2980B9),
                    fontSize: 14.sp),
              ),
              Text(
                anemia.gender,
                style: TextStyle(fontSize: 14.sp),
              ),
            ],
          ),
          Row(
            children: [
              Text(
                "Hemoglobin: ",
                style: TextStyle(
                    fontWeight: FontWeight.w700,
                    color: const Color(0xff2980B9),
                    fontSize: 14.sp),
              ),
              Text(
                anemia.Hemoglobin.toString(),
                style: TextStyle(fontSize: 14.sp),
              ),
            ],
          ),
          Row(
            children: [
              Text(
                "MCH: ",
                style: TextStyle(
                    fontWeight: FontWeight.w700,
                    color: const Color(0xff2980B9),
                    fontSize: 14.sp),
              ),
              Text(
                anemia.MCH.toString(),
                style: TextStyle(fontSize: 14.sp),
              ),
            ],
          ),
          Row(
            children: [
              Text(
                "MCHC: ",
                style: TextStyle(
                    fontWeight: FontWeight.w700,
                    color: const Color(0xff2980B9),
                    fontSize: 14.sp),
              ),
              Text(
                anemia.MCHC.toString(),
                style: TextStyle(fontSize: 14.sp),
              ),
            ],
          ),
          Row(
            children: [
              Text(
                "MCV: ",
                style: TextStyle(
                    fontWeight: FontWeight.w700,
                    color: const Color(0xff2980B9),
                    fontSize: 14.sp),
              ),
              Text(
                anemia.MCV.toString(),
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
            anemia.result,
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
                anemia.createdAt,
                style: TextStyle(fontSize: 14.sp, color: Colors.grey,),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
