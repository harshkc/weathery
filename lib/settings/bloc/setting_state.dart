part of 'setting_bloc.dart';

class SettingState extends Equatable {
  final TemperatureUnit temperatureUnit;
  const SettingState({
    @required this.temperatureUnit,
  }) : assert(temperatureUnit != null);

  @override
  List<Object> get props => [temperatureUnit];
}
