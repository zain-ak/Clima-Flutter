import 'package:clima/screens/city_screen.dart';
import 'package:clima/services/Weather.dart';
import 'package:flutter/material.dart';
import 'package:clima/utilities/constants.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class LocationScreen extends StatefulWidget {
  LocationScreen({this.data});
  final data;

  @override
  _LocationScreenState createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {
  int temperature;
  int condition;
  String cityName;

  @override
  void initState() {
    super.initState();
    updateUI(widget.data);
  }

  errorDialog(BuildContext context) {
    showDialog(context: context,
        builder: (context) {
          return AlertDialog(
            title: Text('Error fetching data', style: TextStyle(color: Colors.red[900]),),
            content: Text('There was a problem getting weather data, this could be for any'
                'reason, please try again later.'),
            actions: <Widget>[
              FlatButton(
                child: Text('Sob'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              )
            ],
          );
        });
  }

  void updateUI(dynamic data) {
    setState(() {
      temperature = (data['main']['temp'] - 273.1).toInt();
      condition = data['weather'][0]['id'];
      cityName = data['name'];
    });
  }

  @override
  Widget build(BuildContext context) {
    bool _isVisible = false;
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
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  FlatButton(
                    onPressed: () async {
                      var data = await WeatherModel.getLocationWeather();
                      setState(()  {
                        if (data == null) {
                          errorDialog(context);
                        } else {
                          _isVisible = !_isVisible;
                          print(_isVisible);
                          updateUI(data);
                          _isVisible = !_isVisible;
                          print(_isVisible);
                        }
                      });
                    },
                    child: Icon(
                      Icons.near_me,
                      size: 50.0,
                    ),
                  ),
                  FlatButton(
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) {
                        return CityScreen();
                      }));
                    },
                    child: Icon(
                      Icons.location_city,
                      size: 50.0,
                    ),
                  ),
                ],
              ),
              Visibility(
                visible: _isVisible,
                child: SpinKitCubeGrid(
                  color: Colors.white,
                  size: 50.0,
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 15.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      '$temperatureºC',
                      style: kTempTextStyle,
                    ),
                    Text(
                      WeatherModel.getWeatherIcon(condition),
                      style: kConditionTextStyle,
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(bottom: 25.0, right: 15.0, left: 15.0),
                child: Text(
                  WeatherModel.getMessage(temperature) + ' in $cityName',
                  textAlign: TextAlign.right,
                  style: kMessageTextStyle,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
