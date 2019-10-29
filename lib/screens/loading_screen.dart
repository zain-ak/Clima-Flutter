import 'dart:convert';

import 'package:clima/services/Location.dart';
import 'package:clima/services/Networking.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:http/http.dart';

const String apiKey = 'cd4625f5470757c68382b537fb253c44';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  Location location;

  @override
  void initState() {
    super.initState();
    getLocationData();
  }

  void getLocationData() async {
    location = new Location();
    await location.getLocation();
    NetworkHelper networkHelper = NetworkHelper('https://api.openweathermap.org/data/2.5/weather?'
    'lat=${location.lat}&lon=${location.long}&appid=$apiKey');

    var weatherData = await networkHelper.getData();
    print(weatherData['name']);
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Row(
          children: <Widget>[
            RaisedButton(
              onPressed: () {},
              child: Text('Get Location'),
            )
          ],
        ),

      ),
    );
  }
}
