import 'package:empower_health/core/caching/caching_helper.dart';
import 'package:empower_health/core/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'core/navigation/custom_navigator.dart';
import 'core/navigation/routes.dart';

void main() async {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  await CachingHelper.init();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return ScreenUtilInit(
      designSize: const Size(430, 932),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (_, child) {
        FlutterNativeSplash.remove();
        return MaterialApp(
          initialRoute: Routes.LOGIN,
          // CachingHelper.instance!.readBoolean(CachingKey.ONBOARDING)
          //     ? Routes.HOME
          //     : Routes.BOARDING,
          navigatorKey: CustomNavigator.navigatorState,
          onGenerateRoute: CustomNavigator.onCreateRoute,
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            scaffoldBackgroundColor: AppColors.background,
            appBarTheme: const AppBarTheme(
              backgroundColor: Colors.transparent,
              iconTheme: IconThemeData(color: AppColors.primary),
            ),
          ),
          home: child,
        );
      },
    );
  }
}
