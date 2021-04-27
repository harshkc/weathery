import 'package:flutter/foundation.dart';

import '../models/models.dart';
import 'repository.dart';

class WeatherRepository {
  final WeatherApiClient weatherApiClient;
  WeatherRepository({
    @required this.weatherApiClient,
  }) : assert(weatherApiClient != null);

  Future<Weather> fetchWeather(String city) async {
    final int woeid = await weatherApiClient.getLocationId(city);

    return weatherApiClient.getWeatherReport(woeid);
  }
}
