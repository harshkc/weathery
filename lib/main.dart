import 'dart:async';
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'app/app.dart';
import 'app/app_bloc_observer.dart';
import 'weather/repository/weather_api_client.dart';
import 'weather/repository/weather_repository.dart';

void main() {
  Bloc.observer = AppBlocObserver();

  final WeatherRepository weatherRepository = WeatherRepository(
    weatherApiClient: WeatherApiClient(
      httpClient: http.Client(),
    ),
  );

  FlutterError.onError = (details) {
    log(details.exceptionAsString(), stackTrace: details.stack);
  };

  runZonedGuarded(() => runApp(App(weatherRepository: weatherRepository)),
      (error, stacktrace) {
    log(error.toString(), stackTrace: stacktrace);
  });
}
