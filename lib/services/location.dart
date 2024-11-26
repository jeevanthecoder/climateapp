import 'package:flutter/material.dart';
import 'package:location/location.dart';
import 'package:location_platform_interface/location_platform_interface.dart';
import 'package:permission_handler_platform_interface/permission_handler_platform_interface.dart';
import 'package:permission_handler/permission_handler.dart';

class Location1{
  late double latitude=0,longitude=0;
  Future<void> getCurrentLocation() async {
    Location location = new Location();

    bool _serviceEnabled;
    // PermissionStatus _permissionGranted;
    LocationData _locationData;

    _serviceEnabled = await location.serviceEnabled();
    if (!_serviceEnabled) {
      _serviceEnabled = await location.requestService();
      if (!_serviceEnabled) {
        return;
      }
    }

    if (await location.hasPermission() == Permission.location.isDenied) {
    if (await location.requestPermission() != Permission.location.isGranted) {
    return;
    }
    }

    _locationData = await location.getLocation();

    latitude=_locationData.latitude!.toDouble();
    longitude=_locationData.longitude!.toDouble();

  }
}