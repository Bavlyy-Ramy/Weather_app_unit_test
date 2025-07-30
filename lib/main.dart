import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app_unit_test/core/constants.dart';
import 'package:weather_app_unit_test/core/utils/api_service.dart';
import 'package:weather_app_unit_test/data/datasources/weather_remote_data_source_impl.dart';
import 'package:weather_app_unit_test/data/datasources/weather_remote_datasource.dart';
import 'package:weather_app_unit_test/data/repos/weather_repository_impl.dart';
import 'package:weather_app_unit_test/domain/repos/weather_repository.dart';
import 'package:weather_app_unit_test/domain/usecases/get_current_weather.dart';
import 'package:weather_app_unit_test/presentation/cubit/weather_cubit.dart';
import 'package:weather_app_unit_test/presentation/screens/home_page.dart';

void main() {
  runApp(WeatherApp());
}

class WeatherApp extends StatelessWidget {
  const WeatherApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: BlocProvider(create: (context) => WeatherCubit(GetCurrentWeather(
        WeatherRepositoryImpl(
          WeatherRemoteDataSourceImpl(ApiService(Dio(), baseUrl: WeatherApiConstants.baseUrl))
        )
      )), child: HomePage()),
    );
  }
}
