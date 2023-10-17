import "package:flutter/material.dart";
import "../services/auth_services.dart";

class Login extends StatefulWidget {
  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController emailControler = TextEditingController();
  TextEditingController passwordControler = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
            image: AssetImage("assets/images/login.jpg"), fit: BoxFit.cover),
      ),
      child: Scaffold(
        appBar: AppBar(
          actions: [
            IconButton(
              color: Colors.amber,
              icon: Icon(Icons.skip_next),
              iconSize: 50,
              onPressed: () {
                Navigator.of(context).popAndPushNamed("home");
              },
            ),
          ],
          backgroundColor: Colors.transparent,
          elevation: 0,
          titleTextStyle: const TextStyle(
            color: Color.fromARGB(255, 45, 47, 48),
            fontSize: 30,
            height: 3,
            fontWeight: FontWeight.bold,
            fontFamily: "Courier New",
          ),
          title: Text(
            "Login",
            style: TextStyle(color: Colors.amber),
          ),
        ),
        backgroundColor: Colors.transparent,
        body: Stack(
          children: [
            Container(
              margin: EdgeInsets.fromLTRB(20, 50, 20, 100),
              alignment: Alignment.topCenter,
              padding: const EdgeInsets.all(20),
              child: const Text(
                "",
                style: TextStyle(
                  color: Color.fromARGB(255, 0, 153, 255),
                  fontSize: 30,
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(10, 200, 10, 0),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    TextField(
                      controller: emailControler,
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
                      controller: passwordControler,
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
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        OutlinedButton(
                          style: ButtonStyle(
                            side: MaterialStatePropertyAll(
                              BorderSide(color: Colors.amber),
                            ),
                          ),
                          onPressed: () async {
                            try {
                              var result = await AuthService().login(
                                  emailControler.text, passwordControler.text);

                              if (result != null) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                      content: Text(
                                        "Login successfull",
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 15,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      backgroundColor: Colors.green),
                                );
                                await Future.delayed(Duration(seconds: 2));
                                Navigator.pushReplacementNamed(context, "home");
                              }
                            } catch (e) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                    content: Text(
                                      "email or passwor is wrong. Please check and try again",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 15,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    backgroundColor:
                                        Color.fromARGB(255, 247, 4, 0)),
                              );
                            }
                          },
                          child: Text("Signin"),
                        ),
                        TextButton(
                          onPressed: () {},
                          child: Text(
                            "Forgot Password ?",
                            style:
                                TextStyle(decoration: TextDecoration.underline),
                          ),
                        ),
                      ],
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.pushNamed(context, "signin");
                      },
                      child: Text(
                        "Dont have an account? Create an Account!",
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
