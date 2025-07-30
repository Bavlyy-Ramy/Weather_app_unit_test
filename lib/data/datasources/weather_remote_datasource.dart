import 'package:weather_app_unit_test/data/models/weather_model/weather_model.dart';

abstract class WeatherRemoteDataSource {
  Future<WeatherModel> getCurrentWeather(String city);
}