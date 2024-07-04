import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:weather_app/core/params/forecast_params.dart';
import 'package:weather_app/core/resources/data_state.dart';
import 'package:weather_app/features/weather__feature/domain/use_cases/get_current_weather_usecase.dart';
import 'package:weather_app/features/weather__feature/domain/use_cases/get_forecast_days_usecase.dart';
import 'package:weather_app/features/weather__feature/presentation/bloc/current_weather_status.dart';
import 'package:weather_app/features/weather__feature/presentation/bloc/forecast_days_status.dart';

part 'home_event.dart';

part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final GetCurrentWeatherUseCase getCurrentWeatherUseCase;
  final GetForecast7DaysUseCase getForecast7DaysUseCase;

  HomeBloc(
    this.getCurrentWeatherUseCase,
    this.getForecast7DaysUseCase,
  ) : super(
          HomeState(
            currentWeatherStatus: CurrentWeatherLoading(),
            forecastdaysStatus: ForecastDaysLoading(),
          ),
        ) {

    on<LoadCurrentWeatherEvent>((event, emit) async {
      emit(state.copyWith(newCurrentWeatherStatus: CurrentWeatherLoading()));

      DataState dataState = await getCurrentWeatherUseCase(event.cityName);

      if (dataState is DataSuccess) {
        emit(state.copyWith(
            newCurrentWeatherStatus: CurrentWeatherCompleted(dataState.data)));
      }

      if (dataState is DataFailed) {
        emit(state.copyWith(
            newCurrentWeatherStatus: CurrentWeatherError(dataState.error!)));
      }
    });

    on<LoadForecastDaysEvent>((event, emit) async {
      emit(state.copyWith(newForecast7DaysStatus: ForecastDaysLoading()));

      DataState dataState = await getForecast7DaysUseCase(event.params);

      if (dataState is DataSuccess) {
        emit(state.copyWith(
            newForecast7DaysStatus: ForecastDaysCompleted(dataState.data)));
      }

      if (dataState is DataFailed) {
        emit(state.copyWith(
            newForecast7DaysStatus: ForecastDaysError(dataState.error!)));
      }
    });
  }
}
