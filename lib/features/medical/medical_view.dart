import 'package:empower_health/core/common/primary_button.dart';
import 'package:empower_health/core/navigation/custom_navigator.dart';
import 'package:empower_health/core/navigation/routes.dart';
import 'package:empower_health/core/utils/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../core/common/custom_app_bar.dart';
import '../../core/common/cutsom_text_field.dart';

class MedicalView extends StatefulWidget {
  const MedicalView({super.key});

  @override
  State<MedicalView> createState() => _MedicalViewState();
}

class _MedicalViewState extends State<MedicalView> {
  TextEditingController ageController = TextEditingController();
  TextEditingController locationController = TextEditingController();
  TextEditingController genderController = TextEditingController();
  TextEditingController typeController = TextEditingController();
  TextEditingController uploadController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: Column(
            children: [
              SizedBox(height: 20.h),
              CustomAppBar(icon: true, onPressed: () => CustomNavigator.pop()),
              SizedBox(height: 50.h),
              Container(
                width: double.infinity,
                padding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 14.h),
                decoration: AppStyles.container(),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Upload Your Medical Analysis",
                      style: AppStyles.bigText(),
                    ),
                    Text(
                      "Upload your medical analysis photo and some information",
                      style: TextStyle(
                        fontSize: 14.sp,
                        color: Colors.grey[600],
                      ),
                    ),
                    SizedBox(height: 20.h),
                    CustomTextField(
                      controller: ageController,
                      hintText: 'Upload medical analysis',
                    ),
                    SizedBox(height: 10.h),
                    CustomTextField(
                      controller: locationController,
                      hintText: 'Enter your age',
                    ),
                    SizedBox(height: 10.h),
                    CustomTextField(
                      controller: genderController,
                      hintText: 'Enter your gender',
                    ),
                    SizedBox(height: 10.h),
                    CustomTextField(
                      controller: typeController,
                      hintText: 'Enter current location',
                    ),
                    SizedBox(height: 10.h),
                    CustomTextField(
                      controller: uploadController,
                      hintText: 'Choose type of medical analysis',
                    ),
                    SizedBox(height: 40.h),
                    PrimaryButton(
                      onTap: () {
                        CustomNavigator.push(Routes.RESULT);
                      },
                      borderRadius: 8.r,
                      text: 'Show Result',
                    ),
                    SizedBox(height: 10.h),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    ageController.dispose();
    locationController.dispose();
    genderController.dispose();
    typeController.dispose();
    uploadController.dispose();
    super.dispose();
  }
}
