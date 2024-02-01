import 'package:flutter/material.dart';
import 'package:nexsync/models/employee_engagement.dart';
import 'package:nexsync/models/employee_skills.dart';
import 'package:nexsync/widgets/create_project.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:syncfusion_flutter_charts/sparkcharts.dart';

class StatsPage extends StatefulWidget {
  const StatsPage({super.key});

  @override
  State<StatsPage> createState() => _StatsPageState();
}

class _StatsPageState extends State<StatsPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        margin: EdgeInsets.all(10),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                margin: EdgeInsets.all(5),
                child: Card(
                  elevation: 10,
                  color: Color.fromARGB(255, 59, 57, 57),
                  child: SfCircularChart(
                    title: ChartTitle(
                      text: "Employee Engagement",
                      textStyle: TextStyle(color: Colors.white),
                    ),
                    tooltipBehavior: TooltipBehavior(enable: true),
                    legend: Legend(
                        textStyle: TextStyle(color: Colors.white, fontSize: 16),
                        isVisible: true,
                        overflowMode: LegendItemOverflowMode.wrap),
                    series: [
                      DoughnutSeries<Engagement, String>(
                          onPointTap: (pointInteractionDetails) {
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
                                return Scaffold(
                                  body: CreateProject(),
                                  backgroundColor:
                                      Color.fromARGB(255, 31, 31, 31),
                                );
                              },
                            );
                          },
                          pointColorMapper: (datum, index) => datum.color,
                          xValueMapper: (datum, index) => datum.engagement,
                          yValueMapper: (datum, index) => datum.employees,
                          dataSource: engagementList,
                          dataLabelSettings: DataLabelSettings(
                              isVisible: true,
                              textStyle: TextStyle(
                                  color: Colors.black,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold)),
                          enableTooltip: true)
                    ],
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.all(10),
                child: Card(
                  color: Color.fromARGB(255, 59, 57, 57),
                  child: Column(
                    children: [
                      Container(
                        margin: EdgeInsets.all(10),
                        child: SfSparkBarChart.custom(
                          labelStyle: TextStyle(color: Colors.white),
                          labelDisplayMode: SparkChartLabelDisplayMode.all,
                          xValueMapper: (index) =>
                              skilledEmployeeList[index].skill,
                          yValueMapper: (index) =>
                              skilledEmployeeList[index].count,
                          dataCount: skilledEmployeeList.length,
                          trackball: SparkChartTrackball(),
                          lowPointColor: Colors.red,
                          highPointColor: Colors.green,
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.all(20),
                        child: FittedBox(
                          child: Text(
                            "Department Wise Employee Distribution",
                            style: TextStyle(color: Colors.white, fontSize: 16),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.all(10),
                child: Card(
                  color: Color.fromARGB(255, 59, 57, 57),
                  child: Column(
                    children: [
                      Container(
                        margin: EdgeInsets.all(10),
                        child: SfSparkBarChart.custom(
                          labelStyle: TextStyle(color: Colors.white),
                          labelDisplayMode: SparkChartLabelDisplayMode.all,
                          xValueMapper: (index) =>
                              skilledEmployeeList[index].skill,
                          yValueMapper: (index) =>
                              skilledEmployeeList[index].count,
                          dataCount: skilledEmployeeList.length,
                          trackball: SparkChartTrackball(),
                          lowPointColor: Colors.red,
                          highPointColor: Colors.green,
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.all(20),
                        child: FittedBox(
                          child: Text(
                            "Sub-Department Wise Employee Distribution",
                            style: TextStyle(color: Colors.white, fontSize: 16),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
