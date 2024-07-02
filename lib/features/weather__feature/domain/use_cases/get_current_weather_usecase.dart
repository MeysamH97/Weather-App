import 'package:weather_app/core/resources/data_state.dart';
import 'package:weather_app/core/use_case/use_case.dart';
import 'package:weather_app/features/weather__feature/domain/entities/current_city_entity.dart';
import 'package:weather_app/features/weather__feature/domain/repository/weather_repository.dart';

class GetCurrentWeatherUseCase extends UseCase <DataState<CurrentCityEntity>,String >{
  final WeatherRepository weatherRepository;

  GetCurrentWeatherUseCase(this.weatherRepository);

  @override
  Future<DataState<CurrentCityEntity>> call(String param) {

    return weatherRepository.fetchCurrentCityData(param);

  }

}