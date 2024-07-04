part of 'home_bloc.dart';

@immutable
class HomeState extends Equatable {
  final CurrentWeatherStatus currentWeatherStatus;
  final ForecastDaysStatus forecastdaysStatus;

  const HomeState(
      {required this.forecastdaysStatus, required this.currentWeatherStatus});

  HomeState copyWith(
      {CurrentWeatherStatus? newCurrentWeatherStatus,
      ForecastDaysStatus? newForecast7DaysStatus}) {

    return HomeState(
      currentWeatherStatus: newCurrentWeatherStatus ?? currentWeatherStatus,
      forecastdaysStatus: newForecast7DaysStatus ?? forecastdaysStatus,
    );

  }

  @override
  // TODO: implement props
  List<Object?> get props => [
        currentWeatherStatus,
        forecastdaysStatus,
      ];
}
