import 'package:bloc_weather/models/models.dart';
import 'package:bloc_weather/repository/repository.dart';
import 'package:flutter/foundation.dart';

class WeatherRepository {
  final WeatherApiClient weatherApiClient;
  WeatherRepository({
    @required this.weatherApiClient,
  }) : assert(weatherApiClient != null);

  Future<Weather> fetchWeather(String city) async {
    final String woeid = await weatherApiClient.getLocationId(city);

    return weatherApiClient.getWeatherReport(woeid);
  }
}
