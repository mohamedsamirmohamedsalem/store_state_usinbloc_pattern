import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:meta/meta.dart';

part 'Weather.g.dart';

@JsonSerializable()
class Weather extends Equatable {
  final String cityName;
  final double temperatureCelsius;

  Weather({
    @required this.cityName,
    @required this.temperatureCelsius,
  });

  factory Weather.fromJson(Map<String, dynamic> json) =>
      _$WeatherFromJson(json);
  Map<String, dynamic> toJson() => _$WeatherToJson(this);
}
