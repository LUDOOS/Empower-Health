import 'package:empower_health/core/common/custom_app_bar.dart';
import 'package:empower_health/core/utils/app_images.dart';
import 'package:empower_health/features/authentication/view/widgets/auth_text_widget.dart';
import 'package:empower_health/features/authentication/view/widgets/social_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/common/cutsom_text_field.dart';
import '../../../core/common/primary_button.dart';
import '../../../core/navigation/custom_navigator.dart';
import '../../../core/navigation/routes.dart';
import '../../../core/utils/app_styles.dart';
import 'widgets/or_with_email.dart';

class LoginView extends StatefulWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  _LoginViewState createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 20.h),
          child: Column(
            children: [
              const CustomAppBar(),
              SizedBox(height: 70.h),
              Container(
                width: double.infinity,
                padding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 30.h),
                decoration: AppStyles.container(),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Sign in to health sense",
                      style: AppStyles.bigText(),
                    ),
                    SizedBox(height: 40.h),
                    SocialButton(
                      onTap: () {},
                      logo: AppImages.google,
                      color: const Color(0xff0BA04F),
                      title: 'Sign in  with Google',
                    ),
                    SizedBox(height: 20.h),
                    SocialButton(
                      onTap: () {},
                      logo: AppImages.facebook,
                      color: const Color(0xff1874EB),
                      title: 'Sign in  with Facebook',
                    ),
                    const OrWithEmail(),
                    CustomTextField(
                      controller: emailController,
                      hintText: 'Email Address',
                    ),
                    Align(
                      alignment: Alignment.centerRight,
                      child: TextButton(
                        style: TextButton.styleFrom(
                            padding: EdgeInsets.only(top: 10.h)),
                        onPressed: () =>
                            CustomNavigator.push(Routes.FORGET_PASSWORD),
                        child: const Text("Forget Password ?"),
                      ),
                    ),
                    CustomTextField(
                      controller: passwordController,
                      hintText: 'password',
                    ),
                    SizedBox(height: 40.h),
                    PrimaryButton(
                      onTap: () {
                        CustomNavigator.push(Routes.HOME);
                      },
                      width: double.infinity,
                      height: 45.h,
                      borderRadius: 8.r,
                      fontSize: 20.sp,
                      text: 'Login',
                    ),
                    SizedBox(height: 40.h),
                    AuthText(
                      dummyText: 'Not a member? ',
                      link: 'Sign Up',
                      onTap: () => CustomNavigator.push(Routes.SIGNUP),
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
