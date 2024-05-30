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

class LiverView extends StatefulWidget {
  const LiverView({super.key});

  @override
  State<LiverView> createState() => _LiverViewState();
}

class _LiverViewState extends State<LiverView> {
  TextEditingController ageController = TextEditingController();
  TextEditingController genderController = TextEditingController();
  TextEditingController totalBilirubinController = TextEditingController();
  TextEditingController directBilirubinController = TextEditingController();
  TextEditingController alkphosAlkalinePhosphotaseController =
      TextEditingController();
  TextEditingController sgptAlamineAminotransferaseController =
      TextEditingController();
  TextEditingController sgotAspartateAminotransferaseController =
      TextEditingController();
  TextEditingController totalProteinsController = TextEditingController();
  TextEditingController albAlbuminController = TextEditingController();
  TextEditingController aGRatioController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: BlocConsumer<MedicalCubit, MedicalState>(
          listener: (context, state) {
            if (state is PredictLiverDiseaseSuccess) {
              CustomNavigator.push(Routes.LIVERRESULT);
            }
          },
          builder: (context, state) => SingleChildScrollView(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  SizedBox(height: 20.h),
                  CustomAppBar(
                      icon: true, onPressed: () => CustomNavigator.pop()),
                  SizedBox(height: 50.h),
                  Container(
                    width: double.infinity,
                    padding:
                        EdgeInsets.symmetric(horizontal: 14.w, vertical: 14.h),
                    decoration: AppStyles.container(),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Upload Your Liver Analysis",
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
                          controller: genderController,
                          hintText: 'Enter your gender',
                        ),
                        SizedBox(height: 10.h),
                        CustomTextField(
                          controller: totalBilirubinController,
                          hintText: 'Enter your total bilirubin',
                        ),
                        SizedBox(height: 10.h),
                        CustomTextField(
                          controller: directBilirubinController,
                          hintText: 'Enter your direct bilirubin',
                        ),
                        SizedBox(height: 10.h),
                        CustomTextField(
                          controller: alkphosAlkalinePhosphotaseController,
                          hintText: 'Enter your alkphos alkaline phosphotase',
                        ),
                        SizedBox(height: 10.h),
                        CustomTextField(
                          controller: sgptAlamineAminotransferaseController,
                          hintText: 'Enter your sgpt alamine aminotransferase',
                        ),
                        SizedBox(height: 10.h),
                        CustomTextField(
                          controller: sgotAspartateAminotransferaseController,
                          hintText:
                              'Enter your sgot aspartate aminotransferase',
                        ),
                        SizedBox(height: 10.h),
                        CustomTextField(
                          controller: totalProteinsController,
                          hintText: 'Enter your total proteins',
                        ),
                        SizedBox(height: 10.h),
                        CustomTextField(
                          controller: albAlbuminController,
                          hintText: 'Enter your alb albumin',
                        ),
                        SizedBox(height: 10.h),
                        CustomTextField(
                          controller: aGRatioController,
                          hintText: 'Enter your a g ratio',
                        ),
                        SizedBox(height: 40.h),
                        PrimaryButton(
                          onTap: () {
                            if (_formKey.currentState!.validate()) {
                              context.read<MedicalCubit>().predictLiverDisease(
                                    age: int.tryParse(ageController.text) ?? 0,
                                    gender: genderController.text,
                                    total_bilirubin: double.tryParse(
                                            totalBilirubinController.text) ??
                                        0.0,
                                    direct_bilirubin: double.tryParse(
                                            directBilirubinController.text) ??
                                        0.0,
                                    alkphos_alkaline_phosphotase: double.tryParse(
                                            alkphosAlkalinePhosphotaseController
                                                .text) ??
                                        0.0,
                                    a_g_ratio: double.tryParse(
                                            aGRatioController.text) ??
                                        0.0,
                                    alb_albumin: double.tryParse(
                                            albAlbuminController.text) ??
                                        0.0,
                                    sgot_aspartate_aminotransferase:
                                        double.tryParse(
                                                sgotAspartateAminotransferaseController
                                                    .text) ??
                                            0.0,
                                    sgpt_alamine_aminotransferase: double.tryParse(
                                            sgptAlamineAminotransferaseController
                                                .text) ??
                                        0.0,
                                    total_proteins: double.tryParse(
                                            totalProteinsController.text) ??
                                        0.0,
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
    genderController.dispose();
    totalBilirubinController.dispose();
    directBilirubinController.dispose();
    alkphosAlkalinePhosphotaseController.dispose();
    sgptAlamineAminotransferaseController.dispose();
    sgotAspartateAminotransferaseController.dispose();
    totalProteinsController.dispose();
    albAlbuminController.dispose();
    aGRatioController.dispose();
    super.dispose();
  }
}
