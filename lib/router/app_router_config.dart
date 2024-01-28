import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:nexsync/router/app_router_constants.dart';
import 'package:nexsync/screens/splash.dart';

class AppRouter {
  GoRouter router = GoRouter(routes: [
    GoRoute(
      name: AppRouterConstants.splashScreen,
      path: "/",
      pageBuilder: (context, state) =>
          const MaterialPage(child: SplashScreen()),
    )
  ]);
}
