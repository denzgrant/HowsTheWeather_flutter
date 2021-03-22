import 'package:flutter/material.dart';

const kTempTextStyle = TextStyle(
  fontFamily: 'Spartan MB',
  fontSize: 50.0,
);

const kMessageTextStyle = TextStyle(
  fontFamily: 'RaleWay',
  fontSize: 30.0,
);

const kButtonTextStyle = TextStyle(
  fontSize: 40.0,
  fontFamily: 'Spartan MB',
  color: Colors.white,
  fontWeight: FontWeight.w800,
);

const kConditionTextStyle = TextStyle(
  fontSize: 50.0,
);

const kTextFieldInputDecoration = InputDecoration(
  filled: true,
  fillColor: Colors.white70,
  icon: Icon(
    Icons.location_city_rounded,
    color: Colors.white70,
  ),
  hintText: "Enter City Name",
  hintStyle: TextStyle(
    color: Colors.black54,
  ),
  border: OutlineInputBorder(
    borderRadius: BorderRadius.all(
      Radius.circular(10.0),
    ),
    borderSide: BorderSide.none,
  ),
);
