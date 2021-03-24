import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:timer_builder/timer_builder.dart';
import 'package:flutter_analog_clock/flutter_analog_clock.dart';

var now = new DateTime.now();
var formatter = new DateFormat.yMMMMd('en_US');

class CurrentDate extends StatefulWidget {
  @override
  _CurrentDateState createState() => _CurrentDateState();
}

class _CurrentDateState extends State<CurrentDate> {
  String formattedDate = formatter.format(now);

  @override
  Widget build(BuildContext context) {
    //updates every second
    return TimerBuilder.periodic(Duration(seconds: 1), builder: (context) {
      return Container(
        padding: EdgeInsets.only(bottom: 10),
        alignment: Alignment.centerRight,
        child: Column(
          children: [
            Text(
              "$formattedDate",
              style: TextStyle(
                fontSize: 18,
                color: Colors.white60,
              ),
            ),
          ],
        ),
      );
    });
  }
}

class ClockWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FlutterAnalogClock(
      dateTime: DateTime.now(),
      dialPlateColor: Colors.cyan[100],
      hourHandColor: Colors.grey,
      minuteHandColor: Colors.grey,
      secondHandColor: Colors.white,
      numberColor: Colors.grey,
      borderColor: Colors.cyan[100],
      tickColor: Colors.black,
      centerPointColor: Colors.black,
      showTicks: true,
      showMinuteHand: true,
      showSecondHand: true,
      showNumber: true,
      hourNumberScale: .10,
      hourNumbers: [
        'I',
        'II',
        'III',
        'IV',
        'V',
        'VI',
        'VII',
        'VIII',
        'IX',
        'X',
        'XI',
        'XII'
      ],
      isLive: true,
      width: 125.0,
      height: 125.0,
      decoration: const BoxDecoration(),
    );
  }
}
