import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nexsync/router/app_router_config.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

const url = "https://oliamfvzkreflqyphmyu.supabase.co";
const key =
    "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Im9saWFtZnZ6a3JlZmxxeXBobXl1Iiwicm9sZSI6ImFub24iLCJpYXQiOjE3MTQwNTI1NzIsImV4cCI6MjAyOTYyODU3Mn0.c4ben6iyNQuOIdwi749UHf_VD1S2F77nzyLf99aeoks";
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Supabase.initialize(url: url, anonKey: key);
  runApp(const ProviderScope(child: MyApp()));
}

final supabase = Supabase.instance.client;

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: AppRouter().router,
      debugShowCheckedModeBanner: false,
    );
  }
}

extension AdaptiveSizeExtension on BuildContext {
  double adaptiveSize(double size) =>
      MediaQuery.of(this).size.height * (size / 1000);
}
