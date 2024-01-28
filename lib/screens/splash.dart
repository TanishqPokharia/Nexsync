import 'package:flutter/material.dart';
import 'package:nexsync/mediaquery/media_query.dart';
import 'package:shimmer/shimmer.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Container(
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
            // period: Duration(milliseconds: 100),
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
      )),
    );
  }
}
