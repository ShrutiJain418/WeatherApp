import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/weather.dart';

class WeatherService {
  static const String apiKey = 'a1df9835967f2edcac279aeac21cce42'; //api key
  static const String apiUrl =
      'https://api.openweathermap.org/data/2.5/weather';

  Future<Weather> fetchWeather(String cityName) async {
    final response = await http
        .get(Uri.parse('$apiUrl?q=$cityName&appid=$apiKey&units=metric'));

    if (response.statusCode == 200) {
      print(response.body);
      return Weather.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load weather');
    }
  }
}
