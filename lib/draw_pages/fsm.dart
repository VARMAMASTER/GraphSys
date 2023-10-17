import "package:flutter/material.dart";

class Fsm extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Color.fromARGB(248, 1, 14, 41),
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          backgroundColor: Color.fromARGB(255, 50, 3, 18),
          title: Text("FSM Skills"),
          centerTitle: true,
        ),
        body: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                width: double.infinity,
                padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
                child: Image.asset("./assets/images/fsm.png"),
              ),
              Container(
                margin: EdgeInsets.all(10),
                padding: EdgeInsets.all(10),
                height: 540,
                decoration: BoxDecoration(
                  color: Colors.black,
                  border: Border.all(color: Colors.cyan),
                  borderRadius: BorderRadius.circular(10),
                ),
                width: double.infinity,
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Text(
                        "The Foundation for Smart Manufacturing (FSM) at the Indian Institute of Technology Delhi (IITD) is a leading provider of training and education in the field of smart manufacturing. FSM Skills is a holistic platform for providing immersive training experience through live lectures, online learning, live demonstrations, live labs, and self-paced exercises on remotely accessible actual hardware.",
                        style: TextStyle(color: Colors.white),
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(height: 16),
                      Text(
                        "FSM Skills offers a variety of courses on topics related to Industry 4.0, including:",
                        style: TextStyle(color: Colors.white),
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(height: 8),
                      Text(
                        "• FSM Master Class Level 1: Introduction to Smart Manufacturing\n"
                        "• FSM Master Class Level 2: Advanced topics in Smart Manufacturing\n"
                        "• Robotics Implementation in Smart Manufacturing\n"
                        "• Implementing Machine Learning in Manufacturing\n"
                        "• Implementing Augmented Reality in Manufacturing\n"
                        "• Industrial Automation Driving Industry 4.0\n"
                        "• Industrial Automation and IIoT using Soft-PLC\n"
                        "• Awareness and Evaluation for Industrial Automation Learning\n"
                        "• Manufacturing Operations Management\n"
                        "• Smart Manufacturing Internship 2023",
                        style: TextStyle(color: Colors.white),
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(height: 16),
                      Text(
                        "FSM Skills courses are designed to provide students with the skills and knowledge they need to succeed in the field of smart manufacturing. The courses cover a wide range of topics, from the basics of automation to the latest trends in machine learning and augmented reality. FSM Skills also offers live labs and hands-on exercises, which give students the opportunity to apply their knowledge in a practical setting.",
                        style: TextStyle(color: Colors.white),
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(height: 16),
                      Text(
                        "FSM Skills courses are taught by experienced professionals from industry and academia. The instructors are passionate about smart manufacturing and are committed to providing students with the best possible learning experience.",
                        style: TextStyle(color: Colors.white),
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(height: 16),
                      Text(
                        "FSM Skills courses are highly relevant to the needs of the industry. The courses cover the latest trends in smart manufacturing, and the instructors are well-connected with industry leaders. This ensures that students who complete FSM Skills courses will be well-prepared for a career in smart manufacturing.",
                        style: TextStyle(color: Colors.white),
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(height: 16),
                      ElevatedButton(
                        onPressed: () {
                          // Add your action here
                        },
                        child: Text("Visit FSM Skills Website"),
                      ),
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
