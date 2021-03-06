import 'package:bloc_weather/settings/settings.dart';
import 'package:bloc_weather/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../weather/repository/repository.dart';
import '../weather/widgets/weather.dart';

class App extends StatelessWidget {
  final WeatherRepository weatherRepository;

  const App({Key key, @required this.weatherRepository})
      : assert(weatherRepository != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<ThemeBloc>(create: (context) => ThemeBloc()),
        BlocProvider<SettingBloc>(create: (context) => SettingBloc()),
      ],
      child: BlocBuilder<ThemeBloc, ThemeState>(
        builder: (context, state) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Weathery',
            theme: state.theme,
            home: Weather(
              weatherRepository: weatherRepository,
            ),
          );
        },
      ),
    );
  }
}
