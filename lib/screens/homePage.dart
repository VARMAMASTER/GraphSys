import "package:flutter/material.dart";
import "package:cloud_firestore/cloud_firestore.dart";
import "../app_screens/voltage.dart";
import "../app_screens/current.dart";
import "../app_screens/dashboards.dart";
import "package:csv/csv.dart";
import "package:path_provider/path_provider.dart";
import 'dart:io';

class home extends StatefulWidget {
  const home({super.key});

  @override
  State<home> createState() => _homeState();
}

class _homeState extends State<home> {
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  var index = 0;
  List<Widget> pages = [
    const voltage_page(),
    const current_page(),
    const Dashboards()
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(11, 8, 53, 1),
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 50, 3, 18),
        title: const Text("GraphSys Data Center"),
        centerTitle: true,
        actions: [
          Container(
              margin: const EdgeInsets.fromLTRB(0, 20, 0, 20),
              child: const Text(
                "csv",
                style: TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.bold,
                ),
              )),
          IconButton(
            onPressed: () async {
              QuerySnapshot<Map<String, dynamic>> snapshot =
                  await FirebaseFirestore.instance
                      .collection('shearingMachine')
                      .orderBy("time")
                      .get();

              List<List<dynamic>> csvData = [];

              csvData.add([
                "time",
                "voltage_1",
                "voltage_2",
                "voltage_3",
                "current_1",
                "current_2",
                "current_3",
                "proximity_sensor_1",
                "proximity_sensor_2",
                "proximity_sensor_3",
                "proximity_sensor_",
                "power_factor",
                "frequency",
                "kWh",
                "machine_status",
                "tower_light",
                "cut_sensor",
                "cycle_time",
                "performance",
                "Quality",
                "availability"
              ]);
              snapshot.docs.forEach(
                (document) {
                  var row = [
                    document['time'],
                    document['voltage_1'],
                    document['voltage_2'],
                    document['voltage_3'],
                    document["current_1"],
                    document["current_2"],
                    document["current_3"],
                    document["proximity_sensor_1"],
                    document["proximity_sensor_2"],
                    document["proximity_sensor_3"],
                    document["proximity_sensor_4"],
                    document["power_factor"],
                    document["frequency"],
                    document["kWh"],
                    document["machine_status"],
                    document["tower_light"],
                    document["cut_sensor"],
                    document["cycle_time"],
                    document["performance"],
                    document["Quality"],
                    document["Quality"],
                  ];
                  csvData.add(row);
                },
              );
              String csvString = const ListToCsvConverter().convert(csvData);
              final directory = await getExternalStorageDirectory();
              final file = File('${directory?.path}/data.csv');
              await file.writeAsString(csvString);

              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  content: Text(
                    "File saved to ${file}",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 15,
                        fontWeight: FontWeight.bold),
                  ),
                  backgroundColor: Color.fromARGB(255, 52, 93, 38)));
            },
            icon: const Icon(Icons.download),
            tooltip: "Download CSV",
          )
        ],
      ),
      drawer: Drawer(
        elevation: 10,
        child: Container(
          color: const Color.fromARGB(248, 1, 14, 41),
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              DrawerHeader(
                decoration: const BoxDecoration(
                  color: Color.fromARGB(255, 9, 9, 24),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    const Text(
                      "GraphSys",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Container(
                      child: Image.asset(
                        "assets/images/Logo.jpeg",
                        scale: 5,
                      ),
                    ),
                  ],
                ),
              ),
              ListTile(
                hoverColor: const Color.fromARGB(255, 10, 31, 48),
                onTap: () {
                  Navigator.of(context).pushNamed("about_app");
                },
                leading: const Icon(
                  Icons.info,
                  color: Colors.white,
                ),
                title: const Text(
                  "About application",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const Divider(
                color: Colors.white,
                thickness: 0.5,
              ),
              ListTile(
                onTap: () {
                  Navigator.of(context).pushNamed("Fsm");
                },
                leading: const Icon(
                  Icons.info,
                  color: Colors.white,
                ),
                title: const Text(
                  "About FSM",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const Divider(
                color: Colors.white,
                thickness: 0.5,
              ),
              ListTile(
                onTap: () {
                  Navigator.of(context).pushNamed("SSm");
                },
                leading: const Icon(
                  Icons.info,
                  color: Colors.white,
                ),
                title: const Text(
                  "About Shearing Machine",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const Divider(
                color: Colors.white,
                thickness: 0.5,
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: const Color.fromARGB(255, 50, 3, 1),
        unselectedItemColor: Colors.white,
        selectedItemColor: const Color.fromRGBO(0, 132, 255, 1),
        currentIndex: index,
        onTap: (value) {
          setState(() {
            index = value;
          });
        },
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.stacked_line_chart), label: "Voltage"),
          BottomNavigationBarItem(
              icon: Icon(Icons.stacked_line_chart), label: "current"),
          BottomNavigationBarItem(
              icon: Icon(Icons.dashboard), label: "Dashboards"),
        ],
      ),
      body: pages[index],
    );
  }
}

Widget buildDrawerItem(
    {required IconData icon,
    required String title,
    required VoidCallback onPressed}) {
  return InkWell(
    onTap: onPressed,
    splashColor: Colors.blue, // Customize the ripple effect color if needed
    child: Container(
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 16),
      child: Row(
        children: [
          Icon(
            icon,
            color: Colors.white,
            size: 30,
          ),
          const SizedBox(width: 20),
          Text(
            title,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    ),
  );
}
