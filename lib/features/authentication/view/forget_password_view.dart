import 'package:empower_health/features/authentication/view/widgets/auth_text_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/common/custom_app_bar.dart';
import '../../../core/common/cutsom_text_field.dart';
import '../../../core/common/primary_button.dart';
import '../../../core/navigation/custom_navigator.dart';
import '../../../core/navigation/routes.dart';
import '../../../core/utils/app_styles.dart';

class ForgetPasswordView extends StatefulWidget {
  const ForgetPasswordView({super.key});

  @override
  _ForgetPasswordViewState createState() => _ForgetPasswordViewState();
}

class _ForgetPasswordViewState extends State<ForgetPasswordView> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController birthDateController = TextEditingController();
  TextEditingController genderController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 20.h),
          child: Column(
            children: [
              const CustomAppBar(),
              SizedBox(height: 40.h),
              Container(
                width: double.infinity,
                padding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 30.h),
                decoration: AppStyles.container(),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Sign up to health sense",
                      style: AppStyles.bigText(),
                    ),
                    SizedBox(height: 5.h),
                    Text(
                        "Enter the email address and some information associated with your account.",
                        style: AppStyles.smallGreyText()),
                    SizedBox(height: 30.h),
                    CustomTextField(
                      controller: emailController,
                      hintText: 'Email Address',
                    ),
                    SizedBox(height: 10.h),
                    CustomTextField(
                      controller: nameController,
                      hintText: 'Name',
                    ),
                    SizedBox(height: 10.h),
                    CustomTextField(
                      controller: passwordController,
                      hintText: 'Password',
                    ),
                    SizedBox(height: 10.h),
                    CustomTextField(
                      controller: birthDateController,
                      hintText: 'Birthdate',
                    ),
                    SizedBox(height: 10.h),
                    CustomTextField(
                      controller: genderController,
                      hintText: 'Gender',
                    ),
                    SizedBox(height: 30.h),
                    PrimaryButton(
                      onTap: () {
                        CustomNavigator.push(Routes.HOME);
                      },
                      width: double.infinity,
                      height: 45.h,
                      borderRadius: 8.r,
                      fontSize: 20.sp,
                      text: 'Reset Password',
                    ),
                    SizedBox(height: 20.h),
                    AuthText(
                      dummyText: 'Return to  ',
                      link: 'Sign in',
                      onTap: () => CustomNavigator.push(Routes.LOGIN),
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
