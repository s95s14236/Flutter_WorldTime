import 'package:http/http.dart';
import 'package:intl/intl.dart';
import 'dart:convert';

class WorldTime {
  String location; // location name for the UI
  String time; // the time in taht location
  String flag; // url to an assert flag icon
  String url; //location url for api endpoint
  bool isDaytime; //true or false if daytime or not
  
  WorldTime({this.location, this.flag, this.url});

  Future<void> getTime() async {

    try {

      //make a Request
    Response response = await get(
        'http://api.timezonedb.com/v2.1/get-time-zone?key=ZSJXFGDG9NY3&format=json&by=zone&zone=$url');
    Map data = jsonDecode(response.body);

    //將xml格式轉為json
    /*Xml2Json xml2json = new Xml2Json();
    String data = xml.parse(response.body).toString();
    xml2json.parse(data);
    String json = xml2json.toParker();
    */

    //get time property from data
    String timedata = data['formatted'];

    //create datatime object
    DateTime now = DateTime.parse(timedata);

    // set the time property
    //time = now.toString();
    isDaytime = now.hour > 6 && now.hour < 18 ? true : false;
    time = DateFormat.Md().add_jm().format(now);


    }
    catch (e) {
      print('caught error: $e');
      time = 'could not get time data';
    }

    
  }
}
