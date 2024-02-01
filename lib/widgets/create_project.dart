import 'package:go_router/go_router.dart';
import 'package:nexsync/models/employee_model.dart';
import 'package:flutter/material.dart';
import 'package:nexsync/router/app_router_constants.dart';
import 'employee_card.dart';

List<Employee> listofEmployee = [
  Employee(name: 'John Doe', department: 'IT', appraisal: 4),
  Employee(name: 'Alice Smith', department: 'HR', appraisal: 3),
  Employee(name: 'Bob Johnson', department: 'Finance', appraisal: 5),
  Employee(name: 'Eva Brown', department: 'Marketing', appraisal: 4),
  Employee(name: 'Charlie Wilson', department: 'IT', appraisal: 3),
  Employee(name: 'Grace Davis', department: 'Finance', appraisal: 4),
  Employee(name: 'Daniel White', department: 'HR', appraisal: 5),
  Employee(name: 'Sophia Lee', department: 'Marketing', appraisal: 4),
];

List<String> listofDepartments = ["IT", "HR", "Finance", "Marketing"];

List<String> selectedCategories = [];

class CreateProject extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return CreateProjectState();
  }
}

class CreateProjectState extends State<CreateProject> {
  TextEditingController textEditingController = TextEditingController();
  List<Employee> thisList = listofEmployee;

  void search(String query) {
    final suggestions = listofEmployee.where((element) {
      final name = element.name.toLowerCase();
      final input = query.toLowerCase();
      return name.contains(input);
    }).toList();
    setState(() {
      filteredList = suggestions;
    });
  }

  List<Employee> filteredList = listofEmployee.where((employee) {
    return selectedCategories.isEmpty ||
        selectedCategories.contains(employee.department);
  }).toList();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: EdgeInsets.all(10),
          child: TextField(
            onChanged: search,
            style: TextStyle(color: Colors.white),
            controller: textEditingController,
            decoration: InputDecoration(
                label: Text("Search"),
                prefixIcon: Icon(Icons.search),
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
                enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20))),
          ),
        ),
        Container(
          child: SingleChildScrollView(
            child: Row(
              children: [
                ...listofDepartments.map((category) => Container(
                    margin: EdgeInsets.all(10),
                    child: FilterChip(
                        label: Text(category),
                        selected: selectedCategories.contains(category),
                        onSelected: (selected) {
                          setState(() {
                            if (selected) {
                              selectedCategories.add(category);
                            } else {
                              selectedCategories.remove(category);
                            }
                            filteredList = listofEmployee.where((employee) {
                              return selectedCategories.isEmpty ||
                                  selectedCategories
                                      .contains(employee.department);
                            }).toList();
                          });
                        })))
              ],
            ),
          ),
        ),
        Expanded(
          child: Container(
            width: double.infinity,
            margin: EdgeInsets.all(20),
            child: GridView.count(
              crossAxisCount: 2,
              mainAxisSpacing: 10,
              crossAxisSpacing: 20,
              children: [
                ...filteredList.map((e) => GestureDetector(
                      onLongPress: () {
                        // GoRouter.of(context)
                        //     .push(AppRouterConstants.profileScreen);
                      },
                      child: EmployeeCard(
                        employee: e,
                      ),
                    ))
              ],
            ),
          ),
        )
      ],
    );
  }
}
