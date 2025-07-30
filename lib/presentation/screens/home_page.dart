import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app_unit_test/presentation/cubit/weather_cubit.dart';
import 'package:weather_app_unit_test/presentation/screens/weather_info.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController _controller = TextEditingController();

    void _fetchWeather(BuildContext context) {
      final city = _controller.text.trim();
      if (city.isNotEmpty) {
        context.read<WeatherCubit>().getWeather(city);
      }
    }

    TextField weatherTextField(BuildContext context) {
      return TextField(
        controller: _controller,
        decoration: const InputDecoration(
          labelText: 'Enter city name',
          border: OutlineInputBorder(),
        ),
        onSubmitted: (_) => _fetchWeather(context),
      );
    }

    return Scaffold(
      appBar: AppBar(title: Text('Weather App'), backgroundColor: Colors.green),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(height: 75),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: weatherTextField(context),
            ),
            const SizedBox(height: 50),

            Container(
              height: 305,
              child: BlocBuilder<WeatherCubit, WeatherState>(
                builder: (context, state) {
                  if (state is WeatherLoading) {
                    return const Center(child: CircularProgressIndicator());
                  } else if (state is WeatherError) {
                    return Center(
                      child: Text(
                        state.message,
                        style: const TextStyle(color: Colors.red, fontSize: 20),
                      ),
                    );
                  } else if (state is WeatherLoaded) {
                    return WeatherInfo(weather: state.weather);
                  }
                  return const SizedBox();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
