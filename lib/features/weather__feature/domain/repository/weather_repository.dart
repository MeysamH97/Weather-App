import 'package:weather_app/core/params/forecast_params.dart';
import 'package:weather_app/core/resources/data_state.dart';
import 'package:weather_app/features/weather__feature/data/models/suggest_city_model.dart';
import 'package:weather_app/features/weather__feature/domain/entities/current_city_entity.dart';
import 'package:weather_app/features/weather__feature/domain/entities/forecast_days_entity.dart';

abstract class WeatherRepository {

  Future<DataState<CurrentCityEntity>> fetchCurrentCityData (String cityName);

  Future<DataState<ForecastDaysEntity>> fetchForecast7daysData (ForecastParams params);

  Future<List<Data>> fetchSuggestData(cityName);

}