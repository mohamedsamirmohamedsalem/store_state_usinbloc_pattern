import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:store_state_usinbloc_pattern/data/model/Weather.dart';
import 'package:store_state_usinbloc_pattern/weather_cubit/weather_state.dart';

import '../data/WeatherRepository.dart';

class WeatherCubit extends HydratedCubit<WeatherState> {
  final WeatherRepository _weatherRepository;
  WeatherCubit(this._weatherRepository) : super(WeatherInitial());

  Future<void> getWeather(String cityName) async {
    try {
      emit(WeatherLoading());
      final weather = await _weatherRepository.fetchWeather(cityName);
      emit(WeatherLoaded(weather));
    } on NetworkException {
      emit(WeatherError("Couldn't fetch weather. Is the device online?"));
    }
  }

  @override
  WeatherState fromJson(Map<String, dynamic> json) {
    try {
      final weather = Weather.fromJson(json);
      return WeatherLoaded(weather);
    } catch (_) {
      return null;
    }
  }

  @override
  Map<String, dynamic> toJson(WeatherState state) {
    if (state is WeatherLoaded) {
      return state.weather.toJson();
    } else {
      return null;
    }
  }
}
