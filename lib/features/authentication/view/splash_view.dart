import 'dart:async';

import 'package:empower_health/core/caching/caching_helper.dart';
import 'package:empower_health/core/caching/caching_key.dart';
import 'package:empower_health/core/navigation/custom_navigator.dart';
import 'package:empower_health/core/navigation/routes.dart';
import 'package:empower_health/core/utils/app_images.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  _SplashViewState createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 3), () {
      CachingHelper.instance!.readBoolean(CachingKey.ONBOARDING)?null:
      CustomNavigator.push(Routes.BOARDING, clean: true);
      CustomNavigator.push(
          CachingHelper.instance!.readBoolean(CachingKey.IS_LOGIN)?
          Routes.HOME :
          Routes.LOGIN,
          clean: true);

    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(80.w),
          child: Image.asset(
            AppImages.splash,
            fit: BoxFit.contain,
          ),
        ),
      ),
    );
  }
}
