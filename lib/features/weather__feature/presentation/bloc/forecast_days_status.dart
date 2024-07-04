import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:weather_app/features/weather__feature/domain/entities/forecast_days_entity.dart';

@immutable
abstract class ForecastDaysStatus extends Equatable{

}

class ForecastDaysLoading extends ForecastDaysStatus {
  @override
  // TODO: implement props
  List<Object?> get props => [];

}

class ForecastDaysCompleted extends ForecastDaysStatus {

  final ForecastDaysEntity forecast7daysEntity;
  ForecastDaysCompleted(this.forecast7daysEntity);

  @override
  // TODO: implement props
  List<Object?> get props => [forecast7daysEntity];

}

class ForecastDaysError extends ForecastDaysStatus {

  final String message;
  ForecastDaysError(this.message);

  @override
  // TODO: implement props
  List<Object?> get props => [message];

}