import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:weather_app/core/params/forecast_params.dart';
import 'package:weather_app/core/presentation/widgets/app_background.dart';
import 'package:weather_app/core/presentation/widgets/loading_widget.dart';
import 'package:weather_app/core/utils/constants.dart';
import 'package:weather_app/features/weather__feature/data/models/forecast_days_model.dart';
import 'package:weather_app/features/weather__feature/data/models/suggest_city_model.dart';
import 'package:weather_app/features/weather__feature/domain/entities/current_city_entity.dart';
import 'package:weather_app/features/weather__feature/domain/entities/forecast_days_entity.dart';
import 'package:weather_app/features/weather__feature/domain/use_cases/get_suggestion_city_usecase.dart';
import 'package:weather_app/features/weather__feature/presentation/bloc/current_weather_status.dart';
import 'package:weather_app/features/weather__feature/presentation/bloc/forecast_days_status.dart';
import 'package:weather_app/features/weather__feature/presentation/bloc/home_bloc.dart';
import 'package:weather_app/features/weather__feature/presentation/widgets/day_weather_view.dart';
import 'package:weather_app/locator.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    BlocProvider.of<HomeBloc>(context).add(LoadCurrentWeatherEvent('Tehran'));
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeState>(
      buildWhen: (previous, current) {
        if (previous.currentWeatherStatus == current.currentWeatherStatus) {
          return false;
        }
        return true;
      },
      builder: (context, state) {
        if (state.currentWeatherStatus is CurrentWeatherLoading) {
          return const Center(
            child: LoadingWidget(),
          );
        }

        if (state.currentWeatherStatus is CurrentWeatherCompleted) {
          final CurrentWeatherCompleted currentWeatherCompleted =
              state.currentWeatherStatus as CurrentWeatherCompleted;
          final CurrentCityEntity currentCityEntity =
              currentWeatherCompleted.currentCityEntity;

          /// create params for api call
          final ForecastParams forecastParams = ForecastParams(
              currentCityEntity.coord!.lat!, currentCityEntity.coord!.lon!);

          /// start load Fw event
          BlocProvider.of<HomeBloc>(context)
              .add(LoadForecastDaysEvent(forecastParams));

          GetSuggestionCityUseCase getSuggestionCityUseCase =
              GetSuggestionCityUseCase(locator());

          final ScrollController scrollController = ScrollController();
          final TextEditingController textEditingController =
              TextEditingController();
          final PageController pageController = PageController();

          return ListView(
            physics: const BouncingScrollPhysics(),
            controller: scrollController,
            children: [
              Column(
                children: [
                  /// search section
                  SizedBox(
                    height: Constants.height(context) * 0.02,
                  ),

                  Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: MediaQuery.of(context).size.width * 0.1),
                    child: Row(
                      children: [
                        /// search box
                        Expanded(
                          child: TypeAheadField(
                            builder: (context, controller, focusNode) {
                              return TextField(
                                focusNode: focusNode,
                              onSubmitted: (String prefix) {
                                  textEditingController.text = prefix;
                                  BlocProvider.of<HomeBloc>(context)
                                      .add(LoadCurrentWeatherEvent(prefix));
                                },
                                controller: textEditingController,
                                style:
                                    DefaultTextStyle.of(context).style.copyWith(
                                          fontSize: 16,
                                          color: Colors.white,
                                        ),
                                decoration: const InputDecoration(
                                  contentPadding:
                                      EdgeInsets.fromLTRB(20, 0, 0, 0),
                                  hintText: "Enter City Name ...",
                                  hintStyle: TextStyle(color: Colors.white),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide:
                                        BorderSide(color: Colors.white,),
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(color: Colors.white),
                                  ),
                                ),
                              );
                            },
                            controller: textEditingController,
                            suggestionsCallback: (String prefix) {
                              if (prefix.isNotEmpty) {
                                return getSuggestionCityUseCase(prefix);
                              }
                              return null;
                            },
                            itemBuilder: (context, Data model) {
                              return ListTile(
                                leading: const Icon(Icons.location_on),
                                title: Text(model.name!),
                                subtitle:
                                    Text("${model.region!}, ${model.country!}"),
                              );
                            },
                            onSelected: (Data model) {
                            textEditingController.text = model.name!;
                            BlocProvider.of<HomeBloc>(context)
                                .add(LoadCurrentWeatherEvent(model.name!));
                          },
                          ),
                        ),
                        // Other widgets (e.g., loading indicators, error messages) can be added here.
                      ],
                    ),
                  ),

                  ///current city show data section
                  Container(
                    padding:
                        EdgeInsets.only(top: Constants.height(context) * 0.02),
                    width: Constants.width(context),
                    height: Constants.height(context) * 0.53,
                    child: PageView.builder(
                      controller: pageController,
                      physics: const AlwaysScrollableScrollPhysics(),
                      itemCount: 2,
                      itemBuilder: (context, index) {
                        if (index == 0) {
                          return Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(top: 10),
                                child: Text(
                                  currentCityEntity.name!,
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 42,
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 20),
                                child: Text(
                                  currentCityEntity.weather![0].description!,
                                  style: TextStyle(
                                    color: Colors.white.withOpacity(0.5),
                                    fontSize: 18,
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 20),
                                child: AppBackground.setIconForMain(
                                    currentCityEntity.weather![0].description!),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 15),
                                child: Text(
                                  ' ${currentCityEntity.main!.temp!.round().toString()}\u00B0',
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 72,
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 20),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Column(
                                      children: [
                                        Text(
                                          'Min',
                                          style: TextStyle(
                                            color:
                                                Colors.white.withOpacity(0.5),
                                            fontSize: 18,
                                          ),
                                        ),
                                        const SizedBox(
                                          height: 5,
                                        ),
                                        Text(
                                          '${currentCityEntity.main!.tempMin!.round().toString()}\u00B0',
                                          style: TextStyle(
                                            color:
                                                Colors.white.withOpacity(0.75),
                                            fontSize: 16,
                                          ),
                                        ),
                                      ],
                                    ),
                                    Container(
                                      height: 50,
                                      width: 2,
                                      margin: const EdgeInsets.symmetric(
                                          horizontal: 15),
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        color: Colors.white.withOpacity(0.75),
                                      ),
                                    ),
                                    Column(
                                      children: [
                                        Text(
                                          'Max',
                                          style: TextStyle(
                                            color:
                                                Colors.white.withOpacity(0.5),
                                            fontSize: 18,
                                          ),
                                        ),
                                        const SizedBox(
                                          height: 5,
                                        ),
                                        Text(
                                          '${currentCityEntity.main!.tempMax!.round().toString()}\u00B0',
                                          style: TextStyle(
                                            color:
                                                Colors.white.withOpacity(0.75),
                                            fontSize: 16,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              )
                            ],
                          );
                        } else {
                          return Container(
                              alignment: Alignment.center,
                              color: Colors.green,
                              child: const Text('Chart screen'));
                        }
                      },
                    ),
                  ),

                  /// page view indicator section
                  Padding(
                    padding: const EdgeInsets.only(top: 10),
                    child: Center(
                      child: SmoothPageIndicator(
                        controller: pageController,
                        count: 2,
                        effect: ExpandingDotsEffect(
                            dotHeight: 10,
                            dotWidth: 10,
                            spacing: 5,
                            dotColor: Colors.white.withOpacity(0.5),
                            activeDotColor: Colors.white),
                        onDotClicked: (index) => pageController.animateToPage(
                            index,
                            duration: const Duration(milliseconds: 300),
                            curve: Curves.bounceInOut),
                      ),
                    ),
                  ),

                  /// divider
                  Padding(
                    padding: const EdgeInsets.all(
                      10,
                    ),
                    child: Divider(
                      color: Colors.white.withOpacity(0.1),
                    ),
                  ),

                  /// forecast 7 days show data section
                  SizedBox(
                    width: double.infinity,
                    height: 100,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 10.0),
                      child: Center(
                        child: BlocBuilder<HomeBloc, HomeState>(
                          builder: (BuildContext context, state) {
                            /// show Loading State for Fw
                            if (state.forecastdaysStatus
                                is ForecastDaysLoading) {
                              return const Center(
                                child: LoadingWidget(),
                              );
                            }

                            /// show Completed State for Fw
                            if (state.forecastdaysStatus
                                is ForecastDaysCompleted) {
                              /// casting
                              final ForecastDaysCompleted forecast7daysStatus =
                                  state.forecastdaysStatus
                                      as ForecastDaysCompleted;
                              final ForecastDaysEntity forecastDaysEntity =
                                  forecast7daysStatus.forecast7daysEntity;
                              final List<Daily> days =
                                  forecastDaysEntity.daily!;

                              return DaysWeatherView(
                                days: days,
                              );
                            }

                            /// show Error State for Fw
                            if (state.forecastdaysStatus is ForecastDaysError) {
                              final ForecastDaysError forecast7DaysError =
                                  state.forecastdaysStatus as ForecastDaysError;
                              return Center(
                                child: Text(
                                  forecast7DaysError.message,
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16,
                                  ),
                                ),
                              );
                            }

                            /// show Default State for Fw
                            return const SizedBox();
                          },
                        ),
                      ),
                    ),
                  ),

                  /// divider
                  Padding(
                    padding: const EdgeInsets.all(
                      10,
                    ),
                    child: Divider(
                      color: Colors.white.withOpacity(0.1),
                    ),
                  ),
                ],
              ),
            ],
          );
        }

        if (state.currentWeatherStatus is CurrentWeatherError) {
          final CurrentWeatherError currentWeatherError =
              state.currentWeatherStatus as CurrentWeatherError;
          final String error = currentWeatherError.message;

          return Center(
              child: Text(
            error,
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
          ));
        }

        return const SizedBox();
      },
    );
  }
}
