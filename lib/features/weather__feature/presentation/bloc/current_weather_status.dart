import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:weather_app/features/weather__feature/domain/entities/current_city_entity.dart';

@immutable
abstract class CurrentWeatherStatus extends Equatable{

}

class CurrentWeatherLoading extends CurrentWeatherStatus {
  @override
  List<Object?> get props => [];

}

class CurrentWeatherCompleted extends CurrentWeatherStatus {

  final CurrentCityEntity currentCityEntity;
  CurrentWeatherCompleted(this.currentCityEntity);

  @override
  List<Object?> get props => [currentCityEntity];

}

class CurrentWeatherError extends CurrentWeatherStatus {

  final String message;
  CurrentWeatherError(this.message);

  @override
  List<Object?> get props => [message];

}