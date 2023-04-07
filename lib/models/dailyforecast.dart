import 'package:labtask/bloc/dailyforecastbloc.dart';
import 'package:labtask/models/weathercodemap.dart';

class DailyForecast extends DFState {
  int windSpeed;
  int humidity;
  int pressure;
  int probability;
  String forecastWord;
  String forecastImage;
  int temperatureMin;
  int temperatureMax;
  DateTime date;

  DailyForecast(
      this.forecastImage,
      this.forecastWord,
      this.date,
      this.temperatureMin,
      this.temperatureMax,
      this.windSpeed,
      this.humidity,
      this.pressure,
      this.probability);

  factory DailyForecast.fromJson(Map json) => DailyForecast(
      WeatherCodeMap.weatherImage[json['values']['weatherCode']] ?? 'sun',
      WeatherCodeMap.weatherCode[json['values']['weatherCode']] ?? 'Солнечно',
      DateTime.parse(json['time'] ?? DateTime.now()),
      (json['values']['temperatureMin'] ?? 10).round(),
      (json['values']['temperatureMax'] ?? 20).round(),
      (json['values']['windSpeedAvg'] ?? 0).round(),
      (json['values']['humidityAvg'] ?? 50).round(),
      (json['pressureSurfaceLevelAvg'] ?? 1100).round(),
      (json['values']['precipitationProbabilityAvg'] ?? 0).round());
}
