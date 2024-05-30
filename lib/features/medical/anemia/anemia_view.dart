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


class AnemiaView extends StatefulWidget {
  const AnemiaView({super.key});

  @override
  State<AnemiaView> createState() => _AnemiaViewState();
}

class _AnemiaViewState extends State<AnemiaView> {
  TextEditingController genderController = TextEditingController();
  TextEditingController hemoglobinController = TextEditingController();
  TextEditingController mCHController = TextEditingController();
  TextEditingController mCHCController = TextEditingController();
  TextEditingController mCVController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: BlocConsumer<MedicalCubit, MedicalState>(
          listener: (context, state) {
            if (state is PredictAnemiaDiseaseSuccess) {
              CustomNavigator.push(Routes.ANEMIARESULT);
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
                          "Upload Your Anemia Analysis",
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
                          controller: genderController,
                          hintText: 'Enter your gender',
                        ),
                        SizedBox(height: 10.h),
                        CustomTextField(
                          controller: hemoglobinController,
                          hintText: 'Enter your hemoglobin',
                        ),
                        SizedBox(height: 10.h),
                        CustomTextField(
                          controller: mCHController,
                          hintText: 'Enter your MCH',
                        ),
                        SizedBox(height: 10.h),
                        CustomTextField(
                          controller: mCHCController,
                          hintText: 'Enter your MCHC',
                        ),
                        SizedBox(height: 10.h),
                        CustomTextField(
                          controller: mCVController,
                          hintText: 'Enter your MCV',
                        ),
                        SizedBox(height: 40.h),
                        PrimaryButton(
                          onTap: () {
                            if (_formKey.currentState!.validate()) {
                              context.read<MedicalCubit>().predictAnemiaDisease(
                                gender: genderController.text,
                                hemoglobin: double.tryParse(hemoglobinController.text) ?? 0.0,
                                mCH: double.tryParse(mCHController.text) ?? 0.0,
                                mCHC: double.tryParse(mCHCController.text) ?? 0.0,
                                mCV: double.tryParse(mCVController.text) ?? 0.0,
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
    genderController.dispose();
    hemoglobinController.dispose();
    mCHController.dispose();
    mCHCController.dispose();
    mCVController.dispose();
    super.dispose();
  }
}
