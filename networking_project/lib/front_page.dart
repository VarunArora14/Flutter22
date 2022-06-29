import 'dart:ui';

import 'package:flutter/material.dart';

class FrontPage extends StatefulWidget {
  const FrontPage({Key? key}) : super(key: key);

  @override
  State<FrontPage> createState() => _FrontPageState();
}

class _FrontPageState extends State<FrontPage> {
  int _counter = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Front Page"),
        backgroundColor: Colors.cyan[400],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            "Hello World",
            style: TextStyle(color: Colors.amber[800], fontSize: 25.0),
          ),
          const SizedBox(
            height: 50,
          ),
          InkWell(
            child: Container(
              color: Colors.blue[400],
              margin: EdgeInsets.all(20),
              padding: EdgeInsets.all(20),
              child: Text("Press this button to increase counter $_counter"),
            ),
            onTap: () {
              setState(() {
                _counter++;
              });
            },
          )
        ],
      ),
    );
  }
}
