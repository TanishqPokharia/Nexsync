import 'package:flutter/material.dart';

class MQ {
  static double adaptiveSize(BuildContext context, double size) {
    return MediaQuery.of(context).size.height * size;
  }
}
