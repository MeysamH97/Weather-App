import 'package:equatable/equatable.dart';
import 'package:weather_app/features/weather__feature/data/models/forecast_days_model.dart';

class ForecastDaysEntity extends Equatable {
  final String? cod;
  final int? message;
  final int? cnt;
  final List<Daily>? daily;
  final City? city;

  const ForecastDaysEntity({
    this.cod,
    this.message,
    this.cnt,
    this.daily,
    this.city,
  });

  @override
  // TODO: implement props
  List<Object?> get props => [
        cod,
        message,
        cnt,
        daily,
        city,
      ];

  @override
  // TODO: implement stringify
  bool? get stringify => true;
}
