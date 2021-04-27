import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

import '../models/models.dart';

class WeatherApiClient {
  final http.Client httpClient;
  static const baseUrl = 'https://www.metaweather.com';

  WeatherApiClient({@required this.httpClient}) : assert(httpClient != null);

  Future<String> getLocationId(String city) async {
    final locationUrl = baseUrl + '/api/location/search/?query=$city';
    final locationResponse = await this.httpClient.get(Uri.parse(locationUrl));

    if (locationResponse.statusCode != 200) {
      throw Exception("Couldn't fetch location id");
    }
    final locationJsonMap = jsonDecode(locationResponse.body) as List;

    return (locationJsonMap.first)['woeid'];
  }

  Future<Weather> getWeatherReport(String woeid) async {
    final weatherReportUrl = baseUrl + '/api/location/$woeid/';

    final weatherResponse =
        await this.httpClient.get(Uri.parse(weatherReportUrl));

    if (weatherResponse.statusCode != 200) {
      throw Exception("Couldn't fetch weather report now");
    }
    final weatherJsonMap = jsonDecode(weatherResponse.body);

    return Weather.fromJson(weatherJsonMap);
  }
}
