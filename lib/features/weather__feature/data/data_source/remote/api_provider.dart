import 'package:dio/dio.dart';
import 'package:weather_app/core/params/forecast_params.dart';
import 'package:weather_app/core/utils/constants.dart';

class ApiProvider {
  final Dio dio = Dio();
  var apiKey = Constants.apiKey1;

  /// current weather api call
  Future<dynamic> getCurrentWeather(cityName) async{
    var response = await dio.get(
        '${Constants.baseUrl}/data/2.5/weather',
        queryParameters: {
          'q' : cityName,
          'appid' : apiKey,
          'units' : 'metric'
        }
    );
    return response;
  }

  /// 7DaysForecast api call
  Future<dynamic> sendRequest7DaysForecast(ForecastParams params) async {

    var response = await dio.get(
        "${Constants.baseUrl}/data/2.5/forecast",
        queryParameters: {
          'lat': params.lat,
          'lon': params.lon,
          'appid': apiKey,
          'units': 'metric'
        });

    return response;
  }

  /// city name suggest api
  Future<dynamic> sendRequestCitySuggestion(String prefix) async {
    var response = await dio.get(
        "http://geodb-free-service.wirefreethought.com/v1/geo/cities",
        queryParameters: {'limit': 7, 'offset': 0, 'namePrefix': prefix});

    return response;
  }

}
