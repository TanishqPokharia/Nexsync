import 'package:flutter/material.dart';
import 'package:nexsync/main.dart';
import 'package:nexsync/screens/welcome.dart';
import 'package:supabase_extensions/supabase_extensions.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
// import 'package:testing_app/welcome.dart';

void main() async {
  final supabase = SupabaseClient(url, key);
  var results = await supabase
      .sql(
          "insert into Employee(Employee_ID,Employee_Name,Designation,Department_ID,Project_ID,Allocation_ID) values(10338,'Madan','Senior Developer','DEP2017','PR3415','AL2311')")
      .then((value) => print(value.rows));
}

// List<String> listofDepartments = ["IT", "HR", "Finance", "Marketing"];

class Selected {
  int selectedIndex;
  Color color;

  Selected({required this.selectedIndex, required this.color});
}

class MApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
        debugShowCheckedModeBanner: false, home: WelcomeScreen());
  }
}
