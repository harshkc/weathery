import 'package:flutter/material.dart';

import '../repository/repository.dart';
import '../widgets/widgets.dart';

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
