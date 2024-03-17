import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/common/custom_app_bar.dart';
import '../../../core/common/cutsom_text_field.dart';
import '../../../core/common/primary_button.dart';
import '../../../core/navigation/custom_navigator.dart';
import '../../../core/utils/app_styles.dart';

class ContactUsView extends StatefulWidget {
  const ContactUsView({Key? key}) : super(key: key);

  @override
  _ContactUsViewState createState() => _ContactUsViewState();
}

class _ContactUsViewState extends State<ContactUsView> {
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController messageController = TextEditingController();

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
                      "Contact Us",
                      style: AppStyles.bigText(),
                    ),
                    SizedBox(height: 30.h),
                    CustomTextField(
                      controller: nameController,
                      hintText: 'Name',
                    ),
                    SizedBox(height: 10.h),
                    CustomTextField(
                      controller: emailController,
                      hintText: 'Email Address',
                    ),
                    SizedBox(height: 10.h),
                    CustomTextField(
                      controller: phoneController,
                      hintText: 'Phone',
                    ),
                    SizedBox(height: 10.h),
                    CustomTextField(
                      controller: messageController,
                      hintText: 'Message',
                      isMultiline: true,
                    ),
                    SizedBox(height: 30.h),
                    PrimaryButton(
                      onTap: () {
                        CustomNavigator.pop();
                      },
                      width: double.infinity,
                      height: 45.h,
                      borderRadius: 8.r,
                      fontSize: 20.sp,
                      text: 'Submit',
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
