import 'dart:convert';
import 'package:geolocator/geolocator.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:flutter_config/flutter_config.dart';
import 'package:labtask/pages/forecastpage.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await FlutterConfig.loadEnvVariables();
  myApp();
}

Future<String> fetch(String request) async {
  final response = await http.get(Uri.parse(request));
  return response.body;
}

void myApp() async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  await initApp(prefs);
  runApp(
    MaterialApp(home: ForecastPage(prefs)),
  );
}

Future<void> initApp(SharedPreferences prefs) async {
  final String lastDate = prefs.getString('lastDate') ?? '1970-01-01T00:00:00Z';
  prefs.setString('district', "NEWYORK, 不忍通り, 千駄木三丁目, 文京区, 東京都, 113-0022, 日本");
  if (DateTime.now().difference(DateTime.parse(lastDate)).inHours.abs() >= 1) {
    final apikey = await FlutterConfig.get('APIKEY');
    final loc = await getLocation();
    final response = await fetch(
        'https://api.tomorrow.io/v4/weather/forecast?location=$loc&apikey=$apikey');
    prefs.setString(
        'hourly', jsonEncode(jsonDecode(response)['timelines']['hourly']));
    prefs.setString(
        'daily', jsonEncode(jsonDecode(response)['timelines']['daily']));
    prefs.setString('lastDate', DateTime.now().toString());
    prefs.setString(
        'district', jsonEncode(jsonDecode(response)['location']["name"]));
  }
}

Future<String> getLocation() async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  String actualLocation;
  LocationPermission permission = await Geolocator.checkPermission();
  if (permission == LocationPermission.denied) {
    permission = await Geolocator.requestPermission();
    if (permission == LocationPermission.denied) {
      final String lastLocation =
          prefs.getString('lastLocation') ?? '37.817810, -122.478234';
      actualLocation = lastLocation;
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
  prefs.setString('lastLocation', actualLocation);
  return actualLocation;
}
