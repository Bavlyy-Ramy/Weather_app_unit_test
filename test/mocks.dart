import 'package:mockito/annotations.dart';
import 'package:weather_app_unit_test/domain/repos/weather_repository.dart';
import 'package:weather_app_unit_test/data/datasources/weather_remote_datasource.dart';

@GenerateMocks([WeatherRepository, WeatherRemoteDataSource])
void main() {}
