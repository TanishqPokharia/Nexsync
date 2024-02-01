import 'package:filter_list/filter_list.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:nexsync/firebase_options.dart';
import 'package:nexsync/screens/welcome.dart';
// import 'package:testing_app/welcome.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(MApp());
}

// List<Employee> listofEmployee = [
//   Employee(name: 'John Doe', department: 'IT', appraisal: 4),
//   Employee(name: 'Alice Smith', department: 'HR', appraisal: 3),
//   Employee(name: 'Bob Johnson', department: 'Finance', appraisal: 5),
//   Employee(name: 'Eva Brown', department: 'Marketing', appraisal: 4),
//   Employee(name: 'Charlie Wilson', department: 'IT', appraisal: 3),
//   Employee(name: 'Grace Davis', department: 'Finance', appraisal: 4),
//   Employee(name: 'Daniel White', department: 'HR', appraisal: 5),
//   Employee(name: 'Sophia Lee', department: 'Marketing', appraisal: 4),
// ];

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



// class MyAppState extends State<MyApp> {
//   Selected current = Selected(selectedIndex: 0, color: Colors.pinkAccent);

//   @override
//   Widget build(BuildContext context) {
//     // TODO: implement build
//     return Scaffold(
//       backgroundColor: Color.fromARGB(255, 31, 31, 31),
//       bottomNavigationBar: BottomNavigationBar(
//         fixedColor: current.color,
//         items: const [
//           // BottomNavigationBarItem(
//           //   label: "Nexus",
//           //     icon: Icon(
//           //   Icons.assignment,
//           //   color: Colors.yellow,
//           // )),
//           BottomNavigationBarItem(
//               backgroundColor: Color.fromARGB(255, 45, 43, 43),
//               label: "Nexus",
//               icon: ImageIcon(
//                 AssetImage("assets/Nexus.png"),
//                 color: Colors.pinkAccent,
//               )),
//           BottomNavigationBarItem(
//               backgroundColor: Color.fromARGB(255, 45, 43, 43),
//               label: "Profile",
//               icon: Icon(
//                 Icons.person,
//                 color: Colors.cyan,
//               ))
//         ],
//         currentIndex: current.selectedIndex,
//         type: BottomNavigationBarType.shifting,
//         elevation: 10,
//         onTap: (value) {
//           setState(() {
//             current.selectedIndex = value;
//             switch (value) {
//               case 0:
//                 current.color = Colors.pinkAccent;
//               case 1:
//                 current.color = Colors.cyan;
//               case 2:
//                 current.color = Colors.cyan;
//               default:
//                 current.color = Colors.pinkAccent;
//             }
//           });
//         },
//       ),
//       body: Center(
//         child: ElevatedButton(
//             onPressed: () async {
//               FirebaseDatabase firebaseDatabase = FirebaseDatabase.instance;
//               DatabaseReference databaseReference = firebaseDatabase.ref();
//               // bool test = await databaseReference.set({
//               //   "users": {
//               //     "alanisawesome": {
//               //       "date_of_birth": "June 23, 1912",
//               //       "full_name": "Alan Turing",
//               //       "nickname": "Alan The Machine"
//               //     }
//               //   }
//               // }).then((value) {
//               //   return true;
//               // });
//               // print(test ? "Data set" : "Data not set");

//               // bool test = await databaseReference
//               //     .child("/database/ABC Corporation/auth/EMP001/")
//               //     .update({"email": "Tanishq"}).then((value) {
//               //   return true;
//               // });
//               // print(test ? "Data updated" : "Data not updated");

//               // bool test = await FirebaseDatabase.instance
//               //     .ref()
//               //     .child("/database/ABC Corporation/auth")
//               //     .set({
//               //   "employee_id": {
//               //     "email": "nikhil@gmail.com",
//               //     "name": "nikhil",
//               //     "password": "Random password"
//               //   },
//               // }).then((value) {
//               //   return true;
//               // });

//               // var snapshot = await FirebaseDatabase.instance
//               //     .ref()
//               //     .child("database/")
//               //     .get();
//               // if (snapshot.exists) {
//               //   Map values = snapshot.value as Map;
//               //   String firstKey = values.keys.first;
//               //   print(firstKey);
//               // } else {
//               //   print("Not available");
//               // }

//               // print(test ? "Data updated" : "Data not updated");
//             },
//             child: Text("Test")),
//       ),
//     );
//   }
// }
