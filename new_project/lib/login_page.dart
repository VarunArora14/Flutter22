import 'package:flutter/material.dart';

class Login extends StatelessWidget {
  const Login({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
      home: DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: AppBar(
            title: const Text("Tab Testing"),
            bottom: const TabBar(
              tabs: [
                Tab(
                  icon: Icon(Icons.directions_car),
                ),
                Tab(
                  icon: Icon(Icons.directions_transit),
                ),
                Tab(
                  icon: Icon(Icons.directions_bike),
                ),
              ],
              indicatorColor: Colors.amber,
              indicatorSize: TabBarIndicatorSize.label,
              unselectedLabelColor: Colors.cyan,
            ),
            // bottom: ,
          ),
          body: const TabBarView(
            children: [
              Icon(Icons.directions_car),
              Icon(Icons.directions_transit),
              Icon(Icons.directions_bike),
            ],
          ),
          // flutter error is thrown if number of tabs in TabBAr and tabbarview items do not match the length
        ),
      ),
    );
  }
}
