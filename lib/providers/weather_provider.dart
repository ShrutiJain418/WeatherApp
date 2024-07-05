import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../models/weather.dart';
import '../services/weather_service.dart';

class WeatherProvider with ChangeNotifier {
  Weather? _weather;
  bool _isLoading = false;
  String? _errorMessage;
  String? _lastSearchedCity;

  Weather? get weather => _weather;
  bool get isLoading => _isLoading;
  String? get errorMessage => _errorMessage;
  String? get lastSearchedCity => _lastSearchedCity;

  final WeatherService _weatherService = WeatherService();

  WeatherProvider() {
    _loadLastSearchedCity();
  }

  Future<void> fetchWeather(String cityName) async {
    _isLoading = true;
    _errorMessage = null;
    notifyListeners();

    try {
      _weather = await _weatherService.fetchWeather(cityName);
      _saveLastSearchedCity(cityName);
    } catch (error) {
      _errorMessage = error.toString();
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  Future<void> _loadLastSearchedCity() async {
    final prefs = await SharedPreferences.getInstance();
    _lastSearchedCity = prefs.getString('lastSearchedCity');
    if (_lastSearchedCity != null) {
      fetchWeather(_lastSearchedCity!);
    }
  }

  Future<void> _saveLastSearchedCity(String cityName) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString('lastSearchedCity', cityName);
  }
}
