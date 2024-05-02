class EmployeeTask {
  final String details;
  final DateTime deadline;
  final DateTime dateOfAssignment;
  final String completionStatus;

  const EmployeeTask(
      {required this.details,
      required this.deadline,
      required this.dateOfAssignment,
      required this.completionStatus});
}
