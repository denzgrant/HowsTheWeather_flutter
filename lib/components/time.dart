import 'package:flutter/material.dart';
import 'dart:async';

class CurrentTime extends StatefulWidget {
  @override
  _CurrentTimeState createState() => _CurrentTimeState();
}

class _CurrentTimeState extends State<CurrentTime> {
  dynamic currentHour = DateTime.now().hour;
  dynamic currentMin = DateTime.now().minute;
  dynamic currentSec = DateTime.now().second;
  Timer _everySecond;
  //Change font
  //Change Time

  @override
  void initState() {
    super.initState();
    // _everySecond = Timer.periodic(Duration(seconds: 1), (timer) {
    //   setState(() {
    //     currentHour = DateTime.now().hour;
    //     currentMin = DateTime.now().minute;
    //     currentSec = DateTime.now().second;
    //   });
    // });
  }

  @override
  Widget build(BuildContext context) {
    //updates every second
    return Column(
      children: [
        Container(
          padding: EdgeInsets.all(10),
          alignment: Alignment.centerRight,
          child: Column(
            children: [
              Text(
                "HOUR: $currentHour",
                style: TextStyle(
                  fontSize: 10,
                ),
              ),
              Text(
                "minute: $currentMin",
                style: TextStyle(
                  fontSize: 10,
                ),
              ),
              Text(
                "second: $currentSec",
                style: TextStyle(
                  fontSize: 10,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
