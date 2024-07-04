import 'package:flutter/material.dart';
import 'package:weather_app/core/presentation/widgets/app_background.dart';
import 'package:weather_app/core/utils/constants.dart';
import 'package:weather_app/core/utils/date_converter.dart';
import 'package:weather_app/features/weather__feature/data/models/forecast_days_model.dart';

class DaysWeatherView extends StatefulWidget {
  final List<Daily> days;

  const DaysWeatherView({super.key, required this.days});

  @override
  State<DaysWeatherView> createState() => _DaysWeatherViewState();
}

class _DaysWeatherViewState extends State<DaysWeatherView>
    with SingleTickerProviderStateMixin {
  late AnimationController animationController;
  late Animation animation;
  List<Daily> days = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    filterDays();
    animationController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 300));
    animation = Tween(
      begin: -1.0,
      end: 0.0,
    ).animate(CurvedAnimation(
        parent: animationController,
        curve: const Interval(0.5, 1, curve: Curves.decelerate)));
    animationController.forward();
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemCount: days.length,
        itemBuilder: (
          BuildContext context,
          int index,
        ) {
          return AnimatedBuilder(
            animation: animationController,
            builder: (context, child) {
              return Transform(
                transform: Matrix4.translationValues(
                    animation.value * Constants.width(context), 0.0, 0.0),
                child: Padding(
                  padding: const EdgeInsets.only(right: 5),
                  child: Card(
                    color: Colors.transparent,
                    elevation: 0,
                    child: SizedBox(
                      width: 50,
                      height: 50,
                      child: Column(
                        children: [
                          Text(
                            DateConverter.changeDtToDateTime(days[index].dt),
                            style: const TextStyle(
                                fontSize: 12, color: Colors.grey),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 5.0),
                            child: AppBackground.setIconForMain(
                                days[index].weather[0].description),
                          ),
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.only(top: 5.0),
                              child: Text(
                                "${days[index].main.temp.round()}\u00B0",
                                style: const TextStyle(
                                    fontSize: 15, color: Colors.white),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              );
            },
          );
        });
  }

  filterDays() {
    days = [widget.days[0]];
    int index = 0;
    for (int i = 1; i < widget.days.length; i++) {
      if (DateConverter.changeDtToDateTime(widget.days[i].dt) !=
          DateConverter.changeDtToDateTime(widget.days[i - 1].dt)) {
        days.add(widget.days[i]);
        index ++;
      } else {
        if(widget.days[i].main.temp > days[index].main.temp){
          days[index].main.temp = widget.days[i].main.temp;
        }
      }
    }
  }

  @override
  void dispose() {
    // TODO: implement dispose
    animationController.dispose();
    super.dispose();
  }
}
