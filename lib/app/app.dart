import 'package:flutter/material.dart';

import '../weather/repository/repository.dart';
import '../weather/widgets/weather.dart';

class App extends StatelessWidget {
  final WeatherRepository weatherRepository;
  const App({Key key, @required this.weatherRepository})
      : assert(weatherRepository != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Weathery',
      home: Weather(
        weatherRepository: weatherRepository,
      ),
    );
  }
}
