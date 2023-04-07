import 'dart:convert';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../models/dailyforecast.dart';

class DailyForecastBloc extends Bloc<DFEvent, DFState> {
  DailyForecastBloc()
      : super(DailyForecast(
            'sun', 'Ясно', DateTime.now(), 10, 20, 0, 50, 1100, 0)) {
    on<DFEvent>((event, emit) => emit(DailyForecast.fromJson(
        jsonDecode(event.prefs.getString('daily')!)[event.index])));
  }
}

class DFEvent {
  final int index;
  final SharedPreferences prefs;

  DFEvent(this.index, this.prefs) {}
}

abstract class DFState {
  get forecastImage;
  get forecastWord;
  get date;
  get temperatureMin;
  get temperatureMax;
  get windSpeed;
  get humidity;
  get pressure;
  get probability;
}
