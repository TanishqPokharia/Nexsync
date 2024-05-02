import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:nexsync/main.dart';
import 'package:nexsync/models/employee_model.dart';
import 'package:nexsync/models/project_details.dart';
import 'package:nexsync/router/app_router_constants.dart';
import 'package:nexsync/screens/hr_nexus.dart';
import 'package:nexsync/widgets/create_project.dart';
import 'package:nexsync/widgets/employee_card.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class InsideProject extends StatefulWidget {
  final ProjectDetails projectDetails;

  const InsideProject({super.key, required this.projectDetails});
  @override
  _InsideProjectState createState() => _InsideProjectState();
}

class _InsideProjectState extends State<InsideProject> {
  TextEditingController searchTextEditingController = TextEditingController();
  List<Employee> filteredList = [...listofEmployee];
  List<String> selectedCategories = [];
  Set<Employee> removeList = {};
  Set<Employee> addList = {};
  List<Employee> originalEmployees = [];
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

  @override
  void dispose() {
    // TODO: implement dispose
    searchTextEditingController.dispose();
    super.dispose();
  }

  void fetchEmployees() async {
    final employeeListSupabase = await supabase
        .from("Employee")
        .select(
            "Employee_ID,Employee_Name,Designation,Department_ID,Project_ID")
        .eq("Project_ID", widget.projectDetails.projectID);

    final employeeList = employeeListSupabase.map((e) {
      return Employee(
          name: e['Employee_Name'],
          designation: e['Designation'],
          employeeID: e['Employee_ID'].toString(),
          departmentName: "",
          departmentID: e['Department_ID'],
          projectID: e['Project_ID']);
    }).toList();

    setState(() {
      widget.projectDetails.employeeAssigned = {
        ...widget.projectDetails.employeeAssigned!,
        ...employeeList
      };
      widget.projectDetails.totalEmployees =
          widget.projectDetails.employeeAssigned!.length;
      originalEmployees = widget.projectDetails.employeeAssigned!.toList();
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    if (widget.projectDetails.employeeAssigned!.isEmpty) {
      fetchEmployees();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 31, 31, 31),
      appBar: AppBar(
        title: Text(widget.projectDetails.projectName),
        foregroundColor: Colors.white,
        backgroundColor: Color.fromARGB(255, 31, 31, 31),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                alignment: Alignment.center,
                padding: EdgeInsets.all(context.adaptiveSize(10)),
                margin: EdgeInsets.all(context.adaptiveSize(20)),
                decoration: BoxDecoration(
                    color: Color.fromARGB(255, 78, 78, 78),
                    borderRadius:
                        BorderRadius.circular(context.adaptiveSize(10))),
                child: Text(
                  "Allocated Emoloyees: ${widget.projectDetails.totalEmployees}",
                  style: TextStyle(
                      color: Colors.white, fontSize: context.adaptiveSize(30)),
                ),
              ),
              Container(
                alignment: Alignment.center,
                padding: EdgeInsets.all(context.adaptiveSize(10)),
                margin: EdgeInsets.all(context.adaptiveSize(20)),
                decoration: BoxDecoration(
                    color: Color.fromARGB(255, 78, 78, 78),
                    borderRadius:
                        BorderRadius.circular(context.adaptiveSize(10))),
                child: Text(
                  widget.projectDetails.department + " Project",
                  style: TextStyle(
                      color: Colors.white, fontSize: context.adaptiveSize(30)),
                ),
              ),
              Container(
                alignment: Alignment.center,
                padding: EdgeInsets.all(context.adaptiveSize(10)),
                margin: EdgeInsets.all(context.adaptiveSize(20)),
                decoration: BoxDecoration(
                    color: Color.fromARGB(255, 78, 78, 78),
                    borderRadius:
                        BorderRadius.circular(context.adaptiveSize(10))),
                child: Text(
                  "Start Date: ${widget.projectDetails.startDate}",
                  style: TextStyle(
                      color: Colors.white, fontSize: context.adaptiveSize(30)),
                ),
              ),
              Container(
                alignment: Alignment.center,
                padding: EdgeInsets.all(context.adaptiveSize(10)),
                margin: EdgeInsets.all(context.adaptiveSize(20)),
                decoration: BoxDecoration(
                    color: Color.fromARGB(255, 78, 78, 78),
                    borderRadius:
                        BorderRadius.circular(context.adaptiveSize(10))),
                child: Text(
                  "End Date: ${widget.projectDetails.endDate}",
                  style: TextStyle(
                      color: Colors.white, fontSize: context.adaptiveSize(30)),
                ),
              ),
              Container(
                height: context.adaptiveSize(20),
              ),
              Container(
                margin: EdgeInsets.all(context.adaptiveSize(30)),
                height: context.adaptiveSize(500),
                child: GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisSpacing: 10,
                      crossAxisSpacing: 10,
                      mainAxisExtent: context.adaptiveSize(250)),
                  itemBuilder: (context, index) {
                    return InkWell(
                        onLongPress: () {
                          GoRouter.of(context).pushNamed(
                              AppRouterConstants.profileScreen,
                              extra: widget.projectDetails.employeeAssigned!
                                  .toList()[index]);
                        },
                        child: Stack(children: [
                          EmployeeCard(
                              employee: widget.projectDetails.employeeAssigned!
                                  .toList()[index]),
                          Align(
                            alignment: Alignment.bottomCenter,
                            child: Container(
                              margin: EdgeInsets.all(context.adaptiveSize(20)),
                              width: double.infinity,
                              child: TextButton(
                                  onPressed: () async {
                                    await supabase
                                        .from("Employee")
                                        .update({"Project_ID": null}).eq(
                                            "Employee_ID",
                                            widget.projectDetails
                                                .employeeAssigned!
                                                .toList()[index]
                                                .employeeID);
                                    await supabase.from("Project").update({
                                      "Allocated_Employees": widget
                                          .projectDetails
                                          .employeeAssigned!
                                          .length
                                    }).eq("Project_ID",
                                        widget.projectDetails.projectID);
                                    setState(() {
                                      widget.projectDetails.employeeAssigned!
                                          .remove(widget
                                              .projectDetails.employeeAssigned!
                                              .toList()[index]);
                                      widget.projectDetails.totalEmployees =
                                          widget.projectDetails
                                              .employeeAssigned!.length;
                                    });
                                  },
                                  style: ButtonStyle(
                                      backgroundColor:
                                          const MaterialStatePropertyAll(
                                              Colors.red),
                                      shape: MaterialStatePropertyAll(
                                          RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(context
                                                      .adaptiveSize(10))))),
                                  child: Text("Remove",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: context.adaptiveSize(20)))),
                            ),
                          )
                        ]));
                  },
                  itemCount: widget.projectDetails.employeeAssigned!.length,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    margin: EdgeInsets.all(context.adaptiveSize(20)),
                    child: TextButton(
                      onPressed: () {
                        showModalBottomSheet(
                          context: context,
                          enableDrag: true,
                          useSafeArea: true,
                          isScrollControlled: true,
                          showDragHandle: true,
                          backgroundColor: Color.fromARGB(255, 31, 31, 31),
                          builder: (context) {
                            return Container(
                              padding: EdgeInsets.all(context.adaptiveSize(10)),
                              child: Column(
                                children: [
                                  Container(
                                    width: double.infinity,
                                    height: context.adaptiveSize(800),
                                    margin: EdgeInsets.all(
                                        context.adaptiveSize(20)),
                                    child: GridView.builder(
                                      itemBuilder: (context, index) {
                                        return InkWell(
                                          splashColor: Colors.grey,
                                          onTap: () async {
                                            await supabase
                                                .from("Employee")
                                                .update({
                                              "Project_ID": widget
                                                  .projectDetails.projectID
                                            }).eq(
                                                    "Employee_ID",
                                                    listofEmployee[index]
                                                        .employeeID);
                                            await supabase
                                                .from("Project")
                                                .update({
                                              "Allocated_Employees": widget
                                                  .projectDetails
                                                  .employeeAssigned!
                                                  .length
                                            }).eq(
                                                    "Project_ID",
                                                    widget.projectDetails
                                                        .projectID);
                                            setState(() {
                                              addList.add(filteredList[index]);
                                              widget.projectDetails
                                                  .employeeAssigned!
                                                  .add(filteredList[index]);

                                              widget.projectDetails
                                                      .totalEmployees =
                                                  widget.projectDetails
                                                      .employeeAssigned!.length;
                                            });

                                            if (context.mounted) {
                                              Navigator.pop(context);
                                            }
                                          },
                                          onLongPress: () {
                                            GoRouter.of(context).pushNamed(
                                                AppRouterConstants
                                                    .profileScreen,
                                                extra: filteredList[index]);
                                          },
                                          child: EmployeeCard(
                                            employee: filteredList[index],
                                          ),
                                        );
                                      },
                                      gridDelegate:
                                          const SliverGridDelegateWithFixedCrossAxisCount(
                                              crossAxisCount: 2,
                                              crossAxisSpacing: 10,
                                              mainAxisSpacing: 10),
                                      itemCount: filteredList.length,
                                    ),
                                  ),
                                ],
                              ),
                            );
                          },
                        );
                      },
                      style: ButtonStyle(
                          foregroundColor:
                              MaterialStatePropertyAll(Colors.white),
                          backgroundColor:
                              MaterialStatePropertyAll(Colors.green),
                          shape: MaterialStatePropertyAll(
                              RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(
                                      context.adaptiveSize(10))))),
                      child: Text(
                        "Add Employee",
                        style: TextStyle(fontSize: context.adaptiveSize(24)),
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.all(context.adaptiveSize(20)),
                    child: TextButton(
                      onPressed: () {
                        originalEmployees.forEach((element) async {
                          await supabase.from("Employee").update({
                            "Project_ID": widget.projectDetails.projectID
                          }).eq("Employee_ID", element.employeeID);
                        });
                        setState(() {
                          widget.projectDetails.employeeAssigned =
                              originalEmployees.toSet();
                        });
                      },
                      style: ButtonStyle(
                          foregroundColor:
                              MaterialStatePropertyAll(Colors.white),
                          backgroundColor:
                              MaterialStatePropertyAll(Colors.deepPurple),
                          shape: MaterialStatePropertyAll(
                              RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(
                                      context.adaptiveSize(10))))),
                      child: Text(
                        "Undo Changes",
                        style: TextStyle(fontSize: context.adaptiveSize(24)),
                      ),
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
