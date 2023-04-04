import 'package:labtask/bloc/hourlyforecastbloc.dart';
import 'package:labtask/models/weathercodemap.dart';

class HourlyForecast extends HFState {
  String forecastImage;
  String forecastWord;
  int hoursOfDay;
  int temperature;

  HourlyForecast(
      this.forecastImage, this.forecastWord, this.hoursOfDay, this.temperature);

  factory HourlyForecast.fromJson(Map json) => HourlyForecast(
      WeatherCodeMap.weatherImage[json['values']['weatherCode']]!,
      WeatherCodeMap.weatherCode[json['values']['weatherCode']]!,
      DateTime.parse(json['time']!).hour,
      json['values']['temperature']!.round());
}
