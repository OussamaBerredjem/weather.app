import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:weather/model/WeatherData.dart';

class Weather_Services {

  Future<WeatherData> getWeather(String city) async {
    Uri uri = Uri.parse(
        "http://api.weatherapi.com/v1/current.json?key=3677bed892474b30b7a122242220806&q=$city&aqi=no"
    );

    http.Response response = await http.get(uri);
    Map<String, dynamic> data = jsonDecode(response.body);

    return WeatherData.fromJson(data);
  }
}


