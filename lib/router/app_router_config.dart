import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:nexsync/main_page/employee_landing_page.dart';
import 'package:nexsync/main_page/hr_landing_page.dart';
import 'package:nexsync/models/employee_model.dart';
import 'package:nexsync/models/project_details.dart';
import 'package:nexsync/router/app_router_constants.dart';
import 'package:nexsync/screens/employee_profile.dart';
import 'package:nexsync/screens/login.dart';
import 'package:nexsync/screens/sign_up.dart';
import 'package:nexsync/screens/splash.dart';
import 'package:nexsync/screens/inside_project.dart';
import 'package:nexsync/screens/welcome.dart';

class AppRouter {
  GoRouter router = GoRouter(initialLocation: "/splash", routes: [
    GoRoute(
      name: AppRouterConstants.splashScreen,
      path: "/splash",
      pageBuilder: (context, state) =>
          const MaterialPage(child: SplashScreen()),
    ),
    GoRoute(
      name: AppRouterConstants.welcomeScreen,
      path: "/welcome",
      pageBuilder: (context, state) =>
          const MaterialPage(child: WelcomeScreen()),
    ),
    GoRoute(
      name: AppRouterConstants.landingScreenHR,
      path: "/landingHR",
      pageBuilder: (context, state) =>
          const MaterialPage(child: HRLandingPage()),
    ),
    GoRoute(
      name: AppRouterConstants.landingScreenEmployee,
      path: "/landingEmployee",
      pageBuilder: (context, state) =>
          const MaterialPage(child: EmployeeLandingPage()),
    ),
    GoRoute(
      name: AppRouterConstants.profileScreen,
      path: "/profile",
      pageBuilder: (context, state) {
        final dynamic employeeDetails = state.extra as Employee;
        return MaterialPage(
            child: EmployeeProfile(
          employee: employeeDetails,
        ));
      },
    ),
    GoRoute(
      name: AppRouterConstants.signUpScreen,
      path: "/signUp",
      pageBuilder: (context, state) =>
          const MaterialPage(child: SignUpScreen()),
    ),
    GoRoute(
        name: AppRouterConstants.logInScreen,
        path: "/logIn",
        pageBuilder: (context, state) {
          final dynamic isHR = state.extra as bool;
          return MaterialPage(child: LogInScreen(isHR: isHR));
        }),
    GoRoute(
      name: AppRouterConstants.insideProject,
      path: "/insideProject",
      pageBuilder: (context, state) {
        final dynamic projectDetails = state.extra as ProjectDetails;
        return MaterialPage(
            child: InsideProject(
          projectDetails: projectDetails,
        ));
      },
    )
  ]);
}
