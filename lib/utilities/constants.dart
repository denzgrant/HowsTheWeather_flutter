import 'package:flutter/material.dart';

const kTempTextStyle = TextStyle(
  fontFamily: 'Spartan MB',
  fontSize: 40.0,
);

const kTempIconStyle = TextStyle(
  fontFamily: 'Spartan MB',
  fontSize: 75.0,
  color: Colors.white,
  fontWeight: FontWeight.w900,
  shadows: <Shadow>[
    Shadow(
      offset: Offset(10.0, 10.0),
      blurRadius: 7.0,
      color: Color.fromARGB(255, 0, 0, 0),
    ),
  ],
);

const kMessageTextStyle = TextStyle(
  fontFamily: 'AmaticSC',
  fontSize: 50.0,
  fontWeight: FontWeight.w900,
  shadows: <Shadow>[
    Shadow(
      offset: Offset(20.0, 20.0),
      blurRadius: 8.0,
      color: Color.fromARGB(255, 0, 0, 0),
    ),
  ],
);

const kOtherTemps = TextStyle(
  fontSize: 18.0,
  color: Colors.yellowAccent,
  fontWeight: FontWeight.w400,
  letterSpacing: 1.0,
  shadows: <Shadow>[
    Shadow(
      offset: Offset(3.0, 3.0),
      blurRadius: 4.0,
      color: Color.fromARGB(255, 0, 0, 0),
    ),
  ],
);

const kButtonTextStyle = TextStyle(
  fontSize: 40.0,
  fontFamily: 'Spartan MB',
  color: Colors.yellowAccent,
  fontWeight: FontWeight.w800,
);

const kConditionTextStyle = TextStyle(
  fontSize: 50.0,
);

const kTextFieldInputDecoration = InputDecoration(
  filled: true,
  fillColor: Colors.white70,
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
