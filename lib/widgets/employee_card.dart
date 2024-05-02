import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:nexsync/main.dart';
import 'package:nexsync/models/employee_model.dart';

class EmployeeCard extends StatelessWidget {
  const EmployeeCard({super.key, required this.employee});
  final Employee employee;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: const Color.fromARGB(255, 64, 61, 61),
      child: Container(
        padding: EdgeInsets.all(context.adaptiveSize(20)),
        height: context.adaptiveSize(300),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: context.adaptiveSize(150),
                      child: Text(
                        employee.name,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: context.adaptiveSize(20)),
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      employee.departmentID ?? "Department ID",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: context.adaptiveSize(20)),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      child: Text(
                        employee.departmentName,
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: context.adaptiveSize(20)),
                      ),
                    ),
                  ],
                ),
                Container(
                  width: context.adaptiveSize(150),
                  child: Text(
                    employee.designation!,
                    style: TextStyle(
                        color: Colors.white,
                        overflow: TextOverflow.ellipsis,
                        fontSize: context.adaptiveSize(20)),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
