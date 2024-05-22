import 'package:empower_health/core/common/custom_app_bar.dart';
import 'package:empower_health/core/utils/app_images.dart';
import 'package:empower_health/features/authentication/view/widgets/auth_text_widget.dart';
import 'package:empower_health/features/authentication/view/widgets/social_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/common/cutsom_text_field.dart';
import '../../../core/common/primary_button.dart';
import '../../../core/navigation/custom_navigator.dart';
import '../../../core/navigation/routes.dart';
import '../../../core/utils/app_styles.dart';
import '../cubit/auth_cubit.dart';
import 'widgets/or_with_email.dart';

class SignupView extends StatefulWidget {
  const SignupView({super.key});

  @override
  _SignupViewState createState() => _SignupViewState();
}

class _SignupViewState extends State<SignupView> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController birthDateController = TextEditingController();
  TextEditingController genderController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: BlocConsumer<AuthCubit, AuthState>(
          listener: (context, state) {
            if (state is AuthRegisterSuccess) {
              CustomNavigator.push(Routes.HOME);
            }
          },
          builder: (context, state) => SingleChildScrollView(
            padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 20.h),
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  const CustomAppBar(),
                  SizedBox(height: 20.h),
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
                        Text(
                            "Don't have an account? Create one, it only takes a minute",
                            style: AppStyles.smallGreyText()),
                        SizedBox(height: 20.h),
                        SocialButton(
                          onTap: () {},
                          logo: AppImages.google,
                          color: const Color(0xff0BA04F),
                          title: 'Sign in  with Google',
                        ),
                        SizedBox(height: 10.h),
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
                        SizedBox(height: 20.h),
                        state is AuthLoading
                            ? const Center(child: CircularProgressIndicator())
                            : PrimaryButton(
                          onTap: () {
                            if (_formKey.currentState!.validate()) {
                              context.read<AuthCubit>().register(
                                mail: emailController.text,
                                password: passwordController.text,
                                birthdate: birthDateController.text,
                                gender: genderController.text,
                                name: nameController.text,
                              );
                            }
                          },
                          width: double.infinity,
                          height: 45.h,
                          borderRadius: 8.r,
                          fontSize: 20.sp,
                          text: 'Sign up',
                        ),
                        SizedBox(height: 20.h),
                        AuthText(
                          dummyText: 'Already a member? ',
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
        ),
      ),
    );
  }
}
