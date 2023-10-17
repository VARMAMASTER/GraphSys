import 'package:flutter/material.dart';

class SmartShearingMachine extends StatelessWidget {
  final Map<String, dynamic> smartShearingMachineInfo = {
    'machineName': 'Smart Shearing Machine',
    'description':
        'A Smart Shearing Machine is an advanced manufacturing device that is equipped with Internet of Things (IoT) sensors, artificial intelligence (AI) algorithms, and connectivity features. These machines are designed to be flexible, autonomous, and capable of sharing data and insights with other machines and systems in the manufacturing environment.',
    'uses': [
      'Increased Efficiency: These machines optimize their operations and adjust settings based on real-time data, leading to higher productivity and reduced downtime.',
      'Resource Management: Smart Sharing Machines can monitor and manage resource consumption, such as energy and raw materials, to reduce waste and improve sustainability.',
      'Predictive Maintenance: Through continuous monitoring and data analysis, these machines can predict maintenance needs, preventing breakdowns and costly repairs.',
      'Collaborative Manufacturing: These machines can communicate with each other to streamline production processes and improve coordination in complex manufacturing workflows.',
    ],
    'impact': [
      'Increased Productivity: By optimizing processes and reducing downtime, manufacturing productivity can be significantly improved.',
      'Resource Efficiency: With better resource management, these machines contribute to reducing waste and conserving resources, leading to a more sustainable manufacturing sector.',
      'Economic Growth: Increased productivity and efficiency can lead to cost savings and improved competitiveness for manufacturing industries, contributing to economic growth.',
      'Job Opportunities: While automation might lead to some job displacement, it can also create new job opportunities in fields like machine maintenance, AI programming, and data analysis.',
    ],
    'smartFeatures': [
      'Connectivity: Smart machines can connect with each other, share data, and operate collaboratively, optimizing the overall production process.',
      'Data-Driven Decisions: By collecting and analyzing real-time data, these machines make informed decisions to enhance efficiency and quality.',
      'Autonomous Operations: Smart machines can operate autonomously, reducing the need for constant human intervention and oversight.',
      'Predictive Capabilities: With predictive maintenance and real-time monitoring, these machines can anticipate issues and minimize unplanned downtime.',
    ],
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 50, 3, 18),
        title: Text("Smart Shearing Machine"),
        centerTitle: true,
      ),
      body: Container(
        decoration: BoxDecoration(
          color: Color.fromARGB(255, 1, 27, 46),
        ),
        padding: EdgeInsets.all(16),
        // Modern dark theme
        child: ListView(
          children: [
            Container(
              decoration:
                  BoxDecoration(borderRadius: BorderRadius.circular(30)),
              width: double.infinity,
              padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
              child: Image.asset(
                "./assets/images/shearm.jpeg",
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              smartShearingMachineInfo['description'],
              style: TextStyle(
                color: Colors.white,
                fontSize: 18,
              ),
            ),
            SizedBox(height: 16),
            buildSection('Uses:', smartShearingMachineInfo['uses']),
            buildSection(
                'Impact on the World:', smartShearingMachineInfo['impact']),
            buildSection(
                'How Smart Sharing Machines Make Manufacturing "Smart":',
                smartShearingMachineInfo['smartFeatures']),
          ],
        ),
      ),
    );
  }

  Widget buildSection(String title, List<String> items) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: 8),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: items.map((item) {
            return Text(
              "- " + item,
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
              ),
            );
          }).toList(),
        ),
        SizedBox(height: 16),
      ],
    );
  }
}
