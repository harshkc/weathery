import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:bloc_weather/constants/enums.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';

part 'setting_event.dart';
part 'setting_state.dart';

class SettingBloc extends Bloc<SettingEvent, SettingState> {
  SettingBloc() : super(SettingState(temperatureUnit: TemperatureUnit.celsius));

  @override
  Stream<SettingState> mapEventToState(
    SettingEvent event,
  ) async* {
    if (event is TempUnitToggled) {
      yield SettingState(
          temperatureUnit: state.temperatureUnit == TemperatureUnit.celsius
              ? TemperatureUnit.fahrenheit
              : TemperatureUnit.celsius);
    }
  }
}
