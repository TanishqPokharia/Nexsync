import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:nexsync/router/app_router_constants.dart';
import 'package:nexsync/screens/splash.dart';
import 'package:nexsync/screens/welcome.dart';

class AppRouter {
  GoRouter router = GoRouter(routes: [
    GoRoute(
      name: AppRouterConstants.splashScreen,
      path: "/",
      pageBuilder: (context, state) =>
          const MaterialPage(child: SplashScreen()),
    ),
    GoRoute(
      name: AppRouterConstants.welcomeScreen,
      path: "/welcome",
      pageBuilder: (context, state) =>
          const MaterialPage(child: WelcomeScreen()),
    )
  ]);
}
