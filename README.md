# WEATHER FORECAST APP

Welcome to Weather App, your personal weather forecast companion !!!

<img src="https://github.com/ShrutiJain418/WeatherApp/assets/113288105/b9ce6b85-251d-4f8b-9bc9-bff0dc0bf9bc" width="150">
<img src="https://github.com/ShrutiJain418/WeatherApp/assets/113288105/d959ea4f-c6fa-4c53-9b3f-1797b11279c8" width="150">
<img src="https://github.com/ShrutiJain418/WeatherApp/assets/113288105/71316566-a516-424f-855c-e8e9d26006df" width="150"><br>


The project uses the [OpenWeatherAPI](https://openweathermap.org/api) to fetch weather data, providing accurate and up-to-date weather information.


### Running the project

Before running, see instructions on how to [get an OpenWeatherAPI key](#getting-an-openweatherapi-key).


## App Overview

- **Splash Screen**:
 The animation provides a smooth transition into the app, enhancing the user experience. After the animation completes, users are taken to the Home screen.

- **Home Screen**:
 Users can type the name of a city in the provided text field.
 Upon entering the city name, users tap the "Get Weather" button to retrieve the latest weather data.

- **Weather Details Screen**:
 Shows comprehensive weather information including temperature, humidity, wind speed, and weather conditions.


## Features

- **Real-time Weather Data**: Get accurate weather information for any city.
- **Detailed Weather Information**: View temperature, weather conditions, humidity, and wind speed.
- **Persistent City Search**: Automatically saves your last searched city.
- **Simple and Intuitive Design**: Clean and minimalistic UI for easy navigation.
- **Responsive**: Works seamlessly across different devices.
- **Animated Transitions**: Smooth animations for a delightful user experience.


## App Structure

The project folders are structured like this:

```
/packages
  /core
    /lib
      /models
      /providers
      /screens
      /services
```


## Packages in use

The "core" package of the app uses the following packages:

- [shared_preferences](https://pub.dev/packages/shared_preferences) Enables simple data persistence for storing user preferences and settings locally, enhancing the user 
  experience by preserving app state between sessions.
- [http](https://pub.dev/packages/http) A composable, Future-based library for making HTTP requests.
- [provider](https://pub.dev/packages/provider) A wrapper around InheritedWidget to make them easier to use and more reusable.


## Getting an OpenWeatherAPI Key

Before running the app you need to [get the api key from OpenWeather website](https://openweathermap.org/api),


Congratulations, you're good to go. 😎
