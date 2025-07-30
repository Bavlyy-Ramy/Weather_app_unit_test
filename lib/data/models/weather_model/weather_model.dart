import 'package:weather_app_unit_test/domain/entities/weather_entity.dart';

import 'current.dart';
import 'location.dart';


class WeatherModel {
  Location? location;
  Current? current;

  WeatherModel({this.location, this.current});

  factory WeatherModel.fromJson(Map<String, dynamic> json) => WeatherModel(
        location: json['location'] == null
            ? null
            : Location.fromJson(json['location'] as Map<String, dynamic>),
        current: json['current'] == null
            ? null
            : Current.fromJson(json['current'] as Map<String, dynamic>),
      );

  Map<String, dynamic> toJson() => {
        'location': location?.toJson(),
        'current': current?.toJson(),
      };
}

/// ✅ This must be **outside** the WeatherModel class
extension WeatherModelMapper on WeatherModel {
  WeatherEntity toEntity() {
    return WeatherEntity(
      cityName: location?.name ?? '',
      country: location?.country ?? '',
      localTime: location?.localtime ?? '',
      temperature: (current?.tempC ?? 0).round(),
      weatherDescription: current?.condition?.text ?? '',
     weatherIcon: 'https:${current?.condition?.icon ?? ''}',
    );
  }
}
