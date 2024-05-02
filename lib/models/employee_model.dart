class Employee {
  final String name;
  final String employeeID;
  final String? designation;
  final String? departmentID;
  final String departmentName;
  final String? projectID;
  const Employee(
      {required this.name,
      required this.employeeID,
      required this.designation,
      required this.departmentName,
      required this.departmentID,
      required this.projectID});
}
