import 'package:empower_health/core/caching/caching_helper.dart';
import 'package:empower_health/core/utils/app_colors.dart';
import 'package:empower_health/features/authentication/cubit/auth_cubit.dart';
import 'package:empower_health/features/home/cubit/home_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'core/navigation/custom_navigator.dart';
import 'core/navigation/routes.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await CachingHelper.init();
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
        return MultiBlocProvider(
          providers: [
            BlocProvider(
              create: (context) => AuthCubit(),
            ),
            BlocProvider(
              create: (context) => HomeCubit(),
            ),
          ],
          child: MaterialApp(
            initialRoute: Routes.SPLASH,
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
          ),
        );
      },
    );
  }
}
