
import 'package:weather_app/core/resources/data_state.dart';
import 'package:weather_app/core/use_case/use_case.dart';
import 'package:weather_app/features/bookmarks_feature/domain/entities/city_entity.dart';
import 'package:weather_app/features/bookmarks_feature/domain/repository/city_repository.dart';

class SaveCityUseCase implements UseCase<DataState<City>, String> {
  final CityRepository cityRepository;

  SaveCityUseCase(this.cityRepository);

  @override
  Future<DataState<City>> call(String params) {
    return cityRepository.saveCityToDB(params);
  }
}
