import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:weather_app_unit_test/domain/entities/weather_entity.dart';

class WeatherInfo extends StatelessWidget {
  final WeatherEntity weather;

  const WeatherInfo({super.key, required this.weather});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      margin: const EdgeInsets.only(top: 20),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              '${weather.cityName}, ${weather.country}',
              style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Image.network(weather.weatherIcon),
            const SizedBox(height: 8),
            Text('${weather.temperature}°C',
                style: const TextStyle(fontSize: 35)),
            Text(weather.weatherDescription,
                style: const TextStyle(fontSize: 20)),
            const SizedBox(height: 8),
            Text(formatLocalTime(weather.localTime)),
          ],
        ),
      ),
    );
  }
}

String formatLocalTime(String timeStr) {
  final DateTime dateTime = DateTime.parse(timeStr);
  final DateFormat formatter = DateFormat('MMMM d, yyyy – h:mm a');
  return formatter.format(dateTime);
}
