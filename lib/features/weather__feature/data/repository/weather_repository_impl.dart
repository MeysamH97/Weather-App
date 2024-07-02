import 'package:dio/dio.dart';
import 'package:weather_app/core/resources/data_state.dart';
import 'package:weather_app/features/weather__feature/data/data_source/remote/api_provider.dart';
import 'package:weather_app/features/weather__feature/data/models/current_city_model.dart';
import 'package:weather_app/features/weather__feature/domain/entities/current_city_entity.dart';
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
        return DataFailed('Something went wrong. Please try again ...');
      }

    }catch(e){
      return DataFailed('Please check your connection ...');
    }
  }

}