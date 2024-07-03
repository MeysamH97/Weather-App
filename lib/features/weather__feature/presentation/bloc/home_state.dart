part of 'home_bloc.dart';

@immutable
class HomeState {
  final CurrentWeatherStatus currentWeatherStatus;

  const HomeState({required this.currentWeatherStatus});

  HomeState copyWith ({CurrentWeatherStatus? newCurrentWeatherStatus}){
    return HomeState (currentWeatherStatus: newCurrentWeatherStatus ?? currentWeatherStatus);
  }

}

