import 'package:labtask/bloc/hourlyforecastbloc.dart';
import 'package:labtask/models/weathercodemap.dart';

class HourlyForecast extends HFState {
  String forecastImage;
  String forecastMainImage;
  String forecastWord;
  DateTime date;
  int temperature;

  HourlyForecast(this.forecastImage, this.forecastMainImage, this.forecastWord,
      this.date, this.temperature);

  factory HourlyForecast.fromJson(Map json) => HourlyForecast(
      WeatherCodeMap.weatherImage[json['values']['weatherCode'].toString()]!,
      WeatherCodeMap
          .weatherMainImage[json['values']['weatherCode'].toString()]!,
      WeatherCodeMap.weatherCode[json['values']['weatherCode'].toString()]!,
      DateTime.parse(json['time'] ?? DateTime.now().toString()),
      (json['values']['temperature'] ?? 20.0).round());
}
