import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:weather_app_unit_test/data/models/weather_model/weather_model.dart';
import 'package:weather_app_unit_test/domain/entities/weather_entity.dart';
import 'package:weather_app_unit_test/domain/usecases/get_current_weather.dart';

part 'weather_state.dart';

class WeatherCubit extends Cubit<WeatherState> {
  final GetCurrentWeather getCurrentWeather; // usecase
  WeatherCubit(this.getCurrentWeather) : super(WeatherInitial());

  Future<void> getWeather(String cityName) async {
    emit(WeatherLoading());
    try {
    final WeatherEntity weather = await getCurrentWeather(cityName);
      emit(WeatherLoaded(weather));
    } catch (e) {
      emit(WeatherError("Failed to load weather: ${e.toString()}"));
    }
  }
}
