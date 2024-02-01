import 'package:flutter/material.dart';

class Engagement {
  Engagement(this.engagement, this.color, this.employees);
  String engagement;
  Color color;
  int employees;
}

List<Engagement> engagementList = [
  Engagement("Working", Colors.green, 70),
  Engagement("Not Working", Colors.grey, 20),
  Engagement("On Leave", Colors.red, 10)
];
