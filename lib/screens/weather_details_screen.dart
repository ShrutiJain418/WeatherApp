// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import '../providers/weather_provider.dart';

// class WeatherDetailsScreen extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     final weatherProvider = Provider.of<WeatherProvider>(context);
//     final weather = weatherProvider.weather;

//     return Scaffold(
//       // appBar: AppBar(
//       //   title: Text('Weather Details'),
//       // ),
//       body: Container(
//         width: MediaQuery.of(context).size.width,
//         height: MediaQuery.of(context).size.height,
//         decoration: BoxDecoration(
//           gradient: LinearGradient(
//             colors: [Color(0xFFa1c4fd), Color(0xFFc2e9fb)],
//             begin: Alignment.topLeft,
//             end: Alignment.bottomRight,
//           ),
//         ),
//         child: weatherProvider.isLoading
//             ? Center(child: CircularProgressIndicator())
//             : weatherProvider.errorMessage != null
//                 ? Center(child: Text(weatherProvider.errorMessage!))
//                 : weather != null
//                     ? Padding(
//                         padding: const EdgeInsets.only(
//                             left: 16.0, right: 16.0, top: 40.0),
//                         child: Column(
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           children: [
//                             Text(
//                               'City: ${weather.cityName}',
//                               style: TextStyle(fontSize: 24),
//                             ),
//                             SizedBox(height: 8),
//                             Text(
//                               'Temperature: ${weather.temperature}°C',
//                               style: TextStyle(fontSize: 24),
//                             ),
//                             SizedBox(height: 8),
//                             Text(
//                               'Condition: ${weather.weatherDescription}',
//                               style: TextStyle(fontSize: 24),
//                             ),
//                             SizedBox(height: 8),
//                             Image.network(
//                               'http://openweathermap.org/img/w/${weather.weatherIcon}.png',
//                               height: 100,
//                               width: 100,
//                             ),
//                             SizedBox(height: 8),
//                             Text(
//                               'Humidity: ${weather.humidity}%',
//                               style: TextStyle(fontSize: 24),
//                             ),
//                             SizedBox(height: 8),
//                             Text(
//                               'Wind Speed: ${weather.windSpeed} m/s',
//                               style: TextStyle(fontSize: 24),
//                             ),
//                             SizedBox(height: 16),
//                             ElevatedButton(
//                               onPressed: () {
//                                 weatherProvider.fetchWeather(weather.cityName);
//                               },
//                               child: Text('Refresh'),
//                             ),
//                           ],
//                         ),
//                       )
//                     : Center(
//                         child: Text('No weather data'),
//                       ),
//       ),
//     );
//   }
// }

// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/weather_provider.dart';

class WeatherDetailsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final weatherProvider = Provider.of<WeatherProvider>(context);
    final weather = weatherProvider.weather;

    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFFa1c4fd), Color(0xFFc2e9fb)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: weatherProvider.isLoading
            ? Center(child: CircularProgressIndicator())
            : weatherProvider.errorMessage != null
                ? Center(child: Text(weatherProvider.errorMessage!))
                : weather != null
                    ? Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Image.network(
                              'http://openweathermap.org/img/w/${weather.weatherIcon}.png',
                              // height: 200,
                              // width: 200,
                            ),
                            Text(
                              weather.cityName,
                              style: TextStyle(
                                fontSize: 28,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(height: 8),
                            Text(
                              '${weather.temperature}°C',
                              style: TextStyle(
                                fontSize: 64,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              weather.weatherDescription,
                              style: TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            SizedBox(height: 20),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Column(
                                  children: [
                                    Text('Wind',
                                        style: TextStyle(fontSize: 16)),
                                    Text(
                                      '${weather.windSpeed} km/h',
                                      style: TextStyle(fontSize: 18),
                                    ),
                                  ],
                                ),
                                Column(
                                  children: [
                                    Text('Humidity',
                                        style: TextStyle(fontSize: 16)),
                                    Text(
                                      '${weather.humidity}%',
                                      style: TextStyle(fontSize: 18),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            SizedBox(height: 50),
                            SizedBox(
                              width: MediaQuery.of(context).size.width * 0.5,
                              child: ElevatedButton(
                                onPressed: () {
                                  weatherProvider
                                      .fetchWeather(weather.cityName);
                                },
                                style: ElevatedButton.styleFrom(
                                  foregroundColor: Colors.grey[800],
                                  backgroundColor: Colors.white, // text color
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 50, vertical: 15),
                                ),
                                child: Text('Refresh'),
                              ),
                            ),
                          ],
                        ),
                      )
                    : Center(
                        child: Text('No weather data'),
                      ),
      ),
    );
  }
}
