import 'package:weather_app/core/resources/data_state.dart';
import 'package:weather_app/core/use_case/use_case.dart';
import 'package:weather_app/features/bookmarks_feature/domain/repository/city_repository.dart';

class DeleteCityUseCase implements UseCase<DataState<String>, String> {
  final CityRepository cityRepository;

  DeleteCityUseCase(this.cityRepository);

  @override
  Future<DataState<String>> call(String params) {
    return cityRepository.deleteCityByName(params);
  }
}
