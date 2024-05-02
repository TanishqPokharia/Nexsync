import 'package:flutter/material.dart';
import 'package:nexsync/main.dart';
import 'package:nexsync/models/employee_model.dart';
import 'package:nexsync/models/project_details.dart';
import 'package:nexsync/widgets/create_project.dart';
import 'package:nexsync/widgets/project_card.dart';

List<String> selectedCategories = [];

List<Employee> listofEmployee = [
  Employee(
      name: 'John Doe',
      departmentName: "Human Resource",
      designation: "adc",
      employeeID: "",
      departmentID: null,
      projectID: null),
  Employee(
      name: 'Alice Smith',
      departmentName: "Human Resource",
      designation: "awddaw",
      employeeID: "",
      departmentID: null,
      projectID: null),
  Employee(
      name: 'Bob Johnson',
      departmentName: "Human Resource",
      designation: "awda",
      employeeID: "",
      departmentID: null,
      projectID: null),
  Employee(
      name: 'Eva Brown',
      departmentName: "Human Resource",
      designation: "awdadw",
      employeeID: "",
      departmentID: null,
      projectID: null),
  Employee(
      name: 'Charlie Wilson',
      departmentName: "IT",
      designation: "rbdbb",
      employeeID: "",
      departmentID: null,
      projectID: null),
  Employee(
      name: 'Grace Davis',
      departmentName: "Engineering",
      designation: "awdasdw",
      departmentID: null,
      employeeID: "",
      projectID: null),
  Employee(
      name: 'Daniel White',
      departmentName: "Supply Chain",
      designation: "dbdrbdrbb",
      departmentID: null,
      employeeID: "",
      projectID: null),
  Employee(
      name: 'Sophia Lee',
      departmentName: "IT",
      employeeID: "",
      designation: "jygfjgy",
      departmentID: null,
      projectID: null),
];

class HRNexus extends StatefulWidget {
  const HRNexus({super.key});
  @override
  _HRNexusState createState() => _HRNexusState();
}

class _HRNexusState extends State<HRNexus> {
  List<String> listofDepartments = [
    "Software",
    "Human Resource",
    "R&D",
    "Marketing"
  ];
  List<ProjectCard> projectCardList = [];

  List<Employee> employeeList = [];

  addProject(
      {required backgroundImage,
      required projectName,
      required projectID,
      required department,
      required departmentHead,
      required totalEmployees,
      required employeeAssigned,
      required startDate,
      required endDate}) {
    setState(() {
      projectCardList.add(ProjectCard(
        projectDetails: ProjectDetails(
            backgroundImage: backgroundImage,
            startDate: startDate,
            endDate: endDate,
            projectName: projectName,
            projectID: projectID,
            department: department,
            departmentHead: departmentHead,
            totalEmployees: totalEmployees,
            employeeAssigned: employeeAssigned),
      ));
    });
  }

  AssetImage giveBackgroundImage(int employees) {
    if (employees < 5) {
      return AssetImage("images/cyan_bg.jpg");
    } else if (employees < 10) {
      return AssetImage("images/purple_bg.jpg");
    }
    return AssetImage("images/yellow_bg.jpg");
  }

  void fetchEmployeeDetails() async {
    final supabaseEmployeeDetails = await supabase.from("Employee").select(
        "Employee_ID,Employee_Name,Designation,Department_ID,Project_ID,Allocation_ID");
    final employeeList = supabaseEmployeeDetails
        .map((e) => Employee(
            name: e['Employee_Name'],
            employeeID: e['Employee_ID'].toString(),
            designation: e['Designation'],
            departmentName: "",
            departmentID: e['Department_ID'],
            projectID: e['Project_ID']))
        .toList();
    setState(() {
      listofEmployee = employeeList;
    });
  }

  void fetch() async {
    final fetchedData = await supabase.from("Project").select(
        "Project_ID,Project_Name,Start_Date,End_Date,Department_Name,Allocated_Employees");
    fetchedData.forEach((element) async {
      print(element);
      final department = await supabase
          .from("Department")
          .select("Department_Head")
          .eq("Department_Name", element['Department_Name']);
      final departmentHead = department[0]['Department_Head'];
      setState(() {
        projectCardList.add(ProjectCard(
            projectDetails: ProjectDetails(
                backgroundImage:
                    giveBackgroundImage(element['Allocated_Employees']),
                startDate: element['Start_Date'],
                endDate: element['End_Date'],
                projectName: element['Project_Name'],
                projectID: element['Project_ID'],
                department: element['Department_Name'],
                departmentHead: departmentHead,
                totalEmployees: element['Allocated_Employees'],
                employeeAssigned: {})));
      });
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fetch();
    fetchEmployeeDetails();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        color: Color.fromARGB(255, 31, 31, 31),
        child: Stack(
          children: [
            ListView.builder(
              itemCount: projectCardList.length,
              itemBuilder: (context, index) {
                return projectCardList[index];
              },
            ),
            Positioned(
              bottom: 30,
              right: 30,
              child: FloatingActionButton.extended(
                label: Row(
                  children: [
                    Icon(Icons.add),
                    SizedBox(
                      width: context.adaptiveSize(10),
                    ),
                    Text("Add Project")
                  ],
                ),
                isExtended: true,
                onPressed: () {
                  showModalBottomSheet(
                    context: context,
                    backgroundColor: Color.fromARGB(255, 31, 31, 31),
                    constraints: BoxConstraints(
                      minWidth: 0,
                      maxHeight: MediaQuery.of(context).size.height,
                    ),
                    useSafeArea: true,
                    isScrollControlled: true,
                    enableDrag: false,
                    showDragHandle: false,
                    builder: (context) {
                      return CreateProject(
                        addProject: addProject,
                      );
                    },
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
