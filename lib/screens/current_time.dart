import 'dart:async';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:intl/date_symbol_data_local.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late DateFormat _dateFormat;
  late DateFormat _timeFormat;
  late Timer timer;
  int _start = 1;

  @override
  Widget build(BuildContext context) {
    var dateTime = DateTime.now();
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        padding: const EdgeInsets.symmetric(vertical: 60, horizontal: 70),
        child: Column(
          children: <Widget>[
            const Text(
              'Tекущее время',
              style: TextStyle(fontSize: 28),
            ),
            Text(
              _timeFormat.format(dateTime),
              style: const TextStyle(fontSize: 50),
            ),
            Text(
              _dateFormat.format(dateTime),
              style: const TextStyle(fontSize: 18),
            ),
            const SizedBox(
              height: 50,
            ),
            Image.network(
              'https://www.pngarts.com/files/10/Vector-Clock-PNG-Pic.png',
              height: 220,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.indigo,
        onPressed: startTimer,
        tooltip: 'Refresh',
        child: const Icon(Icons.refresh),
      ),
    );
  }

  void _setLocale(String locale) {
    _dateFormat = DateFormat.yMMMMEEEEd(locale);
    _timeFormat = DateFormat.Hms(locale);
  }

  void startTimer() {
    const oneSec = Duration(seconds: 1);
    timer = Timer.periodic(oneSec, (Timer timer) {
      if (_start == 0) {
        setState(() {});
      } else {
        setState(() {
          _start++;
        });
      }
    });
  }

  @override
  void initState() {
    super.initState();
    initializeDateFormatting();
    _setLocale('ru');
  }
}
