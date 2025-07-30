import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:weather_app_unit_test/domain/entities/weather_entity.dart';
import 'package:weather_app_unit_test/domain/usecases/get_current_weather.dart';

import '../mocks.mocks.dart';

void main() {
  late MockWeatherRepository mockRepository;
  late GetCurrentWeather usecase;

  setUp(() {
    mockRepository = MockWeatherRepository();
    usecase = GetCurrentWeather(mockRepository);
  });

  const testCity = 'Cairo';
  final testEntity = WeatherEntity(
    cityName: 'Cairo',
    country: 'Egypt',
    localTime: '2025-07-30 11:00',
    temperature: 30,
    weatherDescription: 'Sunny',
    weatherIcon: '//cdn.weatherapi.com/weather/64x64/day/113.png',
  );

  test('should return WeatherEntity when repository returns data', () async {
    when(mockRepository.getCurrentWeather(testCity))
        .thenAnswer((_) async => testEntity);

    final result = await usecase.call(testCity);

    expect(result, testEntity);
    verify(mockRepository.getCurrentWeather(testCity)).called(1);
    verifyNoMoreInteractions(mockRepository);
  });

  test('should throw when repository throws', () async {
    when(mockRepository.getCurrentWeather(testCity))
        .thenThrow(Exception('Repo error'));

    expect(() => usecase.call(testCity), throwsException);
    verify(mockRepository.getCurrentWeather(testCity)).called(1);
  });
}
