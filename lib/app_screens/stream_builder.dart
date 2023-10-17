import "package:flutter/material.dart";
import "package:fl_chart/fl_chart.dart";
import "package:cloud_firestore/cloud_firestore.dart";
import 'package:loading_animation_widget/loading_animation_widget.dart';
import "dart:math";

// ignore: must_be_immutable
class StreamBuilderall extends StatelessWidget {
  // ignore: non_constant_identifier_names
  String Stream_name;
  StreamBuilderall(this.Stream_name);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: FirebaseFirestore.instance
          .collection("shearingMachine")
          .orderBy("time")
          .snapshots(),
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (snapshot.hasError) {
          return Text("Error: ${snapshot.error}");
        } else if (snapshot.connectionState == ConnectionState.waiting) {
          return Container(
            child: LoadingAnimationWidget.discreteCircle(
              color: const Color.fromARGB(255, 255, 198, 29),
              size: 20,
            ),
          );
        } else if (snapshot.hasData) {
          try {
            if (Stream_name == "voltage_1" ||
                Stream_name == "voltage_2" ||
                Stream_name == "voltage_3" ||
                Stream_name == "current_1" ||
                Stream_name == "current_2" ||
                Stream_name == "current_3") {
              var spots = snapshot.data!.docs.map(
                (e) {
                  var time = (e.get("time") as int).toDouble();
                  var voltage = (e.get(Stream_name) as int).toDouble();

                  return FlSpot(time, voltage);
                },
              ).toList();

              return Container(
                padding: const EdgeInsets.fromLTRB(0, 0, 10, 0),
                child: LineChart(
                  curve: Curves.easeInBack,
                  LineChartData(
                    gridData: const FlGridData(
                        drawVerticalLine: bool.fromEnvironment("")),
                    minX: 0,
                    maxX: spots.map((tuple) => tuple.x).reduce(max),
                    minY: 0,
                    maxY: spots.map((tuple) => tuple.y).reduce(max) + 5,
                    lineTouchData: LineTouchData(
                        touchTooltipData: LineTouchTooltipData(
                            tooltipBgColor: Color.fromARGB(255, 44, 39, 6),
                            tooltipBorder: BorderSide(color: Colors.purple))),
                    lineBarsData: [
                      LineChartBarData(
                        spots: spots,
                        isCurved: true,
                        color: Color.fromARGB(255, 26, 173, 179),
                        barWidth: 4,
                        dotData: FlDotData(show: false),
                        belowBarData: BarAreaData(
                            show: true, color: Color.fromARGB(62, 7, 192, 216)),
                      )
                    ],
                    titlesData: FlTitlesData(
                        rightTitles: const AxisTitles(
                          sideTitles: SideTitles(showTitles: false),
                        ),
                        topTitles: const AxisTitles(
                          sideTitles: SideTitles(showTitles: false),
                        ),
                        bottomTitles: AxisTitles(
                          sideTitles: SideTitles(
                            showTitles: true,
                            getTitlesWidget: (value, meta) {
                              return SideTitleWidget(
                                axisSide: meta.axisSide,
                                child: Text(
                                  meta.formattedValue,
                                  style: const TextStyle(color: Colors.white),
                                ),
                              );
                            },
                          ),
                        ),
                        leftTitles: AxisTitles(
                          sideTitles: SideTitles(
                            showTitles: true,
                            getTitlesWidget: (value, meta) {
                              return SideTitleWidget(
                                axisSide: AxisSide.top,
                                child: Text(
                                  meta.formattedValue,
                                  style: const TextStyle(color: Colors.white),
                                ),
                              );
                            },
                          ),
                        )),
                  ),
                ),
              );
            } else if (Stream_name == "proximity_sensor_1" ||
                Stream_name == "proximity_sensor_2" ||
                Stream_name == "proximity_sensor_3" ||
                Stream_name == "proximity_sensor_4") {
              var Sense = snapshot.data!.docs;
              var SenseValue = Sense[Sense.length - 1].get(Stream_name);
              var colormap = [
                Color.fromARGB(255, 222, 3, 3),
                Colors.green[600],
              ];
              return Container(
                margin: EdgeInsets.fromLTRB(10, 20, 10, 10),
                height: 30,
                width: 30,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: colormap[SenseValue],
                ),
              );
            } else if (Stream_name == "performance_chart") {
              var pspots = snapshot.data!.docs.map((e) {
                var time = (e.get("time") as int).toDouble();
                var perfor = (e.get("performance") * 100).toStringAsFixed(1);

                return FlSpot(time, double.parse(perfor));
              }).toList();

              return Container(
                padding: const EdgeInsets.fromLTRB(0, 0, 10, 0),
                child: LineChart(
                  curve: Curves.easeInBack,
                  LineChartData(
                    gridData: const FlGridData(
                      show: true,
                      drawHorizontalLine: true,
                      drawVerticalLine: false,
                      horizontalInterval: 10,
                    ),
                    minX: 0,
                    maxX: pspots.map((tuple) => tuple.x).reduce(max),
                    minY: 0,
                    maxY: pspots.map((tuple) => tuple.y).reduce(max),
                    lineTouchData: LineTouchData(
                        touchTooltipData: LineTouchTooltipData(
                            tooltipBgColor: Color.fromARGB(255, 44, 39, 6),
                            tooltipBorder: BorderSide(color: Colors.purple))),
                    lineBarsData: [
                      LineChartBarData(
                        spots: pspots,
                        isCurved: true,
                        color: Color.fromARGB(255, 26, 173, 179),
                        barWidth: 4,
                        dotData: FlDotData(show: false),
                        belowBarData: BarAreaData(
                            show: true, color: Color.fromARGB(62, 7, 192, 216)),
                      )
                    ],
                    titlesData: FlTitlesData(
                        rightTitles: const AxisTitles(
                          sideTitles: SideTitles(showTitles: false),
                        ),
                        topTitles: const AxisTitles(
                          sideTitles: SideTitles(showTitles: false),
                        ),
                        bottomTitles: AxisTitles(
                          sideTitles: SideTitles(
                            showTitles: true,
                            getTitlesWidget: (value, meta) {
                              return SideTitleWidget(
                                axisSide: AxisSide.left,
                                child: Text(
                                  meta.formattedValue,
                                  style: const TextStyle(color: Colors.white),
                                ),
                              );
                            },
                          ),
                        ),
                        leftTitles: AxisTitles(
                          sideTitles: SideTitles(
                            showTitles: true,
                            getTitlesWidget: (value, meta) {
                              return SideTitleWidget(
                                axisSide: AxisSide.top,
                                child: Text(
                                  meta.formattedValue,
                                  style: const TextStyle(color: Colors.white),
                                ),
                              );
                            },
                          ),
                        )),
                  ),
                ),
              );
            } else if (Stream_name == "OEE" ||
                Stream_name == "power_factor" ||
                Stream_name == "frequency" ||
                Stream_name == "kWh" ||
                Stream_name == "cycle_time" ||
                Stream_name == "availability" ||
                Stream_name == "Quality" ||
                Stream_name == "performance") {
              var Sense2 = snapshot.data!.docs;
              var availability = Sense2[Sense2.length - 1].get("availability");
              var Quality = Sense2[Sense2.length - 1].get("Quality");
              var performance = Sense2[Sense2.length - 1].get("Quality");
              var OEE = availability * Quality * performance;

              if (Stream_name == "power_factor" ||
                  Stream_name == "frequency" ||
                  Stream_name == "kWh" ||
                  Stream_name == "Quality" ||
                  Stream_name == "cycle_time" ||
                  Stream_name == "availability" ||
                  Stream_name == "performance") {
                var SenseValue2 = Sense2[Sense2.length - 1].get(Stream_name);
                return Text(
                  SenseValue2.toStringAsFixed(2),
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                      color: Colors.cyan),
                );
              } else if (Stream_name == "OEE") {
                return Text(
                  OEE.toStringAsFixed(2),
                  style: TextStyle(
                      color: Colors.cyan,
                      fontSize: 16,
                      fontWeight: FontWeight.bold),
                );
              }
            } else if (Stream_name == "cut_sensor" ||
                Stream_name == "tower_light" ||
                Stream_name == "machine_status") {
              var Sense3 = snapshot.data!.docs;
              var SenseValue3 = Sense3[Sense3.length - 1].get(Stream_name);
              var ListColor = [
                Colors.red,
                Colors.green,
                Colors.yellow,
              ];
              if (Stream_name == "cut_sensor") {
                return Container(
                  margin: EdgeInsets.all(5),
                  height: 30,
                  width: 30,
                  decoration: BoxDecoration(
                    color: ListColor[SenseValue3],
                    borderRadius: BorderRadius.circular(5),
                  ),
                );
              } else if (Stream_name == "tower_light") {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      "Tower Lights",
                      style: TextStyle(
                          color: Colors.yellow,
                          fontSize: 16,
                          fontWeight: FontWeight.bold),
                    ),
                    Container(
                      margin: EdgeInsets.fromLTRB(20, 10, 20, 1),
                      height: 42,
                      width: 41,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(color: Colors.white, width: 1)),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            margin: EdgeInsets.all(5),
                            height: 30,
                            width: 30,
                            decoration: BoxDecoration(
                              color: (SenseValue3 == 0)
                                  ? Color.fromARGB(255, 245, 17, 1)
                                  : Colors.red[200],
                              borderRadius: BorderRadius.circular(5),
                            ),
                          )
                        ],
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.fromLTRB(20, 0, 20, 2),
                      height: 42,
                      width: 41,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(color: Colors.white, width: 1)),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            margin: EdgeInsets.all(5),
                            height: 30,
                            width: 30,
                            decoration: BoxDecoration(
                              color: (SenseValue3 == 1)
                                  ? const Color.fromARGB(255, 249, 224, 2)
                                  : Colors.yellow[200],
                              borderRadius: BorderRadius.circular(5),
                            ),
                          )
                        ],
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.fromLTRB(20, 0, 20, 10),
                      height: 42,
                      width: 41,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(color: Colors.white, width: 1)),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            margin: EdgeInsets.all(5),
                            height: 30,
                            width: 30,
                            decoration: BoxDecoration(
                              color: (SenseValue3 == 2)
                                  ? const Color.fromARGB(255, 4, 249, 13)
                                  : Colors.green[200],
                              borderRadius: BorderRadius.circular(5),
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                );
              } else if (Stream_name == "machine_status") {
                return Container(
                  margin: EdgeInsets.all(5),
                  height: 30,
                  width: 30,
                  decoration: BoxDecoration(
                    color: ListColor[SenseValue3],
                    borderRadius: BorderRadius.circular(5),
                  ),
                );
              }
            }
          } catch (ex) {
            LoadingAnimationWidget.discreteCircle(
              color: const Color.fromARGB(255, 255, 198, 29),
              size: 20,
            );
          }
        }
        return LoadingAnimationWidget.discreteCircle(
          color: const Color.fromARGB(255, 255, 198, 29),
          size: 20,
        );
      },
    );
  }
}
