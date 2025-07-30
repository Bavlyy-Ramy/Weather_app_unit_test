import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:weather_app_unit_test/data/models/weather_model/condition.dart';
import 'package:weather_app_unit_test/data/models/weather_model/current.dart';
import 'package:weather_app_unit_test/data/models/weather_model/location.dart';
import 'package:weather_app_unit_test/data/models/weather_model/weather_model.dart';
import 'package:weather_app_unit_test/data/repos/weather_repository_impl.dart';
import 'package:weather_app_unit_test/domain/entities/weather_entity.dart';

import '../mocks.mocks.dart';

void main() {
  late MockWeatherRemoteDataSource mockRemoteDataSource;
  late WeatherRepositoryImpl repository;

  setUp(() {
    mockRemoteDataSource = MockWeatherRemoteDataSource();
    repository = WeatherRepositoryImpl(mockRemoteDataSource);
  });

  const testCity = 'Cairo';
  final testModel = WeatherModel(
    location: Location(name: 'Cairo', country: 'Egypt', localtime: '2025-07-30 11:00'),
    current: Current(
      tempC: 30,
      condition: Condition(text: 'Sunny', icon: '//cdn.weatherapi.com/weather/64x64/day/113.png'),
    ),
  );
  final testEntity = testModel.toEntity();

  test('should call remote data source and return WeatherEntity', () async {
    when(mockRemoteDataSource.getCurrentWeather(testCity))
        .thenAnswer((_) async => testModel);

    final result = await repository.getCurrentWeather(testCity);

      expect(result, testEntity);
    verify(mockRemoteDataSource.getCurrentWeather(testCity)).called(1);
    verifyNoMoreInteractions(mockRemoteDataSource);
  });

  test('should throw when remote data source throws', () async {
    when(mockRemoteDataSource.getCurrentWeather(testCity))
        .thenThrow(Exception('API error'));

    expect(() => repository.getCurrentWeather(testCity), throwsException);
    verify(mockRemoteDataSource.getCurrentWeather(testCity)).called(1);
  });
}
