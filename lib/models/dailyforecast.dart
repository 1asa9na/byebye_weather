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
      WeatherCodeMap.weatherImage[json['values']['weatherCode']]!,
      WeatherCodeMap.weatherCode[json['values']['weatherCode']]!,
      DateTime.parse(json['time']!),
      json['values']['temperatureMin']!.round(),
      json['values']['temperatureMax']!.round(),
      json['values']['windSpeedAvg']!.round(),
      json['values']['humidityAvg']!.round(),
      json['pressureSurfaceLevelAvg']!.round(),
      json['values']['precipitationProbabilityAvg']!.round());
}
