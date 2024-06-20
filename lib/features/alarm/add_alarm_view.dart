import 'dart:core';
import 'package:empower_health/core/navigation/custom_navigator.dart';
import 'package:empower_health/core/notification/notification_service.dart';
import 'package:empower_health/features/medical/cubit/medical_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../core/common/custom_app_bar.dart';
import '../../../core/common/cutsom_text_field.dart';
import '../../../core/common/primary_button.dart';
import '../../../core/utils/app_styles.dart';
import '../../core/notification/database_helper.dart';
import '../../core/utils/app_colors.dart';

class AddAlarmView extends StatefulWidget {
  const AddAlarmView({super.key});

  @override
  _AddAlarmViewState createState() => _AddAlarmViewState();
}

class _AddAlarmViewState extends State<AddAlarmView> {

  final DatabaseHelper _dbHelper = DatabaseHelper();
  final NotificationService _notificationService = NotificationService();

  @override
  void initState() {
    super.initState();
    ///_dbHelper.dropDatabase();
    _notificationService.init();
  }


  TextEditingController drugNameController = TextEditingController();
  TextEditingController frequencyController = TextEditingController();
  TextEditingController dosageController = TextEditingController();
  DateTime _selectedTime = DateTime.now();
  DateTime _selectedStartDate = DateTime.now();
  DateTime _selectedEndDate = DateTime.now();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<MedicalCubit, MedicalState>(
      listener: (context, state) {
        if (state is AddAlarmSuccess) {
          CustomNavigator.pop();
          //_setAlarm('title', 'body', _selectedTime);
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Alarm created successfully')),
          );
        }
        //if(DateTime.now() == )
      },
      builder: (context, state) {
        return Scaffold(
          body: SafeArea(
            child: SingleChildScrollView(
              padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 20.h),
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomAppBar(
                        icon: true, onPressed: () => CustomNavigator.pop()),
                    SizedBox(height: 40.h),
                    Container(
                      width: double.infinity,
                      padding: EdgeInsets.symmetric(
                          horizontal: 14.w, vertical: 30.h),
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
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8.0),
                              color: AppColors.textFieldBackground,
                            ),
                            child: ListTile(
                              title: Text(
                                'Start Date',
                                style: TextStyle(
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.w500,
                                  color: Color(0xffE18CB0),
                                ),
                              ),
                              trailing: Icon(
                                Icons.date_range,
                                size: 24.sp,
                                color: Color(0xffE18CB0),),
                              onTap: () async {
                                DateTime? date = await showDatePicker(
                                  context: context,
                                  initialDate: DateTime.now(),
                                  firstDate: DateTime(2024),
                                  lastDate: DateTime(2026),
                                );
                                if (date != null) {
                                  _selectedStartDate = date;
                                }
                                debugPrint(_selectedStartDate.toString());
                              },
                            ),
                          ),
                          SizedBox(height: 10.h),
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8.0),
                              color: AppColors.textFieldBackground,
                            ),
                            child: ListTile(
                              title: Text(
                                'End Date',
                                style: TextStyle(
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.w500,
                                  color: Color(0xffE18CB0),
                                ),
                              ),
                              trailing: Icon(Icons.date_range, size: 24.sp,
                                color: Color(0xffE18CB0),),
                              onTap: () async {
                                DateTime? date = await showDatePicker(
                                  context: context,
                                  initialDate: DateTime.now(),
                                  firstDate: DateTime(2024),
                                  lastDate: DateTime(2026),
                                );
                                if (date != null) {
                                  _selectedEndDate = date;
                                }
                                debugPrint(_selectedEndDate.toString());
                              },
                            ),
                          ),
                          SizedBox(height: 10.h),
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8.0),
                              color: AppColors.textFieldBackground,
                            ),
                            child: ListTile(
                              title: Text(
                                'First Dosage',
                                style: TextStyle(
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.w500,
                                  color: Color(0xffE18CB0),
                                ),
                              ),
                              trailing: Icon(Icons.access_time, size: 24.sp,
                                color: Color(0xffE18CB0),),
                              onTap: () async {
                                TimeOfDay? time = await showTimePicker(
                                  context: context,
                                  initialTime: TimeOfDay.now(),
                                );
                                if (time != null) {
                                  final now = DateTime.now();
                                  _selectedTime = DateTime(
                                      now.year, now.month, now.day, time.hour,
                                      time.minute);
                                }
                              },
                            ),
                          ),
                          SizedBox(height: 30.h),
                          PrimaryButton(
                            onTap: () {
                              if (_formKey.currentState!.validate()) {
                                context.read<MedicalCubit>().addAlarm(
                                  dosage: int.tryParse(dosageController.text) ??
                                      0,
                                  frequency: int.tryParse(
                                      frequencyController.text) ?? 0,
                                  drugName: drugNameController.text,
                                  startDate: _selectedStartDate,
                                  endDate: _selectedEndDate,
                                  firstDosage: _selectedTime,
                                );
                              }
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
          ),
        );
      },
    );
  }

  @override
  void dispose() {
    drugNameController.dispose();
    dosageController.dispose();
    frequencyController.dispose();
    _selectedTime = DateTime.now();
    _selectedStartDate = DateTime.now();
    _selectedEndDate = DateTime.now();
    super.dispose();
  }
}
