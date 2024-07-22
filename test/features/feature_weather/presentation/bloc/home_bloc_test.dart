
import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:weather_app/core/resources/data_state.dart';
import 'package:weather_app/features/weather__feature/domain/entities/current_city_entity.dart';
import 'package:weather_app/features/weather__feature/domain/use_cases/get_current_weather_usecase.dart';
import 'package:weather_app/features/weather__feature/domain/use_cases/get_forecast_days_usecase.dart';
import 'package:weather_app/features/weather__feature/presentation/bloc/current_weather_status.dart';
import 'package:weather_app/features/weather__feature/presentation/bloc/forecast_days_status.dart';
import 'package:weather_app/features/weather__feature/presentation/bloc/home_bloc.dart';

import 'home_bloc_test.mocks.dart';


@GenerateMocks([GetCurrentWeatherUseCase, GetForecast7DaysUseCase])
Future<void> main() async {
  MockGetCurrentWeatherUseCase mockGetCurrentWeatherUseCase = MockGetCurrentWeatherUseCase();
  MockGetForecast7DaysUseCase mockGetForecastWeatherUseCase = MockGetForecast7DaysUseCase();

  String cityName = 'Tehran';
  String error = 'error';

  group('cw Event test', () {

    when(mockGetCurrentWeatherUseCase.call(any)).thenAnswer((_) async => Future.value(DataSuccess(CurrentCityEntity())));

    blocTest<HomeBloc, HomeState>(
      'emit Loading and Completed state',
      build: () => HomeBloc(mockGetCurrentWeatherUseCase, mockGetForecastWeatherUseCase),
      act: (bloc) {
        bloc.add(LoadCurrentWeatherEvent(cityName));
      },
      expect: () => <HomeState>[
        HomeState(currentWeatherStatus: CurrentWeatherLoading(), forecastdaysStatus: ForecastDaysLoading()),
        HomeState(currentWeatherStatus: CurrentWeatherCompleted(CurrentCityEntity()), forecastdaysStatus: ForecastDaysLoading()),
      ],
    );

    /// Second Way
    test('emit Loading and Error state', () {
      when(mockGetCurrentWeatherUseCase.call(any)).thenAnswer((_) async => Future.value(DataFailed(error)));

      final bloc = HomeBloc(mockGetCurrentWeatherUseCase,mockGetForecastWeatherUseCase);
      bloc.add(LoadCurrentWeatherEvent(cityName));

      expectLater(bloc.stream,emitsInOrder([
        HomeState(currentWeatherStatus: CurrentWeatherLoading(), forecastdaysStatus: ForecastDaysLoading()),
        HomeState(currentWeatherStatus: CurrentWeatherError(error), forecastdaysStatus: ForecastDaysLoading()),
      ]));
    });

  });
}