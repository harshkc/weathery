import 'dart:async';
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:bloc_weather/app/app.dart';
import 'package:bloc_weather/app/app_bloc_observer.dart';
import 'package:bloc_weather/repository/repository.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

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
