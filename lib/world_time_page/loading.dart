//import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
//import 'package:http/http.dart';
import 'package:flutter_worldtime/world_time_page/services/world_time.dart';
//import 'package:xml/xml.dart' as xml;
//import 'package:xml2json/xml2json.dart';

class Loading extends StatefulWidget {
  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  String time = 'loading';

  void setupWorldTime() async {
    WorldTime instance = WorldTime(location: 'Taipei', flag: 'taipei.png', url: 'Asia/Taipei');
    await instance.getTime();
    Navigator.pushReplacementNamed(context, '/home', arguments: {
      'location': instance.location,
      'flag': instance.flag,
      'time': instance.time,
      'isDaytime': instance.isDaytime,
    }); // arguments 傳遞參數(可以是map,string,int)給 home page 使用
  }

  @override
  void initState() {
    super.initState();
    setupWorldTime();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.teal[400],
      body: Center(
        child: SpinKitFadingCircle(
          color: Colors.white,
          size: 60.0,
        ),
      ),
    );
  }
}
