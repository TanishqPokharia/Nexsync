import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:syncfusion_flutter_charts/sparkcharts.dart';

class EmployeeProfile extends StatelessWidget {
  const EmployeeProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                Container(
                  width: double.infinity,
                  height: 150,
                  margin: EdgeInsets.zero,
                  color: Colors.blue,
                  child: Center(
                    child: Text(
                      "CORPORATE",
                      style: TextStyle(color: Colors.white, fontSize: 36),
                    ),
                  ),
                ),
                Container(
                  alignment: Alignment.center,
                  padding: EdgeInsets.only(top: 100),
                  child: CircleAvatar(
                    radius: 70,
                    foregroundImage: NetworkImage(
                        "https://w7.pngwing.com/pngs/177/551/png-transparent-user-interface-design-computer-icons-default-stephen-salazar-graphy-user-interface-design-computer-wallpaper-sphere-thumbnail.png"),
                  ),
                )
              ],
            ),
            Column(
              children: [
                Container(
                  margin: EdgeInsets.all(10),
                  child: Text(
                    "Employee Name",
                    style: TextStyle(color: Colors.white, fontSize: 24),
                  ),
                ),
                Container(
                  child: Text(
                    "Sub-Department",
                    style: TextStyle(color: Colors.white, fontSize: 18),
                  ),
                ),
                Container(
                  child: Text(
                    "Designation",
                    style: TextStyle(color: Colors.white, fontSize: 18),
                  ),
                ),
              ],
            ),
            Container(
              width: double.infinity,
              margin: EdgeInsets.all(10),
              child: Card(
                color: Color.fromARGB(255, 49, 48, 48),
                child: Column(
                  children: [
                    Container(
                      margin: EdgeInsets.all(20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            margin: EdgeInsets.all(10),
                            child: Text(
                              "Appraisal Rating: ",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 18),
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.star,
                                color: Colors.yellow,
                              ),
                              Icon(
                                Icons.star,
                                color: Colors.yellow,
                              ),
                              Icon(
                                Icons.star,
                                color: Colors.yellow,
                              ),
                              Icon(
                                Icons.star,
                                color: Colors.yellow,
                              ),
                              Icon(
                                Icons.star,
                                color: Colors.yellow,
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.all(10),
                      child: Text(
                        "Remarks: ",
                        style: TextStyle(color: Colors.white, fontSize: 18),
                      ),
                    ),
                    Container(
                      margin:
                          EdgeInsets.symmetric(horizontal: 40, vertical: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Text(
                                "Deadline missed :   ",
                                style: TextStyle(color: Colors.white),
                              ),
                              SizedBox.square(
                                dimension: 10,
                                child: Container(
                                  color: Colors.red,
                                ),
                              )
                            ],
                          ),
                          Row(
                            children: [
                              Text(
                                "Deadline met :   ",
                                style: TextStyle(
                                  color: Colors.white,
                                ),
                              ),
                              SizedBox.square(
                                dimension: 10,
                                child: Container(
                                  color: Colors.blue,
                                ),
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                    SfSparkWinLossChart(
                      data: [
                        ...List.generate(15, (index) => index),
                        ...List.generate(15, (index) => -index)
                      ],
                      trackball: SparkChartTrackball(
                          labelStyle: TextStyle(color: Colors.white),
                          activationMode: SparkChartActivationMode.tap),
                    )
                  ],
                ),
              ),
            ),
            Container(
              width: double.infinity,
              margin: EdgeInsets.all(10),
              child: Card(
                color: Color.fromARGB(255, 49, 48, 48),
                child: Column(
                  children: [
                    Container(
                        margin: EdgeInsets.all(20),
                        child: Wrap(
                          children: [
                            Text(
                              "Assigned Project: Project ka naam jo bhi ho",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 24),
                            ),
                          ],
                        )),
                  ],
                ),
              ),
            ),
            Container(
              width: double.infinity,
              margin: EdgeInsets.all(10),
              child: Card(
                color: Color.fromARGB(255, 49, 48, 48),
                child: Column(
                  children: [
                    Container(
                        margin: EdgeInsets.all(20),
                        child: Text("Professional Details",
                            style:
                                TextStyle(color: Colors.white, fontSize: 24))),
                    Container(
                        margin: EdgeInsets.all(10),
                        child: Text("Joining Date",
                            style:
                                TextStyle(color: Colors.white, fontSize: 18))),
                    Container(
                        margin: EdgeInsets.all(10),
                        child: Text("Reporting Manager",
                            style:
                                TextStyle(color: Colors.white, fontSize: 18))),
                    Container(
                        margin: EdgeInsets.all(10),
                        child: Text("Languages",
                            style:
                                TextStyle(color: Colors.white, fontSize: 18))),
                    Container(
                        margin: EdgeInsets.all(10),
                        child: Text("Salary",
                            style:
                                TextStyle(color: Colors.white, fontSize: 18))),
                    Container(
                        margin: EdgeInsets.all(10),
                        child: Text("Site",
                            style:
                                TextStyle(color: Colors.white, fontSize: 18))),
                    Container(
                        margin: EdgeInsets.all(10),
                        child: Text("Work Location",
                            style:
                                TextStyle(color: Colors.white, fontSize: 18)))
                  ],
                ),
              ),
            ),
            Container(
              width: double.infinity,
              margin: EdgeInsets.all(10),
              child: Card(
                color: Color.fromARGB(255, 49, 48, 48),
                child: Column(
                  children: [
                    Container(
                        margin: EdgeInsets.all(20),
                        child: Text("Certifications",
                            style:
                                TextStyle(color: Colors.white, fontSize: 24))),
                    Container(
                        margin: EdgeInsets.all(10),
                        child: Column(
                          children: [
                            Text("Certification 1",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 18)),
                            Text("Link:",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 18)),
                          ],
                        )),
                    Container(
                        margin: EdgeInsets.all(10),
                        child: Column(
                          children: [
                            Text("Certification 2",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 18)),
                            Text("Link:",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 18)),
                          ],
                        )),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
