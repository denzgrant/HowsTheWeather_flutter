import 'package:flutter/material.dart';
import 'location_screen.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:HowsTheWeather/services/weather.dart';

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
    getLocationData();
  }

  void getLocationData() async {
    var weatherData = await WeatherModel().getLocationWeather();

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) {
          return LocationScreen(
            locationWeather: weatherData, //passing to location_screen.dart
          );
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    getLocationData();
    return Scaffold(
      body: Center(
        child: SpinKitFadingCircle(
          color: Colors.white,
          size: 100.0,
        ),
      ),
    );
  }
}
