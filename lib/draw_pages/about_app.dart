import 'package:flutter/material.dart';

class about_app extends StatelessWidget {
  final String machineName = "GraphSys";
  final String description =
      "GraphSys is a data visualisation and Dashboards applicaion for the smart shearing machine";

  final List<String> features = [
    "Real-time Performance Monitoring",
    "Ultrasonic Sensors monitoring",
    "Automated Cutting monitoring",
    "Machine Status Tower Lights",
    "User-Friendly Dashboard Interface",
    "Attractive Graphs",
    "Intuitive UI ",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(248, 1, 14, 41),
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 50, 3, 18),
        title: Text("About App"),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Container(
          height: 750,
          color: Colors.black, // Dark theme background color
          padding: EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                machineName,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 10),
              Text(
                description,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                ),
              ),
              SizedBox(height: 20),
              Text(
                "Key Features:",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 10),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: features.map((feature) {
                  return Container(
                    padding: EdgeInsets.symmetric(vertical: 4),
                    child: Row(
                      children: [
                        Icon(
                          Icons.check,
                          color: Colors.green,
                        ),
                        SizedBox(width: 5),
                        Text(
                          feature,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                          ),
                        ),
                      ],
                    ),
                  );
                }).toList(),
              ),
              SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
