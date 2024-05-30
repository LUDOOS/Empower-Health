import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/utils/app_colors.dart';
import '../analysis_model.dart';

class LiverDiagnosisWidget extends StatelessWidget {
  LiverDiagnosisWidget({
    super.key,
    required this.liver,
  });
  Liver liver;
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
                liver.age.toString(),
                style: TextStyle(fontSize: 14.sp),
              ),
            ],
          ),
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
                liver.gender,
                style: TextStyle(fontSize: 14.sp),
              ),
            ],
          ),
          Row(
            children: [
              Text(
                "total_bilirubin: ",
                style: TextStyle(
                    fontWeight: FontWeight.w700,
                    color: const Color(0xff2980B9),
                    fontSize: 14.sp),
              ),
              Text(
                liver.totalBilirubin.toString(),
                style: TextStyle(fontSize: 14.sp),
              ),
            ],
          ),
          Row(
            children: [
              Text(
                "direct_bilirubin: ",
                style: TextStyle(
                    fontWeight: FontWeight.w700,
                    color: const Color(0xff2980B9),
                    fontSize: 14.sp),
              ),
              Text(
                liver.directBilirubin.toString(),
                style: TextStyle(fontSize: 14.sp),
              ),
            ],
          ),
          Row(
            children: [
              Text(
                "alkphos_alkaline_phosphotase: ",
                style: TextStyle(
                    fontWeight: FontWeight.w700,
                    color: const Color(0xff2980B9),
                    fontSize: 14.sp),
              ),
              Text(
                liver.alkphosAlkalinePhosphotase.toString(),
                style: TextStyle(fontSize: 14.sp),
              ),
            ],
          ),
          Row(
            children: [
              Text(
                "sgpt_alamine_aminotransferase: ",
                style: TextStyle(
                    fontWeight: FontWeight.w700,
                    color: const Color(0xff2980B9),
                    fontSize: 14.sp),
              ),
              Text(
                liver.sgptAlamineAminotransferase.toString(),
                style: TextStyle(fontSize: 14.sp),
              ),
            ],
          ),
          Row(
            children: [
              Text(
                "sgot_aspartate_aminotransferase: ",
                style: TextStyle(
                    fontWeight: FontWeight.w700,
                    color: const Color(0xff2980B9),
                    fontSize: 14.sp),
              ),
              Text(
                liver.sgotAspartateAminotransferase.toString(),
                style: TextStyle(fontSize: 14.sp),
              ),
            ],
          ),
          Row(
            children: [
              Text(
                "total_proteins: ",
                style: TextStyle(
                    fontWeight: FontWeight.w700,
                    color: const Color(0xff2980B9),
                    fontSize: 14.sp),
              ),
              Text(
                liver.totalProteins.toString(),
                style: TextStyle(fontSize: 14.sp),
              ),
            ],
          ),
          Row(
            children: [
              Text(
                "alb_albumin: ",
                style: TextStyle(
                    fontWeight: FontWeight.w700,
                    color: const Color(0xff2980B9),
                    fontSize: 14.sp),
              ),
              Text(
                liver.albAlbumin.toString(),
                style: TextStyle(fontSize: 14.sp),
              ),
            ],
          ),
          Row(
            children: [
              Text(
                "a_g_ratio: ",
                style: TextStyle(
                    fontWeight: FontWeight.w700,
                    color: const Color(0xff2980B9),
                    fontSize: 14.sp),
              ),
              Text(
                liver.aGRatio.toString(),
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
          liver.result,
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
                liver.createdAt,
                style: TextStyle(fontSize: 14.sp, color: Colors.grey,),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
