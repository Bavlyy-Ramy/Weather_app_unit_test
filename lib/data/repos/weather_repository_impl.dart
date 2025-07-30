import 'package:weather_app_unit_test/data/datasources/weather_remote_datasource.dart';
import 'package:weather_app_unit_test/data/models/weather_model/weather_model.dart';
import 'package:weather_app_unit_test/domain/repos/weather_repository.dart';

import '../../domain/entities/weather_entity.dart';


class WeatherRepositoryImpl implements WeatherRepository {
  final WeatherRemoteDataSource remoteDataSource;

  WeatherRepositoryImpl(this.remoteDataSource);

  @override
  Future<WeatherEntity> getCurrentWeather(String city) async {
    final WeatherModel model = await remoteDataSource.getCurrentWeather(city);
    return model.toEntity();
  }
}
