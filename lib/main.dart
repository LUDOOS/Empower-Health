import 'package:empower_health/core/caching/caching_helper.dart';
import 'package:empower_health/core/utils/app_colors.dart';
import 'package:empower_health/features/authentication/cubit/auth_cubit.dart';
import 'package:empower_health/features/home/cubit/home_cubit.dart';
import 'package:empower_health/features/medical/cubit/medical_cubit.dart';
import 'package:empower_health/features/profile/cubit/profile_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:workmanager/workmanager.dart';
import 'core/navigation/custom_navigator.dart';
import 'core/navigation/routes.dart';
import 'core/notification/notification_service.dart';
import 'package:timezone/timezone.dart' as tz;
import 'package:timezone/data/latest.dart' as tzdata;
@pragma('vm:entry-point') // Mandatory if the App is obfuscated or using Flutter 3.1+
void callbackDispatcher() {
  Workmanager().executeTask((task, inputData) async {
    int? totalExecutions;
    final _sharedPreference = await SharedPreferences.getInstance(); //Initialize dependency

    try { //add code execution
      totalExecutions = _sharedPreference.getInt("totalExecutions");
      _sharedPreference.setInt("totalExecutions", totalExecutions == null ? 1 : totalExecutions+1);
    } catch(err) {
      print(err.toString());
      //Logger().e(err.toString()); // Logger flutter package, prints error on the debug console
      throw Exception(err);
    }
    print("Native called background task: $task"); //simpleTask will be emitted here.
    return Future.value(true);
  });
}
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final NotificationService notificationService = NotificationService();
  notificationService.init();
  Workmanager().initialize(
      callbackDispatcher, // The top level function, aka callbackDispatcher
      isInDebugMode: true // If enabled it will post a notification whenever the task is running. Handy for debugging tasks
  );
  // Workmanager().registerOneOffTask("task-identifier", "simpleTask", inputData: {'help':"helpee"},);
  await CachingHelper.init();
  try {
    tzdata.initializeTimeZones();
    tz.setLocalLocation(tz.getLocation('Africa/Cairo'));
    final now = tz.TZDateTime.now(tz.local);
    print(now);
  } catch (e) {
    print('An error occurred: $e');
  }
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
            BlocProvider(
              create: (context) => MedicalCubit()..loadAlarms(),
            ),
            BlocProvider(
              create: (context) => ProfileCubit(),
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
