import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  bool isSelectedHR = false;
  bool isSelectedEmployee = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 31, 31, 31),
      body: Center(
        child: Column(
          children: [
            Expanded(
              child: Row(
                children: [
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          isSelectedHR = true;
                          isSelectedEmployee = false;
                        });
                      },
                      child: Container(
                        margin: EdgeInsets.all(120.0),  // Adjusted margin value
                        decoration: BoxDecoration(
                          color: isSelectedHR ? Colors.deepPurpleAccent : Colors.purple[900],
                          borderRadius: BorderRadius.circular(12.0),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            ImageIcon(
                              AssetImage("images/hr.png"),
                              size: 150.0,
                              color: isSelectedHR ? Colors.white : Color(0xFF8D8E98),
                            ),
                            SizedBox(
                              height: 10.0,
                            ),
                            Text(
                              'HR',
                              style: TextStyle(
                                fontSize: 25.0,
                                color: isSelectedHR ? Colors.white : Color(0xFF8D8E98),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          isSelectedEmployee = true;
                          isSelectedHR = false;
                        });
                      },
                      child: Container(
                        margin: EdgeInsets.all(120.0),  // Adjusted margin value
                        decoration: BoxDecoration(
                          color: isSelectedEmployee ? Colors.deepPurpleAccent : Colors.purple[900],
                          borderRadius: BorderRadius.circular(12.0),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            ImageIcon(
                              AssetImage("images/worker.png"),
                              size: 150.0,
                              color: isSelectedEmployee ? Colors.white : Color(0xFF8D8E98),
                            ),
                            SizedBox(
                              height: 10.0,
                            ),
                            Text(
                              'Employee',
                              style: TextStyle(
                                fontSize: 25.0,
                                color: isSelectedEmployee ? Colors.white : Color(0xFF8D8E98),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            ElevatedButton(
              onPressed: () {
                if (isSelectedHR || isSelectedEmployee) {
                  // Do something when a card is selected
                  print('Card selected');
                } else {
                  // Show a dialog if no card is selected
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: Text("Select a choice"),
                        content: Text("Please select either HR or Employee before proceeding."),
                        actions: [
                          TextButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: Text("OK"),
                          ),
                        ],
                      );
                    },
                  );
                }
              },
              style: ElevatedButton.styleFrom(
                foregroundColor: Colors.white,
                backgroundColor: Colors.deepPurpleAccent,
              ),
              child: Text("Get started"),
            ),
          ],
        ),
      ),
    );
  }
}