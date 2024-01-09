import 'package:weather/weather_app/models/weather.dart';

class FiveDayData {
  final String? day;
  final int? temp;
  final List<Weather>? weather;

  FiveDayData({this.day, this.temp, this.weather});

  factory FiveDayData.fromJson(dynamic json) {
    if (json == null) {
      return FiveDayData();
    }

    return FiveDayData(
      day: json['dt_txt'],
      temp: (double.parse(json['main']['temp'].toString()) - 273.15).round(),
      weather: (json['weather'] as List)
          .map((data) => Weather.fromJson(data))
          .toList(),
    );
  }
}
