import 'package:weather_app/core/params/forecast_params.dart';
import 'package:weather_app/core/resources/data_state.dart';
import 'package:weather_app/core/use_case/use_case.dart';
import 'package:weather_app/features/weather__feature/domain/entities/forecast_days_entity.dart';
import 'package:weather_app/features/weather__feature/domain/repository/weather_repository.dart';

class GetForecast7DaysUseCase extends UseCase <DataState<ForecastDaysEntity>,ForecastParams >{
  final WeatherRepository weatherRepository;

  GetForecast7DaysUseCase(this.weatherRepository);

  @override
  Future<DataState<ForecastDaysEntity>> call(ForecastParams param) {

    return weatherRepository.fetchForecast7daysData(param);

  }

}