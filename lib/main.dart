import 'package:flutter/material.dart';
import 'world_time_page/home.dart';
import 'world_time_page/choose_location.dart';
import 'world_time_page/loading.dart';

void main() => runApp(WorldTime());

class WorldTime extends StatefulWidget {
  @override
  _WorldTimeState createState() => _WorldTimeState();
}

class _WorldTimeState extends State<WorldTime> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => Loading(),
        '/home': (context) => Home(),
        '/location': (context) => ChooseLocation(),
      },
    );
  }
}