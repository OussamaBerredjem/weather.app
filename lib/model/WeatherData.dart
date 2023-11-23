import 'package:flutter/material.dart';

class WeatherData {
  String weatherStateName, Date, City;
  double minTemp, maxTemp, Temp;

  WeatherData({required this.City,
    required this.weatherStateName,
    required this.Date,
    required this.minTemp,
    required this.maxTemp,
    required this.Temp});

  factory WeatherData.fromJson(data) {
    return WeatherData(
      City: data['location']['region'],
      weatherStateName: data['current']['condition']['text'],
      Date: data['current']['last_updated'],
      minTemp: data['current']['temp_c'],
      maxTemp: data['current']['temp_c'],
      Temp: data['current']['temp_c'],
    );
  }


  String Path() {
    if (weatherStateName.contains("cloud")) {
      return "assets/images/cloudy.png";
    } else if (weatherStateName.contains("snow")) {
      return "assets/images/snow.png";
    } else if (weatherStateName.contains("rain")) {
      return "assets/images/rainy.png";
    } else if (weatherStateName.contains("clear")) {
      return "assets/images/clear.png";
    } else if (weatherStateName.contains("overcast")) {
      return "clear";
    } else if (weatherStateName.contains("thunder")) {
      return "assets/images/thunderstorm.png";
    }
    return "assets/images/clear.png";
  }

  MaterialColor themeColor() {
    if (weatherStateName.contains("cloud")) {
      return Colors.blue;
    } else if (weatherStateName.contains("snow")) {
      return Colors.grey;
    } else if (weatherStateName.contains("rain")) {
      return Colors.cyan;
    } else if (weatherStateName.contains("clear")) {
      return Colors.orange;
    } else if (weatherStateName.contains("overcast")) {
      return Colors.green;
    } else if (weatherStateName.contains("cloud")) {
      return Colors.blue;
    }
    return Colors.deepOrange;
  }

  @override
  String toString() {
    return "region : " +
        weatherStateName +
        "\nDate : " +
        Date +
        "\nTemperature : " +
        Temp.toString();
  }
}
