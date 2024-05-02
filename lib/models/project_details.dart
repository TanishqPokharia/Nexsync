import 'package:flutter/widgets.dart';
import 'package:nexsync/models/employee_model.dart';
import 'package:nexsync/screens/employee_profile.dart';

class ProjectDetails {
  final AssetImage backgroundImage;
  final String startDate;
  final String endDate;
  final String projectName;
  final String projectID;
  final String department;
  final String departmentHead;
  int totalEmployees;
  Set<Employee>? employeeAssigned;

  ProjectDetails(
      {required this.backgroundImage,
      required this.startDate,
      required this.endDate,
      required this.projectName,
      required this.projectID,
      required this.department,
      required this.departmentHead,
      required this.totalEmployees,
      required this.employeeAssigned});
}
