import 'package:bloc/bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:weather/weather.dart';

import 'weather_bloc_state.dart';

class WeatherCubit extends Cubit<WeatherBlocState> {
  final WeatherFactory _weatherFactory;

  WeatherCubit(double latitude, double longitude)
      : _weatherFactory = WeatherFactory(dotenv.env['WEATHER_API_KEY']!, language: Language.ENGLISH),
        super(WeatherBlocInitial()) {
    // Fetch weather on startup
    fetchWeather(latitude, longitude);
  }

  Future<void> fetchWeather(double latitude, double longitude) async {
    emit(WeatherBlocLoading());
    try {
      Weather weather = await _weatherFactory.currentWeatherByLocation(latitude, longitude);
      emit(WeatherBlocSuccess(weather));
    } catch (e) {
      emit(WeatherBlocFailure());
    }
  }
}
