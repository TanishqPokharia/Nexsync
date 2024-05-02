import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:nexsync/main.dart';
import 'package:nexsync/router/app_router_constants.dart';
import 'package:shimmer/shimmer.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.delayed(const Duration(seconds: 2, milliseconds: 500), () async {
      final session = supabase.auth.currentSession;
      if (!mounted) return;
      if (session == null) {
        GoRouter.of(context).goNamed(AppRouterConstants.welcomeScreen);
      } else {
        final role = await supabase
            .from("Profiles")
            .select('role')
            .eq('id', session.user.id);
        if (!mounted) return;
        if (role[0]['role'] == "HR") {
          GoRouter.of(context).goNamed(AppRouterConstants.landingScreenHR);
        } else {
          GoRouter.of(context)
              .goNamed(AppRouterConstants.landingScreenEmployee);
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 31, 31, 31),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
                padding: EdgeInsets.all(context.adaptiveSize(10)),
                margin: EdgeInsets.all(context.adaptiveSize(10)),
                height: context.adaptiveSize(150),
                width: context.adaptiveSize(150),
                child: Image.asset("assets/nex.png")),
            Shimmer(
              period: Duration(seconds: 2, milliseconds: 700),
              loop: 1,
              direction: ShimmerDirection.ltr,
              gradient: const LinearGradient(colors: [
                Colors.white,
                Colors.yellow,
                Colors.pink,
                Colors.blue,
                Colors.cyan
              ]),
              child: Text(
                "NexSync",
                style: TextStyle(fontSize: context.adaptiveSize(40)),
              ),
            )
          ],
        ),
      ),
    );
  }
}
