import 'package:get_it/get_it.dart';
import 'package:weather_app/features/bookmarks_feature/data/data_source/local/database.dart';
import 'package:weather_app/features/bookmarks_feature/data/repository/city_repositoryimpl.dart';
import 'package:weather_app/features/bookmarks_feature/domain/repository/city_repository.dart';
import 'package:weather_app/features/bookmarks_feature/domain/use_cases/delete_city_use_case.dart';
import 'package:weather_app/features/bookmarks_feature/domain/use_cases/get_all_city_use_case.dart';
import 'package:weather_app/features/bookmarks_feature/domain/use_cases/get_city_use_case.dart';
import 'package:weather_app/features/bookmarks_feature/domain/use_cases/save_city_use_case.dart';
import 'package:weather_app/features/bookmarks_feature/presentation/bloc/bookmark_bloc.dart';
import 'package:weather_app/features/weather__feature/data/data_source/remote/api_provider.dart';
import 'package:weather_app/features/weather__feature/data/repository/weather_repository_impl.dart';
import 'package:weather_app/features/weather__feature/domain/repository/weather_repository.dart';
import 'package:weather_app/features/weather__feature/domain/use_cases/get_current_weather_usecase.dart';
import 'package:weather_app/features/weather__feature/domain/use_cases/get_forecast_days_usecase.dart';
import 'package:weather_app/features/weather__feature/domain/use_cases/get_suggestion_city_usecase.dart';
import 'package:weather_app/features/weather__feature/presentation/bloc/home_bloc.dart';

GetIt locator = GetIt.instance;

setup() async {
  final database =
  await $FloorAppDatabase.databaseBuilder('app_database.db').build();
  locator.registerSingleton<AppDatabase>(database);

  ///Api provider:
  locator.registerSingleton<ApiProvider>(ApiProvider());

  ///Repositories:
  locator.registerSingleton<WeatherRepository>(WeatherRepositoryImpl(locator()));
  locator.registerSingleton<CityRepository>(CityRepositoryImpl(database.cityDao));

  ///UseCases:
  locator.registerSingleton<GetCurrentWeatherUseCase>(GetCurrentWeatherUseCase(locator()));

  locator.registerSingleton<GetForecast7DaysUseCase>(GetForecast7DaysUseCase(locator()));

  locator.registerSingleton<GetSuggestionCityUseCase>(GetSuggestionCityUseCase(locator()));

  locator.registerSingleton<SaveCityUseCase>(SaveCityUseCase(locator()));

  locator.registerSingleton<GetCityUseCase>(GetCityUseCase(locator()));

  locator.registerSingleton<GetAllCityUseCase>(GetAllCityUseCase(locator()));

  locator.registerSingleton<DeleteCityUseCase>(DeleteCityUseCase(locator()));

  ///Blocs
  locator.registerSingleton<HomeBloc>(
    HomeBloc(
      locator(),
      locator(),
    ),
  );

  locator.registerSingleton<BookmarkBloc>(
    BookmarkBloc(
      locator(),
      locator(),
      locator(),
      locator(),
    ),
  );

}

