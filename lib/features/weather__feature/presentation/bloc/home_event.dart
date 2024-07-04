part of 'home_bloc.dart';

@immutable
sealed class HomeEvent {}

class LoadCurrentWeatherEvent extends HomeEvent{

  final String cityName;

  LoadCurrentWeatherEvent(this.cityName);
}

class LoadForecastDaysEvent extends HomeEvent{

  final ForecastParams params;

  LoadForecastDaysEvent(this.params);
}
