import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:nexsync/main.dart';
import 'package:nexsync/models/app_bar_selected.dart';
import 'package:nexsync/models/employee_model.dart';
import 'package:nexsync/router/app_router_constants.dart';
import 'package:nexsync/screens/employee_nexus.dart';
import 'package:nexsync/screens/employee_profile.dart';
import 'package:nexsync/screens/feedback.dart';
import 'package:nexsync/screens/hr_nexus.dart';
import 'package:nexsync/screens/stats.dart';

class EmployeeLandingPage extends StatefulWidget {
  const EmployeeLandingPage({super.key});

  @override
  State<EmployeeLandingPage> createState() => EmployeeLandingPageState();
}

class EmployeeLandingPageState extends State<EmployeeLandingPage> {
  Employee? employee;

  void fetchData() async {
    final data = await supabase
        .from("Employee")
        .select(
            "Employee_ID,Employee_Name,Designation,Department_ID,Project_ID,Allocation_ID")
        .eq("Employee_Name", "Rishit Sharma");
    final employeeData = data[0];
    final department = await supabase
        .from("Department")
        .select("Department_Name")
        .eq("Department_ID", employeeData['Department_ID']);
    final departmentName = department[0];
    final fetchedEmployee = Employee(
        name: employeeData['Employee_Name'],
        employeeID: employeeData['Employee_ID'].toString(),
        designation: employeeData['Designation'],
        departmentName: "",
        departmentID: employeeData['Department_ID'],
        projectID: employeeData['Project_ID']);
    setState(() {
      employee = fetchedEmployee;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fetchData();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    if (employee == null) {
      return Scaffold(
        backgroundColor: Color.fromARGB(255, 78, 78, 78),
        body: Center(
          child: CircularProgressIndicator(
            color: Colors.white,
          ),
        ),
      );
    } else {
      return Scaffold(
        backgroundColor: Color.fromARGB(255, 31, 31, 31),
        body: Stack(children: [
          EmployeeProfile(
            employee: employee!,
          ),
          Container(
            margin: EdgeInsets.only(bottom: context.adaptiveSize(50)),
            alignment: Alignment.bottomCenter,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(context.adaptiveSize(10))),
            child: TextButton(
                onPressed: () {
                  if (context.mounted) {
                    supabase.auth.signOut();
                    GoRouter.of(context)
                        .goNamed(AppRouterConstants.splashScreen);
                  }
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.logout,
                      color: Colors.white,
                    ),
                    SizedBox(
                      width: context.adaptiveSize(10),
                    ),
                    Text(
                      "Logout",
                      style: TextStyle(color: Colors.white),
                    ),
                  ],
                )),
          )
        ]),
      );
    }
  }
}
