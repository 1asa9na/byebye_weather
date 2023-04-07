import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:labtask/widgets/dailyforecastitem.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../bloc/dailyforecastbloc.dart';

class DailyForecastListWidget extends StatelessWidget {
  final SharedPreferences prefs;
  const DailyForecastListWidget(this.prefs, {super.key});

  @override
  Widget build(BuildContext context) {
    int listLength = jsonDecode(prefs.getString('daily')!).length;
    return SizedBox(
      height: 50.0 * listLength,
      child: MediaQuery.removePadding(
        context: context,
        removeTop: true,
        child: ListView.builder(
          shrinkWrap: true,
          physics: const ClampingScrollPhysics(),
          scrollDirection: Axis.vertical,
          itemCount: listLength,
          itemBuilder: (context, index) => BlocProvider<DailyForecastBloc>(
            create: (BuildContext context) =>
                DailyForecastBloc()..add(DFEvent(index, prefs)),
            child: DailyForecastItem(
              index,
              jsonDecode(prefs.getString('daily')!)
                  .map((e) => e['values']['temperatureMax'].round())
                  .toList()
                  .cast<int>(),
            ),
          ),
        ),
      ),
    );
  }
}
