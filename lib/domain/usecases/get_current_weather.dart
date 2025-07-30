import 'package:weather_app_unit_test/domain/entities/weather_entity.dart';
import 'package:weather_app_unit_test/domain/repos/weather_repository.dart';

class GetCurrentWeather {
  final WeatherRepository repository;

  GetCurrentWeather(this.repository);

  Future<WeatherEntity> call(String city) async {
    return await repository.getCurrentWeather(city);
  }
}