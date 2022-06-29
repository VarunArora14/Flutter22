// import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:new_project/form_page.dart';
import 'package:new_project/login_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Test',
      theme: ThemeData.dark(),
      // home: const MyHomePage(title: 'Testing Flutter'),
      // home: const MyHomePage(title: 'Flutter Test'),
      home: const FormPage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final snack = SnackBar(
    behavior: SnackBarBehavior.floating,
    margin: const EdgeInsets.all(10),
    backgroundColor: const Color.fromARGB(255, 111, 204, 216),
    content: const Text(
      'This a snackbar',
    ),
    action: SnackBarAction(
      label: 'Undo',
      textColor: Colors.blueGrey[600],
      onPressed: () {
        // some code to change
      },
    ),
    duration: const Duration(seconds: 2),
  );
  // define a snackbar using final Snackbar name outside and call it using ScaffoldMessenger in onpressed
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Center(
              child: Text('Hello World'),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: Colors.cyan,
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const Login(),
                  ),
                );
                // ScaffoldMessenger.of(context).showSnackBar(snack);
                // anything defined above @override has to be used with widget.name
                // The above function calls snackbar
              },
              child: const Text(
                'Click for Login Page',
                style: TextStyle(color: Colors.black),
              ),
            ),
          ],
        ),

        drawer: Drawer(
          child: ListView(
            // padding: , // consider making padding as 0
            padding: const EdgeInsets.all(0),
            children: [
              const UserAccountsDrawerHeader(
                  margin: EdgeInsets.symmetric(horizontal: 7),
                  decoration: BoxDecoration(
                    border: Border(
                      bottom: BorderSide(
                        color: Colors.cyan,
                        width: 2,
                      ),
                    ),
                  ),
                  currentAccountPicture: CircleAvatar(
                    // have to use image provider here which is Networkimage()
                    backgroundImage:
                        NetworkImage('https://picsum.photos/250?image=9'),
                  ),
                  accountName: Text("Varun Arora"),
                  accountEmail: Text("Varunarora1408@gmail.com")),
              ListTile(
                title: const Text("Item 1"),
                onTap: () {
                  // do something here
                  Navigator.pop(context);
                },
              ),
              ListTile(
                title: const Text("Item 3"),
                onTap: () {
                  // do something here
                  Navigator.pop(context);
                },
              ),
            ],
          ),
        ), // This trailing comma makes auto-formatting nicer for build methods.
      ),
    );
  }
}
