import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_config/flutter_config.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:http/http.dart' as http;
import 'package:labtask/pages/errorlocationpage.dart';
import 'package:labtask/pages/forecastpage.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<String> fetch(String request) async {
  final response = await http.get(Uri.parse(request));
  return (response.statusCode == 200) ? response.body : 'null';
}

void myApp() async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  prefs.setString('lastLocation', '42.3478, -71.0466');
  LocationPermission permission = await Geolocator.checkPermission();
  String? loc = await getCurrentLocation(permission);
  if (permission == LocationPermission.denied) {
    permission = await Geolocator.requestPermission();
  }
  print(loc);
  print(permission);
  if (loc == null || permission == LocationPermission.denied) {
    runApp(
      MaterialApp(home: ErrorLocationPage()),
    );
  } else {
    await initApp(prefs, loc);
    runApp(
      MaterialApp(home: ForecastPage(prefs)),
    );
  }
}

Future<void> initApp(SharedPreferences prefs, String? location) async {
  final String lastDate = prefs.getString('lastDate') ?? '1970-01-01T00:00:00Z';
  final String lastloc = prefs.getString('lastLocation')!;
  final String loc = location ?? lastloc;
  List<Placemark> placemarks = await placemarkFromCoordinates(
      double.parse(loc.split(', ')[0]), double.parse(loc.split(', ')[1]));
  prefs.setString('district',
      '${placemarks[0].locality ?? 'Неизвестно'}, ${placemarks[0].country ?? ''}');
  if (DateTime.now().difference(DateTime.parse(lastDate)).inHours.abs() >= 1 ||
      Geolocator.distanceBetween(
              double.parse(loc.split(', ')[0]),
              double.parse(loc.split(', ')[1]),
              double.parse(lastloc.split(', ')[0]),
              double.parse(lastloc.split(', ')[1])) >=
          10000) {
    final apikey = await FlutterConfig.get('APIKEY');
    final response = await fetch(
        'https://api.tomorrow.io/v4/weather/forecast?location=$loc&apikey=$apikey');
    prefs.setString(
        'hourly', jsonEncode(jsonDecode(response)['timelines']['hourly']));
    prefs.setString(
        'daily', jsonEncode(jsonDecode(response)['timelines']['daily']));
    prefs.setString('lastDate', DateTime.now().toString());
  }
}

Future<String?> getCurrentLocation(LocationPermission permission) async {
  final String? actualLocation;
  if (permission == LocationPermission.denied) {
    permission = await Geolocator.requestPermission();
    if (permission == LocationPermission.denied) {
      final Position? currentLocation = await Geolocator.getLastKnownPosition();
      actualLocation = (currentLocation == null)
          ? null
          : "${currentLocation.latitude}, ${currentLocation.longitude}";
    } else {
      final Position currentLocation = await Geolocator.getCurrentPosition();
      actualLocation =
          "${currentLocation.latitude}, ${currentLocation.longitude}";
    }
  } else {
    final Position currentLocation = await Geolocator.getCurrentPosition();
    actualLocation =
        "${currentLocation.latitude}, ${currentLocation.longitude}";
  }
  return actualLocation;
}
