import 'package:climate/screens/location_screen.dart';
import 'package:climate/services/location.dart';
import 'package:flutter/material.dart';
import 'package:location/location.dart';
import 'package:location_platform_interface/location_platform_interface.dart';
import 'package:permission_handler_platform_interface/permission_handler_platform_interface.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:http/http.dart';
import 'package:weather/weather.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class LoadingScreen extends StatefulWidget {


  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  @override
  void initState() {
    super.initState();
    getData();
    print('this line of code is triggered');

  }


  Future<void> getData() async {
    Location1 location = Location1();
    double latitude = location.latitude;
    double longitude = location.longitude;
    String apikey = "cd8ede1a8d9bc742dfe566e39051c5dc";

    WeatherFactory wf = new WeatherFactory("$apikey");
    Weather w =  await wf.currentWeatherByLocation(latitude, longitude);
    var weatherData = w.toJson();
    Navigator.push(context, MaterialPageRoute(builder: (context){
      return LocationScreen(locationWeather: weatherData,);
    }));



  }

  @override
  Widget build(BuildContext context) {
    String myMargin = '15';
    getData();
    return Scaffold(
      body: Center(
        child: SpinKitDoubleBounce(
          color: Colors.white,
          size: 100.0,
        ),
      ),
    );
  }
}
