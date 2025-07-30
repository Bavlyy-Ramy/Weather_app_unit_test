class WeatherEntity {
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
}
