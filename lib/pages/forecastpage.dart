import 'dart:convert';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_config/flutter_config.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:labtask/widgets/appbarcontainer.dart';
import 'package:labtask/widgets/bottomnavigationbarcontainer.dart';
import 'package:labtask/widgets/dailyforecastlistwidget.dart';
import 'package:labtask/widgets/hourlyforecastlistwidget.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../initapp.dart';
import '../models/weathercodemap.dart';

class ForecastPage extends StatelessWidget {
  final String apikey = FlutterConfig.get('APIKEY');
  SharedPreferences prefs;
  ForecastPage(this.prefs, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<int> list = jsonDecode(prefs.getString('daily')!)
        .map((e) => e['values']['temperatureMax'].round())
        .toList()
        .cast<int>();
    int hottest = list.indexOf(list.reduce(max));
    List<String> weathers = jsonDecode(prefs.getString('daily')!)
        .map((e) => e['values']['weatherCodeMax'].toString())
        .toList()
        .cast<String>();
    var map = Map();
    for (var weather in weathers) {
      if (!map.containsKey(weather)) {
        map[weather] = 1;
      } else {
        map[weather] += 1;
      }
    }
    var thevalue = 0;
    var thekey;
    map.forEach((k, v) {
      if (v > thevalue) {
        thevalue = v;
        thekey = k;
      }
    });
    return Scaffold(
      body: RefreshIndicator(
        onRefresh: () async {
          LocationPermission permission = await Geolocator.checkPermission();
          if (permission == LocationPermission.denied) {
            permission = await Geolocator.requestPermission();
            if (permission != LocationPermission.denied) {
              await initApp(prefs, await getCurrentLocation(permission));
            }
          }
        },
        child: CustomScrollView(
          slivers: [
            SliverAppBar(
              elevation: 0,
              foregroundColor: Colors.white,
              pinned: true,
              centerTitle: true,
              flexibleSpace: AppBarContainer(prefs),
              expandedHeight: MediaQuery.of(context).size.width * (9 / 16),
            ),
            SliverList(
              delegate: SliverChildListDelegate(
                [
                  const Padding(
                    padding: EdgeInsets.all(10),
                    child: Divider(
                      color: Color.fromARGB(25, 0, 0, 0),
                      thickness: 2,
                    ),
                  ),
                  HourlyForecastListWidget(prefs),
                  const Padding(
                    padding: EdgeInsets.all(10),
                    child: Divider(
                      color: Color.fromARGB(25, 0, 0, 0),
                      thickness: 2,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Text(
                      'На этой неделе ${WeatherCodeMap.weatherCode[thekey]}, средняя температура ${(list.reduce((a, b) => a + b) / list.length).round()}°, самый тёплый день ${WeatherCodeMap.daysOfWeekLong[DateTime.parse(jsonDecode(prefs.getString('daily')!)[hottest]['time']).weekday]} с температурой ${list.reduce(max)}°',
                      style: GoogleFonts.montserrat(
                          fontSize: 18, color: const Color(0xFF577CAE)),
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.all(10),
                    child: Divider(
                      color: Color.fromARGB(25, 0, 0, 0),
                      thickness: 2,
                    ),
                  ),
                  DailyForecastListWidget(prefs),
                  const Padding(
                    padding: EdgeInsets.all(10),
                    child: Divider(
                      color: Color.fromARGB(25, 0, 0, 0),
                      thickness: 2,
                    ),
                  ),
                  Text(
                    "Создано с помощью Tomorrow.io",
                    maxLines: 2,
                    textAlign: TextAlign.center,
                    style: GoogleFonts.montserrat(
                        fontSize: 16, color: const Color(0xFF577CAE)),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: const BottomAppBar(
        color: Color(0xFFFAFAFA),
        elevation: 0,
        notchMargin: 0,
        child: BottomNavigationBarContainer(),
      ),
    );
  }
}
