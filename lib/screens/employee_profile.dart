import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:nexsync/mediaquery/media_query.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:syncfusion_flutter_charts/sparkcharts.dart';

class Performace {
  Performace(this.title, this.color, this.count);
  String title;
  Color color;
  int count;
}

class EmployeeProfile extends StatelessWidget {
  EmployeeProfile({super.key});
  List<Performace> datasource = [
    Performace("Deadlines missed", Colors.red, 20),
    Performace("Deadlines met", Colors.blue, 80)
  ];

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
                  height: MQ.adaptiveSize(context, 150),
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
                  padding: EdgeInsets.only(top: MQ.adaptiveSize(context, 100)),
                  child: CircleAvatar(
                    radius: MQ.adaptiveSize(context, 70),
                    foregroundImage: NetworkImage(
                        "https://w7.pngwing.com/pngs/177/551/png-transparent-user-interface-design-computer-icons-default-stephen-salazar-graphy-user-interface-design-computer-wallpaper-sphere-thumbnail.png"),
                  ),
                )
              ],
            ),
            Column(
              children: [
                Container(
                  margin: EdgeInsets.all(MQ.adaptiveSize(context, 10)),
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
              margin: EdgeInsets.all(MQ.adaptiveSize(context, 10)),
              child: Card(
                color: Color.fromARGB(255, 49, 48, 48),
                child: Column(
                  children: [
                    Container(
                      margin: EdgeInsets.all(MQ.adaptiveSize(context, 20)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            margin:
                                EdgeInsets.all(MQ.adaptiveSize(context, 10)),
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
                      margin: EdgeInsets.all(MQ.adaptiveSize(context, 10)),
                      child: Text(
                        "Remarks: ",
                        style: TextStyle(color: Colors.white, fontSize: 18),
                      ),
                    ),
                    SfCircularChart(
                      title: ChartTitle(
                          text: "Performance Chart",
                          textStyle: TextStyle(
                            color: Colors.white,
                          )),
                      tooltipBehavior: TooltipBehavior(enable: true),
                      legend: Legend(
                          textStyle:
                              TextStyle(color: Colors.white, fontSize: 16),
                          isVisible: true,
                          overflowMode: LegendItemOverflowMode.wrap),
                      series: [
                        DoughnutSeries<Performace, String>(
                          pointColorMapper: (datum, index) => datum.color,
                          xValueMapper: (datum, index) => datum.title,
                          yValueMapper: (datum, index) => datum.count,
                          dataSource: datasource,
                          dataLabelSettings: DataLabelSettings(isVisible: true),
                          enableTooltip: true,
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
            Container(
              width: double.infinity,
              margin: EdgeInsets.all(MQ.adaptiveSize(context, 10)),
              child: Card(
                color: Color.fromARGB(255, 49, 48, 48),
                child: Column(
                  children: [
                    Container(
                        margin: EdgeInsets.all(MQ.adaptiveSize(context, 20)),
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
              margin: EdgeInsets.all(MQ.adaptiveSize(context, 10)),
              child: Card(
                color: Color.fromARGB(255, 49, 48, 48),
                child: Column(
                  children: [
                    Container(
                        margin: EdgeInsets.all(MQ.adaptiveSize(context, 20)),
                        child: Text("Professional Details",
                            style:
                                TextStyle(color: Colors.white, fontSize: 24))),
                    Container(
                        margin: EdgeInsets.all(MQ.adaptiveSize(context, 10)),
                        child: Text("Joining Date",
                            style:
                                TextStyle(color: Colors.white, fontSize: 18))),
                    Container(
                        margin: EdgeInsets.all(MQ.adaptiveSize(context, 10)),
                        child: Text("Reporting Manager",
                            style:
                                TextStyle(color: Colors.white, fontSize: 18))),
                    Container(
                        margin: EdgeInsets.all(MQ.adaptiveSize(context, 10)),
                        child: Text("Languages",
                            style:
                                TextStyle(color: Colors.white, fontSize: 18))),
                    Container(
                        margin: EdgeInsets.all(MQ.adaptiveSize(context, 10)),
                        child: Text("Salary",
                            style:
                                TextStyle(color: Colors.white, fontSize: 18))),
                    Container(
                        margin: EdgeInsets.all(MQ.adaptiveSize(context, 10)),
                        child: Text("Site",
                            style:
                                TextStyle(color: Colors.white, fontSize: 18))),
                    Container(
                        margin: EdgeInsets.all(MQ.adaptiveSize(context, 10)),
                        child: Text("Work Location",
                            style:
                                TextStyle(color: Colors.white, fontSize: 18)))
                  ],
                ),
              ),
            ),
            Container(
              width: double.infinity,
              margin: EdgeInsets.all(MQ.adaptiveSize(context, 10)),
              child: Card(
                color: Color.fromARGB(255, 49, 48, 48),
                child: Column(
                  children: [
                    Container(
                        margin: EdgeInsets.all(MQ.adaptiveSize(context, 20)),
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
