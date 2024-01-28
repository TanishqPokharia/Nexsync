import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:nexsync/mediaquery/media_query.dart';
import 'package:nexsync/router/app_router_constants.dart';
import 'package:shimmer/shimmer.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.delayed(const Duration(seconds: 2), () {
      GoRouter.of(context).goNamed(AppRouterConstants.welcomeScreen);
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
                padding: EdgeInsets.all(MQ.adaptiveSize(context, 10)),
                margin: EdgeInsets.all(MQ.adaptiveSize(context, 10)),
                height: MQ.adaptiveSize(context, 150),
                width: MQ.adaptiveSize(context, 150),
                child: Image.asset("assets/nex.png")),
            Shimmer(
              period: Duration(seconds: 2),
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
                style: TextStyle(fontSize: MQ.adaptiveSize(context, 40)),
              ),
            )
          ],
        ),
      ),
    );
  }
}
