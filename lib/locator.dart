import 'package:get_it/get_it.dart';
import 'package:weather_app/features/weather__feature/data/data_source/remote/api_provider.dart';
import 'package:weather_app/features/weather__feature/data/repository/weather_repository_impl.dart';
import 'package:weather_app/features/weather__feature/domain/repository/weather_repository.dart';
import 'package:weather_app/features/weather__feature/domain/use_cases/get_current_weather_usecase.dart';
import 'package:weather_app/features/weather__feature/domain/use_cases/get_forecast_days_usecase.dart';
import 'package:weather_app/features/weather__feature/presentation/bloc/home_bloc.dart';

GetIt locator = GetIt.instance;
setup(){

  ///Api provider:
  locator.registerSingleton<ApiProvider>(ApiProvider());

  ///Repositories:
  locator.registerSingleton<WeatherRepository>(WeatherRepositoryImpl(locator()));

  ///UseCases:
  locator.registerSingleton<GetCurrentWeatherUseCase>(GetCurrentWeatherUseCase(locator()));
  locator.registerSingleton<GetForecast7DaysUseCase>(GetForecast7DaysUseCase(locator()));

  ///Blocs
  locator.registerSingleton<HomeBloc>(HomeBloc(locator(),locator()));
}