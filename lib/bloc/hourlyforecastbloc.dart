import 'dart:convert';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:labtask/models/hourlyforecast.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HourlyForecastBloc extends Bloc<HFEvent, HFState> {
  HourlyForecastBloc()
      : super(HourlyForecast('sun', 'Ясно', DateTime.now(), 20)) {
    on<HFEvent>((event, emit) {
      print(jsonEncode(
          jsonDecode(event.prefs.getString('hourly')!)[event.index]));
      return emit(HourlyForecast.fromJson(
          jsonDecode(event.prefs.getString('hourly')!)[event.index]));
    });
  }
}

class HFEvent {
  final int index;
  final SharedPreferences prefs;

  HFEvent(this.index, this.prefs);
}

abstract class HFState {
  get forecastImage;
  get date;
  get temperature;
}
