part of 'theme_bloc.dart';

class ThemeState extends Equatable {
  final ThemeData theme;
  final MaterialColor color;

  const ThemeState({
    @required this.theme,
    @required this.color,
  })  : assert(theme != null),
        assert(color != null);

  @override
  List<Object> get props => [theme, color];

  @override
  bool get stringify => true;
}
