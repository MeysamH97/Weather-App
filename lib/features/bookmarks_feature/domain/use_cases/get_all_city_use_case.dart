

import 'package:weather_app/core/resources/data_state.dart';
import 'package:weather_app/core/use_case/use_case.dart';
import 'package:weather_app/features/bookmarks_feature/domain/entities/city_entity.dart';
import 'package:weather_app/features/bookmarks_feature/domain/repository/city_repository.dart';

class GetAllCityUseCase implements UseCase<DataState<List<City>>, NoParams> {
  final CityRepository cityRepository;

  GetAllCityUseCase(this.cityRepository);

  @override
  Future<DataState<List<City>>> call(NoParams params) {
    return cityRepository.getAllCityFromDB();
  }
}
