import 'package:flutter/material.dart';

class EmployeeNexus extends StatefulWidget {
  const EmployeeNexus({super.key});

  @override
  State<EmployeeNexus> createState() => _EmployeeNexusState();
}

class _EmployeeNexusState extends State<EmployeeNexus> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [],
          ),
        ),
      ),
    );
  }
}
