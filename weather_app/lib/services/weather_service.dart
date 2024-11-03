// lib/services/weather_service.dart

import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/weather.dart';

class WeatherService {
  final String apiKey = '61a69edc2a4b44cdb8c92fde983dcc61'; // Your updated API key

  Future<Weather?> fetchWeather(String city) async {
    final url = 'https://api.weatherbit.io/v2.0/current?city=$city&key=$apiKey&units=metric';

    try {
      final response = await http.get(Uri.parse(url));

      print('Response status: ${response.statusCode}');
      print('Response body: ${response.body}');

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        final currentWeather = data['data'][0];
        return Weather(
          temperature: currentWeather['temp'],
          description: currentWeather['weather']['description'],
          humidity: currentWeather['rh'], // Humidity
          windSpeed: currentWeather['wind_spd'], // Wind Speed
        );
      } else {
        print('Failed to load weather data: ${response.statusCode}');
        return null;
      }
    } catch (error) {
      print('Error: $error');
      return null;
    }
  }
}
