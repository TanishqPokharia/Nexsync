import 'dart:math';

import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:nexsync/main.dart';
import 'package:nexsync/models/employee_model.dart';
import 'package:flutter/material.dart';
import 'package:nexsync/router/app_router_constants.dart';
import 'package:nexsync/screens/hr_nexus.dart';
import 'package:nexsync/widgets/project_card.dart';
import 'employee_card.dart';

class Department {
  final String name;
  final String id;

  Department({required this.name, required this.id});
}

List<Department> listofDepartments = [
  // "Software",
  // "R&D",
  // "Marketing",
  // "Human Resource"
  Department(name: "Software", id: "DEP2002"),
  Department(name: "R&D", id: "DEP2003"),
  Department(name: "Human Resource", id: "DEP2001"),
  Department(name: "Marketing", id: "DEP2004")
];
List<Employee> selectedEmployee = [];

class CreateProject extends ConsumerStatefulWidget {
  const CreateProject({super.key, required this.addProject});
  final Function(
      {required AssetImage backgroundImage,
      required String projectName,
      required String projectID,
      required String department,
      required String departmentHead,
      required int totalEmployees,
      required Set<Employee>? employeeAssigned,
      required String startDate,
      required String endDate}) addProject;
  @override
  ConsumerState<ConsumerStatefulWidget> createState() {
    // TODO: implement createState
    return CreateProjectState();
  }
}

List<String> selectedCategories = [];

class CreateProjectState extends ConsumerState<CreateProject> {
  TextEditingController searchTextEditingController = TextEditingController();
  TextEditingController projectIDTextEditingController =
      TextEditingController();
  TextEditingController projectNameTextEditingController =
      TextEditingController();
  List<Employee> thisList = listofEmployee;
  TextEditingController projectBudgetTextEditingController =
      TextEditingController();

  String chosenDepartment = "";
  String startDateText = "Pick Start Date";
  String endDateText = "Pick End Date";
  DateTime startDate = DateTime.now();

  void search(String query) {
    final suggestions = listofEmployee.where((element) {
      final name = element.name.toLowerCase();
      final input = query.toLowerCase();
      return name.contains(input);
    }).toList();
    print(suggestions);
    setState(() {
      filteredList = suggestions;
    });
  }

  List<Employee> filteredList = listofEmployee.where((employee) {
    return selectedCategories.isEmpty ||
        selectedCategories.contains(employee.departmentID);
  }).toList();

  AssetImage giveBackgroundImage() {
    if (selectedEmployee.length < 5) {
      return AssetImage("images/cyan_bg.jpg");
    } else if (selectedEmployee.length < 10) {
      return AssetImage("images/purple_bg.jpg");
    }
    return AssetImage("images/yellow_bg.jpg");
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    projectBudgetTextEditingController.dispose();
    projectNameTextEditingController.dispose();
    projectIDTextEditingController.dispose();
    searchTextEditingController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 43, 42, 42),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Material(
              elevation: 10,
              color: Color.fromARGB(255, 47, 45, 45),
              child: Row(
                children: [
                  IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: Icon(
                        Icons.close,
                        color: Colors.white,
                      )),
                  Container(
                    margin: EdgeInsets.all(20),
                    child: Text(
                      "Create Project",
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 30, left: 10, right: 10, bottom: 10),
              child: TextField(
                controller: projectIDTextEditingController,
                decoration: InputDecoration(
                    hintText: "Project ID",
                    fillColor: Colors.white,
                    filled: true,
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10)),
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10))),
              ),
            ),
            Container(
              margin: EdgeInsets.all(context.adaptiveSize(10)),
              child: TextField(
                controller: projectNameTextEditingController,
                decoration: InputDecoration(
                    hintText: "Project Name",
                    fillColor: Colors.white,
                    filled: true,
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10)),
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10))),
              ),
            ),
            Container(
              margin: EdgeInsets.all(context.adaptiveSize(10)),
              alignment: Alignment.centerLeft,
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10)),
                child: DropdownMenu(
                  hintText: "Department",
                  dropdownMenuEntries: [
                    DropdownMenuEntry(value: "Software", label: "Software"),
                    DropdownMenuEntry(
                        value: "Human Resource", label: "Human Resource"),
                    DropdownMenuEntry(value: "R&D", label: "R&D"),
                    DropdownMenuEntry(value: "Marketing", label: "Marketing"),
                  ],
                  onSelected: (value) {
                    setState(() {
                      chosenDepartment = value!;
                    });
                  },
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  alignment: Alignment.centerLeft,
                  margin: EdgeInsets.all(context.adaptiveSize(10)),
                  child: Container(
                    padding: EdgeInsets.all(context.adaptiveSize(10)),
                    width: context.adaptiveSize(200),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius:
                            BorderRadius.circular(context.adaptiveSize(10))),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(startDateText),
                        IconButton(
                            onPressed: () async {
                              final date = await showDatePicker(
                                context: context,
                                firstDate: DateTime.now(),
                                lastDate: DateTime(2030),
                              );
                              setState(() {
                                startDateText =
                                    "${date!.day < 10 ? "0${date.day}" : date.day}-${date.month < 10 ? "0${date.month}" : date.month}-${date.year}";
                              });
                            },
                            icon: Icon(Icons.calendar_month))
                      ],
                    ),
                  ),
                ),
                Container(
                  alignment: Alignment.centerLeft,
                  margin: EdgeInsets.all(context.adaptiveSize(10)),
                  child: Container(
                    padding: EdgeInsets.all(context.adaptiveSize(10)),
                    width: context.adaptiveSize(200),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius:
                            BorderRadius.circular(context.adaptiveSize(10))),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(endDateText),
                        IconButton(
                            onPressed: () async {
                              final date = await showDatePicker(
                                  context: context,
                                  firstDate: DateTime.now(),
                                  lastDate: DateTime(2030));

                              setState(() {
                                endDateText =
                                    "${date!.day < 10 ? "0${date.day}" : date.day}-${date.month < 10 ? "0${date.month}" : date.month}-${date.year}";
                              });
                            },
                            icon: Icon(Icons.calendar_month))
                      ],
                    ),
                  ),
                ),
              ],
            ),
            Container(
              margin: EdgeInsets.all(30),
              child: Text(
                "Allocated Employees : ${selectedEmployee.length}",
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
            ),
            if (selectedEmployee.isEmpty)
              Container(
                height: context.adaptiveSize(400),
                margin: EdgeInsets.all(context.adaptiveSize(20)),
                child: Center(
                  child: Text(
                    "Choose Employees",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: context.adaptiveSize(30)),
                  ),
                ),
              )
            else
              Container(
                margin: EdgeInsets.all(context.adaptiveSize(10)),
                height: context.adaptiveSize(300),
                child: GridView.builder(
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      child: Container(
                          margin: EdgeInsets.all(10),
                          child:
                              EmployeeCard(employee: selectedEmployee[index])),
                      onTap: () {
                        setState(() {
                          selectedEmployee.remove(selectedEmployee[index]);
                        });
                      },
                    );
                  },
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 10),
                  itemCount: selectedEmployee.length,
                ),
              ),
            Container(
              margin: EdgeInsets.all(10),
              child: TextField(
                onChanged: search,
                controller: searchTextEditingController,
                decoration: InputDecoration(
                    fillColor: Colors.white,
                    filled: true,
                    hintText: "Search",
                    prefixIcon: Icon(Icons.search),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10)),
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10))),
              ),
            ),
            Container(
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    ...listofDepartments.map((category) => Container(
                        margin: EdgeInsets.all(10),
                        child: FilterChip(
                            label: Text(category.name),
                            selected: selectedCategories.contains(category.id),
                            onSelected: (selected) {
                              setState(() {
                                if (selected) {
                                  selectedCategories.add(category.id);
                                } else {
                                  selectedCategories.remove(category.id);
                                }
                                filteredList = listofEmployee.where((employee) {
                                  return selectedCategories.isEmpty ||
                                      selectedCategories
                                          .contains(employee.departmentID);
                                }).toList();
                              });
                            })))
                  ],
                ),
              ),
            ),
            Container(
              width: double.infinity,
              height: context.adaptiveSize(600),
              margin: EdgeInsets.all(context.adaptiveSize(20)),
              child: GridView.builder(
                itemBuilder: (context, index) {
                  return InkWell(
                    splashColor: Colors.grey,
                    onTap: () {
                      setState(() {
                        selectedEmployee.add(filteredList[index]);
                      });
                    },
                    onLongPress: () {
                      GoRouter.of(context).pushNamed(
                          AppRouterConstants.profileScreen,
                          extra: filteredList[index]);
                    },
                    child: EmployeeCard(
                      employee: filteredList[index],
                    ),
                  );
                },
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10),
                itemCount: filteredList.length,
              ),
            ),
            Container(
              margin: EdgeInsets.all(20),
              width: double.infinity,
              decoration: BoxDecoration(
                  boxShadow: [BoxShadow(color: Colors.purple, blurRadius: 10)],
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.purple),
              child: TextButton(
                  onPressed: () async {
                    await supabase.from("Project").insert({
                      "Project_ID": projectIDTextEditingController.text,
                      "Project_Name": projectNameTextEditingController.text,
                      "Start_Date": startDateText,
                      "End_Date": endDateText,
                      "Department_Name": chosenDepartment,
                      "Allocated_Employees": selectedEmployee.length
                    });
                    selectedEmployee.forEach((element) async {
                      await supabase.from("Employee").update({
                        "Project_ID": projectIDTextEditingController.text
                      }).eq("Employee_ID", element.employeeID);
                      await supabase.from("Task_Allocation").insert({
                        "Employee_ID": element.employeeID,
                        "Project_ID": element.projectID,
                        "Status": "Ongoing",
                        "Completion_Time": null
                      });
                    });
                    final result = await supabase
                        .from("Department")
                        .select("Department_Head")
                        .eq("Department_Name", chosenDepartment);
                    final departmentHead = result[0]['Department_Head'];
                    widget.addProject(
                        backgroundImage: giveBackgroundImage(),
                        startDate: startDateText,
                        endDate: endDateText,
                        projectName: projectNameTextEditingController.text,
                        projectID: projectIDTextEditingController.text,
                        department: chosenDepartment,
                        departmentHead: departmentHead,
                        totalEmployees: selectedEmployee.length,
                        employeeAssigned: selectedEmployee.toSet());

                    selectedEmployee.clear();
                    Navigator.pop(context);
                  },
                  child: Text(
                    "Create Project",
                    style: TextStyle(color: Colors.white),
                  )),
            ),
          ],
        ),
      ),
    );
  }
}
