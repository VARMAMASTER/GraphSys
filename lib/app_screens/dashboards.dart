import "package:flutter/material.dart";
import "./stream_builder.dart";

class Dashboards extends StatefulWidget {
  const Dashboards({super.key});

  @override
  State<Dashboards> createState() => _DashboardsState();
}

class _DashboardsState extends State<Dashboards> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Stack(
            children: [
              Container(
                padding: EdgeInsets.all(10),
                margin: EdgeInsets.fromLTRB(10, 30, 10, 10),
                decoration: BoxDecoration(
                    border: Border.all(
                      color: Color.fromARGB(164, 91, 45, 60),
                      width: 2,
                    ),
                    borderRadius: BorderRadius.circular(10),
                    color: Color.fromARGB(122, 50, 3, 18)),
                width: 400,
                height: 820,
                child: Text(
                  "Dashboard",
                  style: TextStyle(
                      color: Color.fromARGB(255, 244, 188, 18),
                      fontWeight: FontWeight.bold,
                      fontSize: 20),
                ),
                alignment: Alignment.topCenter,
              ),
              Column(
                children: [
                  Container(
                    margin: EdgeInsets.fromLTRB(20, 70, 20, 10),
                    padding: EdgeInsets.all(10),
                    width: double.infinity,
                    height: 190,
                    decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(
                        color: Colors.cyan,
                      ),
                    ),
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          const Text(
                            "Proximity Sensors",
                            style: TextStyle(
                                color: Colors.yellow,
                                fontWeight: FontWeight.bold,
                                fontSize: 20),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Prox_container("P 1", "proximity_sensor_1"),
                              Prox_container("P 2", "proximity_sensor_2"),
                              Prox_container("P 3", "proximity_sensor_3"),
                              Prox_container("P 4", "proximity_sensor_4"),
                            ],
                          ),
                          Row(
                            children: [
                              SizedBox(
                                width: 20,
                              ),
                              Text(
                                "Off",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 17,
                                    fontWeight: FontWeight.bold),
                              ),
                              Container(
                                decoration: BoxDecoration(
                                  color: Colors.red,
                                  borderRadius: BorderRadius.circular(7),
                                ),
                                margin: EdgeInsets.fromLTRB(10, 0, 0, 0),
                                height: 20,
                                width: 20,
                              ),
                              SizedBox(
                                width: 20,
                              ),
                              Text(
                                "On",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold),
                              ),
                              Container(
                                decoration: BoxDecoration(
                                  color: Colors.green,
                                  borderRadius: BorderRadius.circular(7),
                                ),
                                margin: EdgeInsets.fromLTRB(10, 0, 0, 0),
                                height: 20,
                                width: 20,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.fromLTRB(20, 0, 20, 10),
                    padding: EdgeInsets.all(10),
                    height: 100,
                    decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(
                        color: Colors.cyan,
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text(
                              "Power Factor:",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                              ),
                            ),
                            Text(
                              "Frequency:",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                              ),
                            ),
                            Text(
                              "kWh:",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                              ),
                            ),
                            Text(
                              "Cycle Time:",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                              ),
                            ),
                          ],
                        ),
                        SingleChildScrollView(
                          child: Container(
                            child: Column(
                              children: [
                                StreamBuilderall("power_factor"),
                                StreamBuilderall("frequency"),
                                StreamBuilderall("kWh"),
                                StreamBuilderall("cycle_time"),
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 15,
                        ),
                        const Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Text(
                                "Quality:",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                ),
                              ),
                              Text(
                                "availability:",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                ),
                              ),
                              Text(
                                "performance:",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                ),
                              ),
                              Text(
                                "OEE:",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                ),
                              ),
                            ]),
                        SingleChildScrollView(
                          child: Container(
                            child: Column(
                              children: [
                                StreamBuilderall("Quality"),
                                StreamBuilderall("availability"),
                                StreamBuilderall("performance"),
                                StreamBuilderall("OEE"),
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
                    margin: EdgeInsets.fromLTRB(20, 0, 20, 15),
                    decoration: BoxDecoration(
                      border: Border.all(width: 1, color: Colors.cyan),
                      borderRadius: BorderRadius.circular(10),
                      color: Color.fromARGB(255, 0, 0, 0),
                    ),
                    width: 400,
                    height: 200,
                    child: Column(
                      children: [
                        Text(
                          "performance_chart",
                          style: TextStyle(
                              color: Color.fromARGB(255, 244, 188, 18),
                              fontWeight: FontWeight.bold,
                              fontSize: 20),
                        ),
                        Container(
                          margin: EdgeInsets.fromLTRB(10, 10, 10, 0),
                          height: 140,
                          width: 280,
                          child: StreamBuilderall("performance_chart"),
                        )
                      ],
                    ),
                    alignment: Alignment.topCenter,
                  ),
                  Container(
                    padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
                    margin: EdgeInsets.fromLTRB(20, 0, 20, 0),
                    decoration: BoxDecoration(
                      border: Border.all(width: 1, color: Colors.cyan),
                      borderRadius: BorderRadius.circular(10),
                      color: Color.fromARGB(255, 0, 0, 0),
                    ),
                    height: 210,
                    width: double.infinity,
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Column(
                              children: [
                                Text(
                                  "Cut Sensor",
                                  style: TextStyle(
                                      color: Colors.yellow,
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold),
                                ),
                                SingleChildScrollView(
                                  child: Container(
                                    margin: EdgeInsets.fromLTRB(20, 10, 20, 10),
                                    height: 42,
                                    width: 41,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        border: Border.all(
                                            color: Colors.white, width: 1)),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        StreamBuilderall("cut_sensor")
                                      ],
                                    ),
                                  ),
                                ),
                                Container(
                                  margin: EdgeInsets.all(10),
                                  child: Text(
                                    "Machinie Status",
                                    style: TextStyle(
                                        color: Colors.yellow,
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                                SingleChildScrollView(
                                  child: Container(
                                    margin: EdgeInsets.fromLTRB(20, 10, 20, 10),
                                    height: 42,
                                    width: 41,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        border: Border.all(
                                            color: Colors.white, width: 1)),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        StreamBuilderall("machine_status"),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              width: 40,
                            ),
                            Container(
                                padding: EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    border: Border.all(
                                      color: Colors.white,
                                    )),
                                child: StreamBuilderall("tower_light")),
                          ],
                        )
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.fromLTRB(20, 0, 20, 15),
                    decoration: BoxDecoration(
                      border: Border.all(width: 1, color: Colors.cyan),
                      borderRadius: BorderRadius.circular(10),
                      color: Color.fromARGB(255, 0, 0, 0),
                    ),
                    height: 30,
                    width: double.infinity,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Container(
                          margin: EdgeInsets.fromLTRB(20, 0, 0, 0),
                          height: 15,
                          width: 15,
                          decoration: BoxDecoration(
                            border: Border.all(width: 1, color: Colors.cyan),
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.green,
                          ),
                        ),
                        Text(
                          "working",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 14,
                              fontWeight: FontWeight.bold),
                        ),
                        Container(
                          margin: EdgeInsets.fromLTRB(20, 0, 0, 0),
                          height: 15,
                          width: 15,
                          decoration: BoxDecoration(
                            border: Border.all(width: 1, color: Colors.cyan),
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.red,
                          ),
                        ),
                        Text(
                          "Stop",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 14,
                              fontWeight: FontWeight.bold),
                        ),
                        Container(
                          margin: EdgeInsets.fromLTRB(20, 0, 0, 0),
                          height: 15,
                          width: 15,
                          decoration: BoxDecoration(
                            border: Border.all(width: 1, color: Colors.cyan),
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.yellow,
                          ),
                        ),
                        Text(
                          "Help",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 14,
                              fontWeight: FontWeight.bold),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}

// ignore: camel_case_types, must_be_immutable
class Prox_container extends StatelessWidget {
  String snrname;
  String stream;
  Prox_container(this.snrname, this.stream);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(10, 0, 10, 10),
      height: 100,
      width: 50,
      decoration: BoxDecoration(border: Border.all(color: Colors.white)),
      child: Column(
        children: [
          StreamBuilderall(stream),
          Text(
            snrname,
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}
