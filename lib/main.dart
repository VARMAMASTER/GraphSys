import 'package:flutter/material.dart';
import "package:firebase_core/firebase_core.dart";
import "./screens/splash_screen.dart";
import "./screens/login.dart";
import "./screens/signup.dart";
import "./screens/homePage.dart";
import "./draw_pages/SSmachine.dart";
import "./draw_pages/about_app.dart";
import "./draw_pages/fsm.dart";

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: "splashScreen",
      routes: {
        "splashScreen": (context) => const Splashscreen(),
        "login": (context) => Login(),
        "signin": (context) => Signup(),
        "Fsm": (context) => Fsm(),
        "home": (context) => const home(),
        "SSm": (context) => SmartShearingMachine(),
        "about_app": (context) => about_app(),
      },
      home: home(),
    );
  }
}
