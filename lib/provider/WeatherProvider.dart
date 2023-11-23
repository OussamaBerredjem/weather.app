import 'package:flutter/foundation.dart';
import 'package:weather/model/WeatherData.dart';

class WeatherProvider extends ChangeNotifier {
  WeatherData? _weatherData;

  set weatherData(WeatherData? value) {
    _weatherData = value;
    notifyListeners();
  }

  WeatherData? get weatherData => _weatherData;
}
