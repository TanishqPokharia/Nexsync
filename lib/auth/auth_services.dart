import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:go_router/go_router.dart';
import 'package:nexsync/main.dart';
import 'package:nexsync/router/app_router_constants.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class AuthServices {
  static signUpHR(String email, String password) async {
    await supabase.auth.signUp(email: email, password: password);
  }

  static logInHR(String email, String password) async {
    await supabase.auth.signInWithPassword(email: email, password: password);
  }

  static logout() async {
    await supabase.auth.signOut();
  }
}
