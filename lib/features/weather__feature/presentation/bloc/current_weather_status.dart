import 'package:flutter/cupertino.dart';
import 'package:weather_app/features/weather__feature/domain/entities/current_city_entity.dart';

@immutable
abstract class CurrentWeatherStatus{

}

class CurrentWeatherLoading extends CurrentWeatherStatus {

}

class CurrentWeatherCompleted extends CurrentWeatherStatus {

  final CurrentCityEntity currentCityEntity;
  CurrentWeatherCompleted(this.currentCityEntity);

}

class CurrentWeatherError extends CurrentWeatherStatus {

  final String message;
  CurrentWeatherError(this.message);

}