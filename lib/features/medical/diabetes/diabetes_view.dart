import 'package:empower_health/core/common/primary_button.dart';
import 'package:empower_health/core/navigation/custom_navigator.dart';
import 'package:empower_health/core/navigation/routes.dart';
import 'package:empower_health/core/utils/app_styles.dart';
import 'package:empower_health/features/medical/cubit/medical_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../core/common/custom_app_bar.dart';
import '../../../core/common/cutsom_text_field.dart';


class DiabetesView extends StatefulWidget {
  const DiabetesView({super.key});

  @override
  State<DiabetesView> createState() => _DiabetesViewState();
}

class _DiabetesViewState extends State<DiabetesView> {
  TextEditingController ageController = TextEditingController();
  TextEditingController pregnanciesController = TextEditingController();
  TextEditingController glucoseController = TextEditingController();
  TextEditingController bloodPressureController = TextEditingController();
  TextEditingController skinThicknessController = TextEditingController();
  TextEditingController insulinController = TextEditingController();
  TextEditingController bMIController = TextEditingController();
  TextEditingController diabetesPedigreeFunctionController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: BlocConsumer<MedicalCubit, MedicalState>(
          listener: (context, state) {
            if (state is PredictDiabetesDiseaseSuccess) {
              CustomNavigator.push(Routes.DIABETESRESULT);
            }
          },
          builder: (context, state) => SingleChildScrollView(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: Form(
              key: _formKey,
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
                          "Upload Your Diabetes Analysis",
                          style: AppStyles.bigText(),
                        ),
                        Text(
                          "Upload your medical analysis information",
                          style: TextStyle(
                            fontSize: 14.sp,
                            color: Colors.grey[600],
                          ),
                        ),
                        SizedBox(height: 20.h),
                        CustomTextField(
                          controller: ageController,
                          hintText: 'Enter your age',
                        ),
                        SizedBox(height: 10.h),
                        CustomTextField(
                          controller: pregnanciesController,
                          hintText: 'Enter your pregnancies',
                        ),
                        SizedBox(height: 10.h),
                        CustomTextField(
                          controller: glucoseController,
                          hintText: 'Enter your glucose',
                        ),
                        SizedBox(height: 10.h),
                        CustomTextField(
                          controller: bloodPressureController,
                          hintText: 'Enter your blood pressure',
                        ),
                        SizedBox(height: 10.h),
                        CustomTextField(
                          controller: skinThicknessController,
                          hintText: 'Enter your skin thickness',
                        ),
                        SizedBox(height: 10.h),
                        CustomTextField(
                          controller: insulinController,
                          hintText: 'Enter your insulin',
                        ),
                        SizedBox(height: 10.h),
                        CustomTextField(
                          controller: bMIController,
                          hintText: 'Enter your BMI',
                        ),
                        SizedBox(height: 10.h),
                        CustomTextField(
                          controller: diabetesPedigreeFunctionController,
                          hintText: 'Enter your diabetes pedigree function',
                        ),
                        SizedBox(height: 40.h),
                        PrimaryButton(
                          onTap: () {
                            if (_formKey.currentState!.validate()) {
                              context.read<MedicalCubit>().predictDiabetesDisease(
                                age: int.tryParse(ageController.text) ?? 0,
                                pregnancies: int.tryParse(pregnanciesController.text) ?? 0,
                                glucose: double.tryParse(glucoseController.text) ?? 0.0,
                                bloodPressure: double.tryParse(bloodPressureController.text) ?? 0.0,
                                skinThickness: double.tryParse(skinThicknessController.text) ?? 0.0,
                                insulin: double.tryParse(insulinController.text) ?? 0.0,
                                bMI: double.tryParse(bMIController.text) ?? 0.0,
                                diabetesPedigreeFunction: double.tryParse(diabetesPedigreeFunctionController.text) ?? 0.0,
                             );
                            }
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
        ),
      ),
    );
  }

  @override
  void dispose() {
    ageController.dispose();
    pregnanciesController.dispose();
    glucoseController.dispose();
    bloodPressureController.dispose();
    skinThicknessController.dispose();
    insulinController.dispose();
    bMIController.dispose();
    diabetesPedigreeFunctionController.dispose();
    super.dispose();
  }
}
