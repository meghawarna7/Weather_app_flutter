// lib/screens/weather_screen.dart

import 'package:flutter/material.dart';
import '../services/weather_service.dart';
import '../models/weather.dart';

class WeatherScreen extends StatefulWidget {
  @override
  _WeatherScreenState createState() => _WeatherScreenState();
}

class _WeatherScreenState extends State<WeatherScreen> {
  final WeatherService weatherService = WeatherService();
  Weather? _weather;
  final TextEditingController _controller = TextEditingController();

  void _getWeather() async {
    final city = _controller.text;
    if (city.isNotEmpty) {
      final weather = await weatherService.fetchWeather(city);
      setState(() {
        _weather = weather;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Weather App'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _controller,
              decoration: InputDecoration(
                labelText: 'Enter city name',
                suffixIcon: IconButton(
                  icon: Icon(Icons.search),
                  onPressed: _getWeather,
                ),
              ),
            ),
            SizedBox(height: 20),
            if (_weather != null) ...[
              Text(
                'Temperature: ${_weather!.temperature}°C',
                style: TextStyle(fontSize: 24),
              ),
              Text(
                'Description: ${_weather!.description}',
                style: TextStyle(fontSize: 18),
              ),
              Text(
                'Humidity: ${_weather!.humidity}%',
                style: TextStyle(fontSize: 18),
              ),
              Text(
                'Wind Speed: ${_weather!.windSpeed} m/s',
                style: TextStyle(fontSize: 18),
              ),
            ],
          ],
        ),
      ),
    );
  }
}
