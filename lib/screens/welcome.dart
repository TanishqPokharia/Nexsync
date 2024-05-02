import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';
import 'package:nexsync/router/app_router_constants.dart';

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
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              margin: EdgeInsets.only(top: 50),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        isSelectedHR = true;
                        isSelectedEmployee = false;
                      });
                    },
                    child: Container(
                      height: 100,
                      width: 100,
                      margin: EdgeInsets.all(40.0), // Adjusted margin value
                      decoration: BoxDecoration(
                          color: isSelectedHR
                              ? Colors.deepPurpleAccent
                              : Colors.purple[900],
                          borderRadius: BorderRadius.circular(12.0),
                          boxShadow: [
                            if (isSelectedHR)
                              BoxShadow(blurRadius: 10, color: Colors.purple)
                          ]),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          ImageIcon(
                            AssetImage("images/hr.png"),
                            size: 50.0,
                            color:
                                isSelectedHR ? Colors.white : Color(0xFF8D8E98),
                          ),
                          SizedBox(
                            height: 10.0,
                          ),
                          Text(
                            'HR',
                            style: TextStyle(
                              fontSize: 18.0,
                              color: isSelectedHR
                                  ? Colors.white
                                  : Color(0xFF8D8E98),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        isSelectedEmployee = true;
                        isSelectedHR = false;
                      });
                    },
                    child: Container(
                      height: 100,
                      width: 100,
                      margin: EdgeInsets.all(40.0), // Adjusted margin value
                      decoration: BoxDecoration(
                          color: isSelectedEmployee
                              ? Colors.deepPurpleAccent
                              : Colors.purple[900],
                          borderRadius: BorderRadius.circular(12.0),
                          boxShadow: [
                            if (isSelectedEmployee)
                              BoxShadow(blurRadius: 10, color: Colors.purple)
                          ]),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          ImageIcon(
                            AssetImage("images/worker.png"),
                            size: 50.0,
                            color: isSelectedEmployee
                                ? Colors.white
                                : Color(0xFF8D8E98),
                          ),
                          SizedBox(
                            height: 10.0,
                          ),
                          Text(
                            'Employee',
                            style: TextStyle(
                              fontSize: 18.0,
                              color: isSelectedEmployee
                                  ? Colors.white
                                  : Color(0xFF8D8E98),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              alignment: Alignment.bottomCenter,
              width: double.infinity,
              margin: EdgeInsets.all(20),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [BoxShadow(blurRadius: 2, color: Colors.purple)]),
              child: TextButton(
                onPressed: () {
                  if (isSelectedHR) {
                    // Do something when a card is selected
                    GoRouter.of(context)
                        .pushNamed(AppRouterConstants.logInScreen, extra: true);
                  } else if (isSelectedEmployee) {
                    GoRouter.of(context).pushNamed(
                        AppRouterConstants.logInScreen,
                        extra: false);
                  } else {
                    // Show a dialog if no card is selected
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: Text("Select a choice"),
                          content: Text(
                              "Please select either HR or Employee before proceeding."),
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
                child: Text(
                  "Get started",
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
