import 'package:flutter/material.dart';
import 'package:flutter_worldtime/world_time_page/services/world_time.dart';

class ChooseLocation extends StatefulWidget {
  @override
  _ChooseLocationState createState() => _ChooseLocationState();
}

class _ChooseLocationState extends State<ChooseLocation> {
  List<WorldTime> locations = [
    WorldTime(url: 'Asia/Taipei', location: 'Taiwan', flag: 'tw.png'),
    WorldTime(url: 'Asia/Tokyo', location: 'Tokyo', flag: 'jp.png'),
    WorldTime(url: 'Asia/Seoul', location: 'Seoul', flag: 'kr.png'),
    WorldTime(url: 'Europe/London', location: 'London', flag: 'gb.png'),
    WorldTime(url: 'Europe/Berlin', location: 'Berlin', flag: 'de.png'),
    WorldTime(url: 'Africa/Cairo', location: 'Cairo', flag: 'eg.png'),
    WorldTime(url: 'Africa/Nairobi', location: 'Nairobi', flag: 'ke.png'),
    WorldTime(url: 'America/Chicago', location: 'Chicago', flag: 'us.png'),
    WorldTime(url: 'America/New_York', location: 'New York', flag: 'us.png'),
  ];

  void updateTime(index) async {
    WorldTime instance = locations[index];
    await instance.getTime();
    // navigate to home screen
    Navigator.pop(context, {
      // pop page 直接回傳data
      'location': instance.location,
      'flag': instance.flag,
      'time': instance.time,
      'isDaytime': instance.isDaytime,
    });
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        backgroundColor: Colors.teal[400],
        title: Text('Choose Location'),
        centerTitle: true,
        elevation: 0.0,
      ),
      body: ListView.builder(
        // ListView: 小量的自定義List, ListView.build: 簡單創建的大量List(動態撞見)
        itemCount: locations.length,
        itemExtent: 75.0,
        itemBuilder: (context, index) {
          return Card(
            margin: EdgeInsets.symmetric(vertical: 5.0, horizontal: 6.0),
            child: Padding(
              padding: const EdgeInsets.all(5.0),
              child: ListTile(
                // icon + text 的列表
                onTap: () {
                  updateTime(index);
                },
                title: Text(
                  locations[index].location,
                  style: TextStyle(
                    fontSize: 20.0,
                  ),
                ),
                leading: CircleAvatar(
                  backgroundImage: AssetImage(
                      'icons/flags/png/${locations[index].flag}',
                      package: 'country_icons'),
                  radius: 30.0,
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
