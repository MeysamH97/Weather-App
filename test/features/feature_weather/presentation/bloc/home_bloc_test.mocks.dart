// Mocks generated by Mockito 5.4.4 from annotations
// in weather_app/test/features/feature_weather/presentation/bloc/home_bloc_test.dart.
// Do not manually edit this file.

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i5;

import 'package:mockito/mockito.dart' as _i1;
import 'package:weather_app/core/params/forecast_params.dart' as _i9;
import 'package:weather_app/core/resources/data_state.dart' as _i3;
import 'package:weather_app/features/weather__feature/domain/entities/current_city_entity.dart'
    as _i6;
import 'package:weather_app/features/weather__feature/domain/entities/forecast_days_entity.dart'
    as _i8;
import 'package:weather_app/features/weather__feature/domain/repository/weather_repository.dart'
    as _i2;
import 'package:weather_app/features/weather__feature/domain/use_cases/get_current_weather_usecase.dart'
    as _i4;
import 'package:weather_app/features/weather__feature/domain/use_cases/get_forecast_days_usecase.dart'
    as _i7;

// ignore_for_file: type=lint
// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: deprecated_member_use
// ignore_for_file: deprecated_member_use_from_same_package
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis
// ignore_for_file: camel_case_types
// ignore_for_file: subtype_of_sealed_class

class _FakeWeatherRepository_0 extends _i1.SmartFake
    implements _i2.WeatherRepository {
  _FakeWeatherRepository_0(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeDataState_1<T> extends _i1.SmartFake implements _i3.DataState<T> {
  _FakeDataState_1(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

/// A class which mocks [GetCurrentWeatherUseCase].
///
/// See the documentation for Mockito's code generation for more information.
class MockGetCurrentWeatherUseCase extends _i1.Mock
    implements _i4.GetCurrentWeatherUseCase {
  MockGetCurrentWeatherUseCase() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i2.WeatherRepository get weatherRepository => (super.noSuchMethod(
        Invocation.getter(#weatherRepository),
        returnValue: _FakeWeatherRepository_0(
          this,
          Invocation.getter(#weatherRepository),
        ),
      ) as _i2.WeatherRepository);

  @override
  _i5.Future<_i3.DataState<_i6.CurrentCityEntity>> call(String? param) =>
      (super.noSuchMethod(
        Invocation.method(
          #call,
          [param],
        ),
        returnValue: _i5.Future<_i3.DataState<_i6.CurrentCityEntity>>.value(
            _FakeDataState_1<_i6.CurrentCityEntity>(
          this,
          Invocation.method(
            #call,
            [param],
          ),
        )),
      ) as _i5.Future<_i3.DataState<_i6.CurrentCityEntity>>);
}

/// A class which mocks [GetForecast7DaysUseCase].
///
/// See the documentation for Mockito's code generation for more information.
class MockGetForecast7DaysUseCase extends _i1.Mock
    implements _i7.GetForecast7DaysUseCase {
  MockGetForecast7DaysUseCase() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i2.WeatherRepository get weatherRepository => (super.noSuchMethod(
        Invocation.getter(#weatherRepository),
        returnValue: _FakeWeatherRepository_0(
          this,
          Invocation.getter(#weatherRepository),
        ),
      ) as _i2.WeatherRepository);

  @override
  _i5.Future<_i3.DataState<_i8.ForecastDaysEntity>> call(
          _i9.ForecastParams? param) =>
      (super.noSuchMethod(
        Invocation.method(
          #call,
          [param],
        ),
        returnValue: _i5.Future<_i3.DataState<_i8.ForecastDaysEntity>>.value(
            _FakeDataState_1<_i8.ForecastDaysEntity>(
          this,
          Invocation.method(
            #call,
            [param],
          ),
        )),
      ) as _i5.Future<_i3.DataState<_i8.ForecastDaysEntity>>);
}
