import 'package:empower_health/core/navigation/custom_navigator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/common/custom_app_bar.dart';
import '../../../core/common/cutsom_text_field.dart';
import '../../../core/common/primary_button.dart';
import '../../../core/utils/app_styles.dart';

class AddAlarmView extends StatefulWidget {
  const AddAlarmView({super.key});

  @override
  _AddAlarmViewState createState() => _AddAlarmViewState();
}

class _AddAlarmViewState extends State<AddAlarmView> {
  TextEditingController drugNameController = TextEditingController();
  TextEditingController frequencyController = TextEditingController();
  TextEditingController dosageController = TextEditingController();
  TextEditingController startDateController = TextEditingController();
  TextEditingController endDateController = TextEditingController();
  TextEditingController firstDosageController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 20.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomAppBar(icon: true, onPressed: () => CustomNavigator.pop()),
              SizedBox(height: 40.h),
              Container(
                width: double.infinity,
                padding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 30.h),
                decoration: AppStyles.container(),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Add Drug Alarm",
                      style: AppStyles.bigText(),
                    ),
                    SizedBox(height: 30.h),
                    CustomTextField(
                      controller: drugNameController,
                      hintText: 'Drug Name',
                    ),
                    SizedBox(height: 10.h),
                    CustomTextField(
                      controller: frequencyController,
                      hintText: 'Frequency',
                    ),
                    SizedBox(height: 10.h),
                    CustomTextField(
                      controller: dosageController,
                      hintText: 'Dosage',
                    ),
                    SizedBox(height: 10.h),
                    CustomTextField(
                      controller: startDateController,
                      hintText: 'Start Date',
                    ),
                    SizedBox(height: 10.h),
                    CustomTextField(
                      controller: endDateController,
                      hintText: 'End Date',
                    ),
                    SizedBox(height: 10.h),
                    CustomTextField(
                      controller: firstDosageController,
                      hintText: 'First Dosage',
                    ),
                    SizedBox(height: 30.h),
                    PrimaryButton(
                      onTap: () {
                        CustomNavigator.pop();
                      },
                      height: 45.h,
                      borderRadius: 8.r,
                      fontSize: 20.sp,
                      text: 'Confirm',
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
