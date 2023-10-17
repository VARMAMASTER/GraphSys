import "package:flutter/material.dart";
import '../services/auth_services.dart';

class Signup extends StatefulWidget {
  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  TextEditingController newemailControler = TextEditingController();
  TextEditingController newpasswordControler = TextEditingController();
  TextEditingController newconfirmPasswordControler = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
            image: AssetImage("assets/images/signup.jpg"), fit: BoxFit.cover),
      ),
      child: Scaffold(
        appBar: AppBar(
          actions: [
            IconButton(
              color: Colors.amber,
              icon: Icon(Icons.skip_next),
              iconSize: 50,
              onPressed: () {
                // Add the desired action for the skip button here
              },
            ),
          ],
          backgroundColor: Colors.transparent,
          elevation: 0,
          titleTextStyle: const TextStyle(
            color: Color.fromARGB(255, 0, 188, 245),
            fontSize: 28,
            height: 3,
            fontWeight: FontWeight.bold,
            fontFamily: "Courier New",
          ),
          title: Text("Create Account"),
        ),
        backgroundColor: Colors.transparent,
        body: Stack(
          children: [
            Container(
              margin: EdgeInsets.fromLTRB(10, 200, 10, 0),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    TextField(
                      controller: newemailControler,
                      style: TextStyle(color: Color.fromARGB(255, 0, 188, 245)),
                      obscureText: false, // Mask the input as a password
                      autocorrect: false, // Disable autocorrect
                      enableSuggestions: true,
                      decoration: InputDecoration(
                        labelText: "Email",
                        labelStyle: TextStyle(color: Colors.amber),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: const Color.fromARGB(255, 0, 255, 132)),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: const Color.fromARGB(255, 0, 136, 255)),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    TextField(
                      controller: newpasswordControler,
                      style: TextStyle(color: Color.fromARGB(255, 0, 188, 245)),
                      obscureText: true, // Mask the input as a password
                      autocorrect: false, // Disable autocorrect
                      enableSuggestions: false,
                      decoration: InputDecoration(
                        labelText: "Password",
                        labelStyle: TextStyle(color: Colors.amber),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: const Color.fromARGB(255, 0, 255, 132)),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: const Color.fromARGB(255, 0, 136, 255)),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    TextField(
                      controller: newconfirmPasswordControler,
                      style: TextStyle(color: Color.fromARGB(255, 0, 188, 245)),
                      obscureText: true, // Mask the input as a password
                      autocorrect: false, // Disable autocorrect
                      enableSuggestions: false,
                      decoration: InputDecoration(
                        labelText: "Conform Password",
                        labelStyle: TextStyle(color: Colors.amber),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: const Color.fromARGB(255, 0, 255, 132)),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: const Color.fromARGB(255, 0, 136, 255)),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    OutlinedButton(
                      style: ButtonStyle(
                        side: MaterialStatePropertyAll(
                          BorderSide(color: Colors.amber),
                        ),
                      ),
                      onPressed: () async {
                        if (newemailControler.text == "" ||
                            newpasswordControler.text == "" ||
                            newconfirmPasswordControler.text == "") {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text(
                                "All Fields Should be filled",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold),
                              ),
                              backgroundColor: Color.fromARGB(255, 247, 4, 0),
                            ),
                          );
                        } else if (newconfirmPasswordControler.text !=
                            newpasswordControler.text) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text(
                                "Passwords do not match",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold),
                              ),
                              backgroundColor: Color.fromARGB(255, 247, 4, 0),
                            ),
                          );
                        } else {
                          try {
                            var result = await AuthService().register(
                                newemailControler.text,
                                newpasswordControler.text);
                            if (result != null) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text(
                                    "Login details added successfully",
                                    style: const TextStyle(
                                        color: Colors.white,
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  backgroundColor:
                                      const Color.fromARGB(255, 6, 83, 46),
                                ),
                              );
                            }
                          } catch (e) {
                            var exception = e.toString().split("]");
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text(
                                  exception[1],
                                  style: const TextStyle(
                                      color: Colors.white,
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold),
                                ),
                                backgroundColor: Color.fromARGB(255, 247, 4, 0),
                              ),
                            );
                          }
                        }
                      },
                      child: const Text(
                        "Create an Account!",
                        style: TextStyle(color: Colors.greenAccent),
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
