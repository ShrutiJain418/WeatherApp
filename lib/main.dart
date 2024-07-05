// // ignore_for_file: prefer_const_constructors

// import 'dart:async';
// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import 'providers/weather_provider.dart';
// import 'screens/home_screen.dart';

// void main() {
//   runApp(MyApp());
// }

// class MyApp extends StatefulWidget {
//   @override
//   _MyAppState createState() => _MyAppState();
// }

// class _MyAppState extends State<MyApp> {
//   bool _showSplash = true;

//   // @override
//   // void initState() {
//   //   super.initState();
//   //   Timer(Duration(seconds: 5), () {
//   //     setState(() {
//   //       _showSplash = false;
//   //     });
//   //   });
//   // }

//   @override
//   Widget build(BuildContext context) {
//     return ChangeNotifierProvider(
//       create: (_) => WeatherProvider(),
//       child: MaterialApp(
//         debugShowCheckedModeBanner: false,
//         title: 'Weather App',
//         theme: ThemeData(
//           primarySwatch: Colors.blue,
//         ),
//         home: _showSplash ? SplashScreen() : HomeScreen(),
//       ),
//     );
//   }
// }

// class SplashScreen extends StatefulWidget {
//   @override
//   _SplashScreenState createState() => _SplashScreenState();
// }

// class _SplashScreenState extends State<SplashScreen>
//     with SingleTickerProviderStateMixin {
//   late AnimationController _controller;
//   late Animation<Offset> _slideAnimation;
//   late Animation<double> _zoomAnimation;

//   @override
//   void initState() {
//     super.initState();

//     _controller = AnimationController(
//       duration: const Duration(seconds: 3),
//       vsync: this,
//     );

//     _slideAnimation = Tween<Offset>(
//       begin: Offset(-1, 0),
//       end: Offset(0, 0),
//     ).animate(
//       CurvedAnimation(parent: _controller, curve: Curves.easeInOut),
//     );

//     _zoomAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
//       CurvedAnimation(parent: _controller, curve: Curves.easeInOut),
//     );

//     _controller.forward();
//   }

//   @override
//   void dispose() {
//     _controller.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Container(
//         decoration: BoxDecoration(
//           gradient: LinearGradient(
//             colors: [Color(0xFFa1c4fd), Color(0xFFc2e9fb)],
//             begin: Alignment.topLeft,
//             end: Alignment.bottomRight,
//           ),
//         ),
//         child: Stack(
//           children: [
//             Center(
//               child: Column(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   Image.asset(
//                     'assets/images/img6.png',
//                     width: 250,
//                     height: 250,
//                     fit: BoxFit.contain,
//                   ),
//                   SizedBox(height: 20),
//                   SlideTransition(
//                     position: _slideAnimation,
//                     child: ScaleTransition(
//                       scale: _zoomAnimation,
//                       child: Padding(
//                         padding: const EdgeInsets.all(25.0),
//                         child: Text(
//                           'Forecast Freedom\nWeather at Your Fingertips',
//                           textAlign: TextAlign.center,
//                           style: TextStyle(
//                             fontSize: 30,
//                             fontWeight: FontWeight.bold,
//                             color: Colors.black,
//                           ),
//                         ),
//                       ),
//                     ),
//                   ),
//                   //SizedBox(height: 10),
//                   Text(
//                     'Seamless Access to Accurate Forecasts,\nAnytime, Anywhere!!!',
//                     textAlign: TextAlign.center,
//                     style: TextStyle(
//                       fontSize: 16,
//                       color: Colors.black54,
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//             Positioned(
//               bottom: 40,
//               left: 0,
//               right: 0,
//               child: Center(
//                 child: GestureDetector(
//                   onTap: () {
//                     // Navigate to HomeScreen after splash screen
//                     Navigator.of(context).pushReplacement(
//                       MaterialPageRoute(builder: (context) => HomeScreen()),
//                     );
//                   },
//                   child: Container(
//                     width: MediaQuery.of(context).size.width * 0.9,
//                     padding: EdgeInsets.symmetric(vertical: 15, horizontal: 40),
//                     decoration: BoxDecoration(
//                       borderRadius: BorderRadius.circular(30),
//                       color: Color(0xFF29b6f6), // Adjust color as needed
//                     ),
//                     child: Row(
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       children: [
//                         Center(
//                           child: Text(
//                             'Get Started',
//                             style: TextStyle(
//                               fontSize: 20,
//                               fontWeight: FontWeight.w500,
//                               color: Colors.grey[800],
//                             ),
//                           ),
//                         ),
//                         SizedBox(
//                           width: 5,
//                         ),
//                         Icon(
//                           Icons.arrow_forward,
//                           color: Colors.grey[800],
//                         )
//                       ],
//                     ),
//                   ),
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

import 'dart:async';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'providers/weather_provider.dart';
import 'screens/home_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool _showSplash = true;
  late String _lastSearchedCity;

  @override
  void initState() {
    super.initState();
    _loadLastSearchedCity();
    Timer(Duration(seconds: 5), () {
      setState(() {
        _showSplash = false;
      });
    });
  }

  Future<void> _loadLastSearchedCity() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      _lastSearchedCity = prefs.getString('lastSearchedCity') ?? '';
    });
  }

  Future<void> _saveLastSearchedCity(String cityName) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('lastSearchedCity', cityName);
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => WeatherProvider(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Weather App',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: _showSplash
            ? SplashScreen()
            : HomeScreen(lastSearchedCity: _lastSearchedCity),
      ),
    );
  }
}

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Offset> _slideAnimation;
  late Animation<double> _zoomAnimation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      duration: const Duration(seconds: 3),
      vsync: this,
    );

    _slideAnimation = Tween<Offset>(
      begin: Offset(-1, 0),
      end: Offset(0, 0),
    ).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeInOut),
    );

    _zoomAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeInOut),
    );

    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFFa1c4fd), Color(0xFFc2e9fb)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Stack(
          children: [
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    'assets/images/img6.png',
                    width: 250,
                    height: 250,
                    fit: BoxFit.contain,
                  ),
                  SizedBox(height: 20),
                  SlideTransition(
                    position: _slideAnimation,
                    child: ScaleTransition(
                      scale: _zoomAnimation,
                      child: Padding(
                        padding: const EdgeInsets.all(25.0),
                        child: Text(
                          'Forecast Freedom\nWeather at Your Fingertips',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Text(
                    'Seamless Access to Accurate Forecasts,\nAnytime, Anywhere!!!',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.black54,
                    ),
                  ),
                ],
              ),
            ),
            Positioned(
              bottom: 40,
              left: 0,
              right: 0,
              child: Center(
                child: GestureDetector(
                  onTap: () {
                    Navigator.of(context).pushReplacement(
                      MaterialPageRoute(
                          builder: (context) => HomeScreen(
                                lastSearchedCity: '',
                              )),
                    );
                  },
                  child: Container(
                    width: MediaQuery.of(context).size.width * 0.9,
                    padding: EdgeInsets.symmetric(vertical: 15, horizontal: 40),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      color: Color(0xFF29b6f6),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Get Started',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w500,
                            color: Colors.grey[800],
                          ),
                        ),
                        SizedBox(width: 5),
                        Icon(
                          Icons.arrow_forward,
                          color: Colors.grey[800],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
