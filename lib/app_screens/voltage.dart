import "package:flutter/material.dart";
import "stream_builder.dart";

class voltage_page extends StatefulWidget {
  const voltage_page({super.key});

  @override
  State<voltage_page> createState() => _voltage_pageState();
}

class _voltage_pageState extends State<voltage_page> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Stack(
            children: [
              Container(
                margin: EdgeInsets.fromLTRB(10, 10, 10, 10),
                decoration: BoxDecoration(
                    border: Border.all(
                      color: Color.fromARGB(164, 91, 45, 60),
                    ),
                    borderRadius: BorderRadius.circular(10),
                    color: Color.fromARGB(122, 50, 3, 18)),
                width: 400,
                height: 660,
                alignment: Alignment.topCenter,
              ),
              Column(
                children: [
                  SizedBox(height: 23),
                  graph_container("voltage_1"),
                  graph_container("voltage_2"),
                  graph_container("voltage_3"),
                ],
              )
            ],
          ),
        ],
      ),
    );
  }
}

class graph_container extends StatelessWidget {
  final String voltage_type;
  graph_container(this.voltage_type);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
      margin: EdgeInsets.fromLTRB(30, 0, 30, 15),
      decoration: BoxDecoration(
        border: Border.all(width: 1, color: Color.fromARGB(224, 184, 184, 184)),
        borderRadius: BorderRadius.circular(10),
        color: Color.fromRGBO(0, 0, 0, 1),
      ),
      width: 340,
      height: 200,
      child: Column(
        children: [
          Text(
            voltage_type,
            style: TextStyle(
                color: Color.fromARGB(255, 244, 188, 18),
                fontWeight: FontWeight.bold,
                fontSize: 20),
          ),
          Container(
            margin: EdgeInsets.fromLTRB(10, 10, 10, 0),
            height: 140,
            width: 280,
            child: StreamBuilderall(voltage_type),
          )
        ],
      ),
      alignment: Alignment.topCenter,
    );
  }
}
