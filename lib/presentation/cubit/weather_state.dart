part of 'weather_cubit.dart';

@immutable
sealed class WeatherState {}

class WeatherInitial extends WeatherState {}

class WeatherLoading extends WeatherState {}

class WeatherLoaded extends WeatherState {
  final WeatherEntity weather;

  WeatherLoaded(this.weather);


}

class WeatherError extends WeatherState {
  final String message;

  WeatherError(this.message);
}