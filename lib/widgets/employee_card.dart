import 'package:flutter/material.dart';
import 'package:nexsync/models/employee_model.dart';

class EmployeeCard extends StatelessWidget {
  const EmployeeCard({super.key, required this.employee});
  final Employee employee;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: const Color.fromARGB(255, 64, 61, 61),
      child: Container(
        height: 200,
        child: Column(
          children: [
            Container(
                padding: EdgeInsets.all(20),
                child: CircleAvatar(
                  radius: 50,
                  backgroundImage: NetworkImage(
                      "https://w7.pngwing.com/pngs/177/551/png-transparent-user-interface-design-computer-icons-default-stephen-salazar-graphy-user-interface-design-computer-wallpaper-sphere-thumbnail.png"),
                )),
            Text(
              employee.name,
              style: TextStyle(color: Colors.white),
            )
          ],
        ),
      ),
    );
  }
}
