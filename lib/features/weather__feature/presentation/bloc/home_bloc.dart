import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:weather_app/core/resources/data_state.dart';
import 'package:weather_app/features/weather__feature/domain/use_cases/get_current_weather_usecase.dart';
import 'package:weather_app/features/weather__feature/presentation/bloc/current_weather_status.dart';

part 'home_event.dart';

part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final GetCurrentWeatherUseCase getCurrentWeatherUseCase;

  HomeBloc(this.getCurrentWeatherUseCase)
      : super(HomeState(currentWeatherStatus: CurrentWeatherLoading())) {

    on<LoadCurrentWeatherEvent>((event, emit) async {

      emit(state.copyWith(newCurrentWeatherStatus: CurrentWeatherLoading()));

      DataState dataState = await getCurrentWeatherUseCase(event.cityName);

      if(dataState is DataSuccess){
        emit(state.copyWith(newCurrentWeatherStatus: CurrentWeatherCompleted(dataState.data)));
      }

      if(dataState is DataFailed){
        emit(state.copyWith(newCurrentWeatherStatus: CurrentWeatherError(dataState.error!)));

      }

    });

  }

}
