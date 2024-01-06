import 'package:flutter/material.dart';
import 'package:timer_package/screens/current_time.dart';
import 'package:timer_package/screens/timer.dart';


void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Timer',
      home: DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.indigo,
            bottom: const TabBar(
              tabs: [
                Tab(icon: Icon(Icons.watch_later), text: "Часы"),
                Tab(icon: Icon(Icons.timer), text: "Таймер"),
              ],
            ),
          ),
          body: const TabBarView(
            children: [
              MyHomePage(),
              PieWidget(),
            ],
          ),
        ),
      ),
    );
  }
}

