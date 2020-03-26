import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Map data = {};

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    // 若為一開始進入app則顯示loading page的台北，若選擇後進入則直接更新上面 assign 的 data
    data = data.isEmpty ? ModalRoute.of(context).settings.arguments : data; //從loading page 獲取map(3個參數)作為一開始呈現的page
    print(data);

    // set background
    String bgImage = data['isDaytime'] ? 'day.jpg' : 'night.jpg';
    Color bgColor = data['isDaytime'] ? Colors.brown[50] : Colors.blueGrey[900];
    Color fontColor = data['isDaytime'] ? Colors.blueGrey[900] : Colors.grey[100];

    return Scaffold(
      backgroundColor: bgColor,
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(
            // BoxDecoration 可以在 Container裡面
            image: DecorationImage(
              image: AssetImage('assets/$bgImage'),
              fit: BoxFit.cover, //用來包覆整個container
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(0, 100.0, 0, 0),
            child: Column(
              children: <Widget>[
                FlatButton.icon(
                  color: Colors.teal[400],
                  onPressed: () async {
                    // 非同步取得location頁面選取的資料，並回傳到result
                    dynamic result = await Navigator.pushNamed(context, '/location');
                    setState(() {
                      // 將result資料替原本的顯示的「data」更新 
                      data = {
                        'time': result['time'],
                        'location': result['location'],
                        'isDaytime': result['isDaytime'],
                        'flag': result['flag'],
                      };
                    });
                  },
                  icon: Icon(
                    Icons.edit_location,
                    color: fontColor,
                  ),
                  label: Text(
                    'Edit Location',
                    style: TextStyle(
                      fontSize: 20.0,
                      letterSpacing: 2.0,
                      color: fontColor,
                    ),
                  ),
                ),
                SizedBox(height: 30.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      data['location'],
                      style: TextStyle(
                        fontSize: 30.0,
                        letterSpacing: 2.0,
                        color: fontColor,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 40.0),
                Text(
                  data['time'].substring(0, 4),
                  style: TextStyle(
                    fontSize: 48.0,
                    color: fontColor,
                  ),
                ),
                SizedBox(height: 20.0),
                Text(
                  data['time'].substring(5, ),
                  style: TextStyle(
                    fontSize: 50.0,
                    color: fontColor,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
