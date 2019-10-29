import 'package:clima/services/location.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  Location location;

  @override
  void initState() {
    super.initState();
    getLocation();
  }

  void getLocation() async {
    location = new Location();
    await location.getLocation();
    print(location.long);
    print(location.lat);
  }

  @override
  Widget build(BuildContext context) {
    Future<Position> location;
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
