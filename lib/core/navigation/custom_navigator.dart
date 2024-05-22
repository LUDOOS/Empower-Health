import 'package:empower_health/core/navigation/routes.dart';
import 'package:empower_health/features/alarm/add_alarm_view.dart';
import 'package:empower_health/features/alarm/alarm_view.dart';
import 'package:empower_health/features/authentication/view/contact_us_view.dart';
import 'package:empower_health/features/authentication/view/forget_password_view.dart';
import 'package:empower_health/features/authentication/view/login_view.dart';
import 'package:empower_health/features/authentication/view/onboarding_view.dart';
import 'package:empower_health/features/authentication/view/signup_view.dart';
import 'package:empower_health/features/authentication/view/splash_view.dart';
import 'package:empower_health/features/home/view/home_view.dart';
import 'package:empower_health/features/medical/medical_type_view.dart';
import 'package:empower_health/features/medical/medical_view.dart';
import 'package:empower_health/features/medical/result_view.dart';
import 'package:empower_health/features/profile/profile_view.dart';
import 'package:flutter/material.dart';

import '../../main.dart';

const begin = Offset(0.0, 1.0);
const end = Offset.zero;
const curve = Curves.bounceInOut;
var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

abstract class CustomNavigator {
  static final GlobalKey<NavigatorState> navigatorState =
      GlobalKey<NavigatorState>();

  static Route<dynamic> onCreateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.SPLASH:
        return PageRouteBuilder(
            pageBuilder: (context, animation, secondaryAnimation) =>
                const SplashView(),
            transitionsBuilder:
                (context, animation, secondaryAnimation, child) {
              return SlideTransition(
                position: animation.drive(tween),
                child: child,
              );
            });
      case Routes.BOARDING:
        return PageRouteBuilder(
            pageBuilder: (context, animation, secondaryAnimation) =>
                const OnboardingView(),
            transitionsBuilder:
                (context, animation, secondaryAnimation, child) {
              return SlideTransition(
                position: animation.drive(tween),
                child: child,
              );
            });
      case Routes.HOME:
        return PageRouteBuilder(
            pageBuilder: (context, animation, secondaryAnimation) =>
                const HomeView(),
            transitionsBuilder:
                (context, animation, secondaryAnimation, child) {
              return SlideTransition(
                position: animation.drive(tween),
                child: child,
              );
            });
      case Routes.PROFILE:
        return PageRouteBuilder(
            pageBuilder: (context, animation, secondaryAnimation) =>
                const ProfileView(),
            transitionsBuilder:
                (context, animation, secondaryAnimation, child) {
              return SlideTransition(
                position: animation.drive(tween),
                child: child,
              );
            });
      case Routes.MEDICAL:
        return PageRouteBuilder(
            pageBuilder: (context, animation, secondaryAnimation) =>
                const MedicalView(),
            transitionsBuilder:
                (context, animation, secondaryAnimation, child) {
              return SlideTransition(
                position: animation.drive(tween),
                child: child,
              );
            });
      case Routes.RESULT:
        return PageRouteBuilder(
            pageBuilder: (context, animation, secondaryAnimation) =>
                const ResultView(),
            transitionsBuilder:
                (context, animation, secondaryAnimation, child) {
              return SlideTransition(
                position: animation.drive(tween),
                child: child,
              );
            });
      case Routes.LOGIN:
        return PageRouteBuilder(
            pageBuilder: (context, animation, secondaryAnimation) =>
                const LoginView(),
            transitionsBuilder:
                (context, animation, secondaryAnimation, child) {
              return SlideTransition(
                position: animation.drive(tween),
                child: child,
              );
            });
      case Routes.SIGNUP:
        return PageRouteBuilder(
            pageBuilder: (context, animation, secondaryAnimation) =>
                const SignupView(),
            transitionsBuilder:
                (context, animation, secondaryAnimation, child) {
              return SlideTransition(
                position: animation.drive(tween),
                child: child,
              );
            });
      case Routes.FORGET_PASSWORD:
        return PageRouteBuilder(
            pageBuilder: (context, animation, secondaryAnimation) =>
                const ForgetPasswordView(),
            transitionsBuilder:
                (context, animation, secondaryAnimation, child) {
              return SlideTransition(
                position: animation.drive(tween),
                child: child,
              );
            });
      case Routes.MEDICAL_TYPE:
        return PageRouteBuilder(
            pageBuilder: (context, animation, secondaryAnimation) =>
                const MedicalTypeView(),
            transitionsBuilder:
                (context, animation, secondaryAnimation, child) {
              return SlideTransition(
                position: animation.drive(tween),
                child: child,
              );
            });
      case Routes.CONTACT_US:
        return PageRouteBuilder(
            pageBuilder: (context, animation, secondaryAnimation) =>
                const ContactUsView(),
            transitionsBuilder:
                (context, animation, secondaryAnimation, child) {
              return SlideTransition(
                position: animation.drive(tween),
                child: child,
              );
            });
      case Routes.ALARM:
        return PageRouteBuilder(
            pageBuilder: (context, animation, secondaryAnimation) =>
                const AlarmView(),
            transitionsBuilder:
                (context, animation, secondaryAnimation, child) {
              return SlideTransition(
                position: animation.drive(tween),
                child: child,
              );
            });
      case Routes.ADDALARM:
        return PageRouteBuilder(
            pageBuilder: (context, animation, secondaryAnimation) =>
                const AddAlarmView(),
            transitionsBuilder:
                (context, animation, secondaryAnimation, child) {
              return SlideTransition(
                position: animation.drive(tween),
                child: child,
              );
            });
      default:
        return MaterialPageRoute(builder: (_) => const MyApp());
    }
  }

  static pop({dynamic result}) {
    if (navigatorState.currentState!.canPop()) {
      navigatorState.currentState!.pop(result);
    }
  }

  static push(String routeName,
      {arguments, bool replace = false, bool clean = false}) {
    if (clean) {
      return navigatorState.currentState!.pushNamedAndRemoveUntil(
          routeName, (_) => false,
          arguments: arguments);
    } else if (replace) {
      return navigatorState.currentState!
          .pushReplacementNamed(routeName, arguments: arguments);
    } else {
      return navigatorState.currentState!
          .pushNamed(routeName, arguments: arguments);
    }
  }
}
