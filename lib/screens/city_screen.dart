import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:clima/utilities/constants.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';

class CityScreen extends StatefulWidget {
  @override
  _CityScreenState createState() => _CityScreenState();
}

class _CityScreenState extends State<CityScreen> {
  List<String> cities = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    //cities = loadCities();
  }

  Future<List<String>> loadCities() async {
    //await jsonDecode(DefaultAssetBundle.of(context).loadString("assets/data.json"))
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('images/city_background.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        constraints: BoxConstraints.expand(),
        child: SafeArea(
          child: Column(
            children: <Widget>[
              Align(
                alignment: Alignment.topLeft,
                child: FlatButton(
                  onPressed: () {},
                  child: Icon(
                    Icons.arrow_back_ios,
                    size: 50.0,
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.all(20.0),
                child: TypeAheadField(
                  textFieldConfiguration: TextFieldConfiguration(
                    style: TextStyle(
                        color: Colors.black
                    ),
                    decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.white,
                        icon: Icon(
                            Icons.location_city,
                            color: Colors.white
                        ),
                        hintText: 'Enter city name...',
                        hintStyle: TextStyle(
                            color: Colors.blueGrey[700]
                        ),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(10.0)),
                            borderSide: BorderSide.none
                        )
                    ),
                  ),
                ),
              ),
              FlatButton(
                onPressed: () {},
                child: Text(
                  'Get Weather',
                  style: kButtonTextStyle,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
