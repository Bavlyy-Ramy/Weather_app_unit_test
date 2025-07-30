
import 'package:weather_app_unit_test/core/constants.dart';
import 'package:weather_app_unit_test/core/utils/api_service.dart';
import 'package:weather_app_unit_test/data/datasources/weather_remote_datasource.dart';
import 'package:weather_app_unit_test/data/models/weather_model/weather_model.dart'; // contains your API key

class WeatherRemoteDataSourceImpl implements WeatherRemoteDataSource {
  final ApiService apiService;

  WeatherRemoteDataSourceImpl(this.apiService);

  @override
  Future<WeatherModel> getCurrentWeather(String city) async {
    final json = await apiService.get(
      endPoint: 'current.json',
      queryParams: {
        'key': WeatherApiConstants.apiKey,
        'q': city,
      },
    );

    return WeatherModel.fromJson(json);
  }
  
  
}
