import 'package:equatable/equatable.dart';

class WeatherEntity extends Equatable{
  final String cityName;
  final String country;
  final String localTime;
  final int temperature;
  final String weatherDescription;
  final String weatherIcon;

  const WeatherEntity({
    required this.cityName,
    required this.country,
    required this.localTime,
    required this.temperature,
    required this.weatherDescription,
    required this.weatherIcon,
  });
@override
  List<Object> get props => [
        cityName,
        country,
        localTime,
        temperature,
        weatherDescription,
        weatherIcon,
      ];


}
