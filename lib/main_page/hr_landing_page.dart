import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';
import 'package:nexsync/auth/auth_services.dart';
import 'package:nexsync/main.dart';
import 'package:nexsync/models/app_bar_selected.dart';
import 'package:nexsync/router/app_router_constants.dart';
import 'package:nexsync/screens/hr_nexus.dart';
import 'package:nexsync/screens/stats.dart';

class HRLandingPage extends StatefulWidget {
  const HRLandingPage({super.key});

  @override
  State<HRLandingPage> createState() => _HRLandingPageState();
}

class _HRLandingPageState extends State<HRLandingPage> {
  Widget? currentScreen = StatsPage();
  Selected current = Selected(selectedIndex: 0, color: Colors.yellow);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 31, 31, 31),
      appBar: AppBar(
          title: Text(
            "HR Nexus",
            style: TextStyle(color: Colors.white),
          ),
          backgroundColor: Color.fromARGB(255, 78, 78, 78),
          actions: [
            Row(children: [
              Text(
                "Logout",
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
              IconButton(
                  onPressed: () async {
                    if (!context.mounted) {
                      return;
                    }
                    await AuthServices.logout();
                    GoRouter.of(context)
                        .goNamed(AppRouterConstants.splashScreen);
                  },
                  icon: Icon(
                    Icons.logout,
                    color: Colors.white,
                  )),
            ]),
          ]),
      body: HRNexus(),
    );
  }
}
