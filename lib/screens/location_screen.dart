import 'package:HowsTheWeather/components/time.dart';
import 'package:flutter/material.dart';
import 'package:HowsTheWeather/utilities/constants.dart';
import 'package:HowsTheWeather/services/weather.dart';
import 'city_screen.dart';

class LocationScreen extends StatefulWidget {
  LocationScreen({this.locationWeather});
  final locationWeather;

  @override
  _LocationScreenState createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {
  WeatherModel weather = WeatherModel();

  int temperature;
  int feelsLikeTemp;
  int tempMin;
  int tempMax;
  String weatherIcon;
  String cityName;
  String weatherDescrip;
  String weatherMessage;
  String country;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    updateUI(widget.locationWeather);
  }

  void updateUI(dynamic weatherData) {
    setState(() {
      if (weatherData == null) {
        temperature = 0;
        feelsLikeTemp = 0;
        tempMin = 0;
        tempMax = 0;
        weatherIcon = "Error";
        weatherDescrip = ":/";
        weatherMessage = "Unable to get weather data, check location settings";
        cityName = '';
        country = '';
        return;
      }
      dynamic temp = weatherData['main']['temp'];
      temperature = temp.toInt();

      dynamic feelTemp = weatherData['main']['feels_like'];
      feelsLikeTemp = feelTemp.toInt();

      dynamic minTemp = weatherData['main']['temp_min'];
      tempMin = minTemp.toInt();

      dynamic maxTemp = weatherData['main']['temp_max'];
      tempMax = maxTemp.toInt();

      weatherDescrip = weatherData['weather'][0]['description'];
      var condition = weatherData['weather'][0]['id'];
      weatherIcon = weather.getWeatherIcon(condition);
      weatherMessage = weather.getMessage(temperature);
      country = weatherData['sys']['country'];
      cityName = weatherData['name'];
      print(temperature);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('images/location_background.jpg'),
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(
                Colors.white.withOpacity(0.8), BlendMode.dstATop),
          ),
        ),
        constraints: BoxConstraints.expand(),
        child: SafeArea(
          child: Column(
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  FlatButton(
                    onPressed: () async {
                      var weatherData = await weather.getLocationWeather();
                      updateUI(weatherData);
                    },
                    child: Icon(
                      Icons.near_me,
                      size: 40.0,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: CurrentDate(),
                  ),
                  FlatButton(
                    onPressed: () async {
                      var typedName = await Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            return CityScreen(); //passing to location_screen.dart
                          },
                        ),
                      );
                      if (typedName != null) {
                        var weatherData =
                            await weather.getCityWeather(typedName);
                        updateUI(weatherData);
                      }
                    },
                    child: Icon(
                      Icons.location_city,
                      size: 40.0,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 70,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Text(
                      '$temperature°',
                      style: kTempIconStyle,
                    ),
                    Text(
                      weatherIcon,
                      style: kConditionTextStyle,
                    ),
                    SizedBox(
                      width: 35,
                    ),
                    ClockWidget(),
                  ],
                ),
              ),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 13.0),
                    child: SizedBox(
                        height: 30,
                        child: Text.rich(
                          TextSpan(
                            text: 'Feels like ',
                            style: kOtherTemps, // default text style
                            children: <TextSpan>[
                              TextSpan(
                                  text: '$feelsLikeTemp°',
                                  style:
                                      TextStyle(fontWeight: FontWeight.w900)),
                            ],
                          ),
                        )),
                  ),
                ],
              ),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 13.0),
                    child: SizedBox(
                        height: 30,
                        child: Text.rich(
                          TextSpan(
                            text: 'Min: ',
                            style: kOtherTemps, // default text style
                            children: <TextSpan>[
                              TextSpan(
                                  text: '$tempMin°',
                                  style:
                                      TextStyle(fontWeight: FontWeight.bold)),
                            ],
                          ),
                        )),
                  ),
                ],
              ),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 13.0),
                    child: SizedBox(
                        height: 30,
                        child: Text.rich(
                          TextSpan(
                            text: 'Max: ',
                            style: kOtherTemps, // default text style
                            children: <TextSpan>[
                              TextSpan(
                                  text: '$tempMax°',
                                  style:
                                      TextStyle(fontWeight: FontWeight.bold)),
                            ],
                          ),
                        )),
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 35.0),
                child: Row(
                  children: [
                    Text(
                      "$weatherDescrip",
                      style: kMessageTextStyle,
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 25,
              ),
              Text(
                "$weatherMessage in $cityName, $country!",
                textAlign: TextAlign.center,
                style: kMessageTextStyle,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
