// lib/models/weather.dart

class Weather {
  final double temperature;
  final String description;
  final double humidity;
  final double windSpeed;

  Weather({
    required this.temperature,
    required this.description,
    required this.humidity,
    required this.windSpeed,
  });
}
