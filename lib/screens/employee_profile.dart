import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:nexsync/main.dart';
import 'package:nexsync/models/employee_model.dart';
import 'package:nexsync/models/employee_performance.dart';

class EmployeeProfile extends StatefulWidget {
  EmployeeProfile({super.key, required this.employee});
  final Employee employee;
  String department = "Loading...";
  String projectName = "Loading...";

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return EmployeeProfileState();
  }
}

class EmployeeProfileState extends State<EmployeeProfile> {
  fetchDepartment() async {
    final result = await supabase
        .from("Department")
        .select("Department_Name")
        .eq("Department_ID", widget.employee.departmentID!);
    final fetchedDepartment = result[0]['Department_Name'];
    return fetchedDepartment;
  }

  fetchProjectName() async {
    if (widget.employee.projectID != null) {
      final result = await supabase
          .from("Project")
          .select("Project_Name")
          .eq("Project_ID", widget.employee.projectID!);
      final projectName = result[0]['Project_Name'];
      return projectName;
    } else {
      return "No current project";
    }
  }

  void setProjectName() async {
    final result = await fetchProjectName();
    setState(() {
      widget.projectName = result;
    });
  }

  void setDepartment() async {
    final result = await fetchDepartment();
    setState(() {
      widget.department = result;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setDepartment();
    setProjectName();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Profile",
          style: TextStyle(fontSize: context.adaptiveSize(32)),
        ),
        foregroundColor: Colors.white,
        backgroundColor: Color.fromARGB(255, 78, 78, 78),
      ),
      backgroundColor: Color.fromARGB(255, 49, 48, 48),
      body: Container(
        child: SingleChildScrollView(
            child: Column(children: [
          Container(
            margin: EdgeInsets.all(context.adaptiveSize(20)),
            padding: EdgeInsets.all(context.adaptiveSize(20)),
            decoration: BoxDecoration(
                color: Color.fromARGB(255, 78, 78, 78),
                borderRadius: BorderRadius.circular(context.adaptiveSize(10))),
            child: Row(
              children: [
                Icon(
                  Icons.perm_identity_sharp,
                  color: Colors.white.withOpacity(0.8),
                  size: context.adaptiveSize(40),
                ),
                SizedBox(
                  width: context.adaptiveSize(10),
                ),
                Row(children: [
                  Text(
                    "Employee ID: ",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: context.adaptiveSize(24)),
                  ),
                  Container(
                    width: context.adaptiveSize(200),
                    child: Text(
                      widget.employee.employeeID,
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: context.adaptiveSize(24)),
                    ),
                  ),
                ]),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.all(context.adaptiveSize(20)),
            padding: EdgeInsets.all(context.adaptiveSize(20)),
            decoration: BoxDecoration(
                color: Color.fromARGB(255, 78, 78, 78),
                borderRadius: BorderRadius.circular(context.adaptiveSize(10))),
            child: Row(
              children: [
                Icon(
                  Icons.person,
                  color: Colors.white.withOpacity(0.8),
                  size: context.adaptiveSize(40),
                ),
                SizedBox(
                  width: context.adaptiveSize(10),
                ),
                Row(children: [
                  Text(
                    "Name: ",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: context.adaptiveSize(24)),
                  ),
                  Container(
                    width: context.adaptiveSize(250),
                    child: Text(
                      widget.employee.name,
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: context.adaptiveSize(24)),
                    ),
                  ),
                ]),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.all(context.adaptiveSize(20)),
            padding: EdgeInsets.all(context.adaptiveSize(20)),
            decoration: BoxDecoration(
                color: Color.fromARGB(255, 78, 78, 78),
                borderRadius: BorderRadius.circular(context.adaptiveSize(10))),
            child: Row(
              children: [
                Icon(
                  Icons.business,
                  color: Colors.white.withOpacity(0.8),
                  size: context.adaptiveSize(40),
                ),
                SizedBox(
                  width: context.adaptiveSize(10),
                ),
                Row(children: [
                  Text(
                    "Department: ",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: context.adaptiveSize(24)),
                  ),
                  Container(
                    width: context.adaptiveSize(200),
                    child: Text(
                      widget.department,
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: context.adaptiveSize(24)),
                    ),
                  ),
                ]),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.all(context.adaptiveSize(20)),
            padding: EdgeInsets.all(context.adaptiveSize(20)),
            decoration: BoxDecoration(
                color: Color.fromARGB(255, 78, 78, 78),
                borderRadius: BorderRadius.circular(context.adaptiveSize(10))),
            child: Row(
              children: [
                Icon(
                  Icons.credit_card,
                  color: Colors.white.withOpacity(0.8),
                  size: context.adaptiveSize(40),
                ),
                SizedBox(
                  width: context.adaptiveSize(10),
                ),
                Row(children: [
                  Text(
                    "Deparment ID: ",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: context.adaptiveSize(24)),
                  ),
                  Container(
                    width: context.adaptiveSize(180),
                    child: Text(
                      widget.employee.departmentID!,
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: context.adaptiveSize(24)),
                    ),
                  ),
                ]),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.all(context.adaptiveSize(20)),
            padding: EdgeInsets.all(context.adaptiveSize(20)),
            decoration: BoxDecoration(
                color: Color.fromARGB(255, 78, 78, 78),
                borderRadius: BorderRadius.circular(context.adaptiveSize(10))),
            child: Row(
              children: [
                Icon(
                  Icons.work,
                  color: Colors.white.withOpacity(0.8),
                  size: context.adaptiveSize(40),
                ),
                SizedBox(
                  width: context.adaptiveSize(10),
                ),
                Row(children: [
                  Text(
                    "Designation: ",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: context.adaptiveSize(24)),
                  ),
                  Container(
                    width: context.adaptiveSize(200),
                    child: Text(
                      widget.employee.designation!,
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: context.adaptiveSize(24)),
                    ),
                  ),
                ]),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.all(context.adaptiveSize(20)),
            padding: EdgeInsets.all(context.adaptiveSize(20)),
            decoration: BoxDecoration(
                color: Color.fromARGB(255, 78, 78, 78),
                borderRadius: BorderRadius.circular(context.adaptiveSize(10))),
            child: Row(
              children: [
                Icon(
                  Icons.assignment,
                  color: Colors.white.withOpacity(0.8),
                  size: context.adaptiveSize(40),
                ),
                SizedBox(
                  width: context.adaptiveSize(10),
                ),
                Row(children: [
                  Text(
                    "Project: ",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: context.adaptiveSize(24)),
                  ),
                  Container(
                    width: context.adaptiveSize(250),
                    child: Text(
                      widget.projectName,
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: context.adaptiveSize(24)),
                    ),
                  ),
                ]),
              ],
            ),
          ),
        ])),
      ),
    );
  }
}
