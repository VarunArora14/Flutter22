import 'package:flutter/material.dart';
import 'package:networking_project/front_page.dart';
import 'networking.dart';
import 'package:networking_project/themes/theme_constant.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Networking in Flutter',
      theme: darkTheme,
      initialRoute: "/",
      routes: {
        "/": (context) => const ParseData(),
        "/front": (context) => const FrontPage()
      },
    );
  }
}
