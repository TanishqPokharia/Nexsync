class SkilledEmployee {
  SkilledEmployee(this.skill, this.count);
  String skill;
  int count;
}

List<SkilledEmployee> skilledEmployeeList = [
  SkilledEmployee("Engineering Department", 45),
  SkilledEmployee("IT Department", 43),
  SkilledEmployee("R&D Department", 56),
  SkilledEmployee("Quality Assurance", 24),
];

List<SkilledEmployee> subDepartmentWiseEmployeeList = [
  SkilledEmployee("Software Development", 12),
  SkilledEmployee("IT Support", 14),
  SkilledEmployee("Product Innovation", 18),
  SkilledEmployee("Quality Assurance", 14),
  SkilledEmployee("Hardware Development", 23),
  SkilledEmployee("Logistics", 14),
  SkilledEmployee("Distribution", 18),
];
