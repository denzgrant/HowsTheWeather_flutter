import 'package:flutter/material.dart';
import 'package:HowsTheWeather/services/location.dart';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  @override
  //only gets called once
  void initState() {
    // TODO: implement initState
    super.initState();
    getLocation();
  }

  void getLocation() async {
    //Call the class
    Location location = Location();
    //use the method
    await location.getCurrentLocation();
    print(location.longitude);
    print(location.latitude);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}
