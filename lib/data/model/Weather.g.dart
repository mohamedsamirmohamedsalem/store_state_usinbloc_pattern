// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'Weather.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Weather _$WeatherFromJson(Map<String, dynamic> json) {
  return Weather(
    cityName: json['cityName'] as String,
    temperatureCelsius: (json['temperatureCelsius'] as num)?.toDouble(),
  );
}

Map<String, dynamic> _$WeatherToJson(Weather instance) => <String, dynamic>{
      'cityName': instance.cityName,
      'temperatureCelsius': instance.temperatureCelsius,
    };
