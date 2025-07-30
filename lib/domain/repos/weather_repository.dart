import 'package:weather_app_unit_test/domain/entities/weather_entity.dart';

abstract class WeatherRepository {
  Future<WeatherEntity> getCurrentWeather(String city);
}