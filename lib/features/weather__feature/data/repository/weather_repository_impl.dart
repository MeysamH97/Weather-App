import 'package:dio/dio.dart';
import 'package:weather_app/core/params/forecast_params.dart';
import 'package:weather_app/core/resources/data_state.dart';
import 'package:weather_app/features/weather__feature/data/data_source/remote/api_provider.dart';
import 'package:weather_app/features/weather__feature/data/models/current_city_model.dart';
import 'package:weather_app/features/weather__feature/data/models/forecast_days_model.dart';
import 'package:weather_app/features/weather__feature/data/models/suggest_city_model.dart';
import 'package:weather_app/features/weather__feature/domain/entities/current_city_entity.dart';
import 'package:weather_app/features/weather__feature/domain/entities/forecast_days_entity.dart';
import 'package:weather_app/features/weather__feature/domain/entities/suggest_city_entity.dart';
import 'package:weather_app/features/weather__feature/domain/repository/weather_repository.dart';

class WeatherRepositoryImpl extends WeatherRepository{

  ApiProvider apiProvider;

  WeatherRepositoryImpl(this.apiProvider);

  @override
  Future<DataState<CurrentCityEntity>> fetchCurrentCityData(String cityName) async {
    try{

      Response response = await  apiProvider.getCurrentWeather(cityName);

      if(response.statusCode == 200){

        CurrentCityEntity currentCityEntity = CurrentCityModel.fromJson(response.data);
        return DataSuccess(currentCityEntity);

      }else{
        return DataFailed('${response.statusCode}  Something went wrong. Please try again ...');
      }

    }catch(e){
      return DataFailed('Please check your connection ...');
    }
  }

  @override
  Future<DataState<ForecastDaysEntity>> fetchForecast7daysData(ForecastParams params)async {
    try{

      Response response = await  apiProvider.sendRequest7DaysForecast(params);

      if(response.statusCode == 200){

        ForecastDaysEntity forecast7daysEntity = ForecastDaysModel.fromJson(response.data);
        return DataSuccess(forecast7daysEntity);

      }
      else{

        return DataFailed('${response.statusCode}  Something went wrong. Please try again ...');

      }

    }catch(e){

      return DataFailed('Please check your connection ...');
    }
  }

  @override
  Future<List<Data>> fetchSuggestData(cityName) async {

    Response response = await apiProvider.sendRequestCitySuggestion(cityName);

    SuggestCityEntity suggestCityEntity = SuggestCityModel.fromJson(response.data);

    return suggestCityEntity.data!;

  }

}