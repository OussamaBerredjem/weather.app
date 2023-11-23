import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';
import 'package:weather/model/WeatherData.dart';
import 'package:weather/provider/WeatherProvider.dart';
import 'package:weather/services/Weather_Services.dart';

class Search extends StatelessWidget {
  String? tmp;

  Search({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Search"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              onChanged: (data) {
                tmp = data;
              },
              onSubmitted: (data) async {
                Weather_Services weather = Weather_Services();
                WeatherData weatherdata = await weather.getWeather(data);

                Provider.of<WeatherProvider?>(context, listen: false)
                    ?.weatherData = weatherdata;

                Fluttertoast.showToast(
                  toastLength: Toast.LENGTH_LONG,
                  msg: weatherdata.toString(),
                  backgroundColor: Colors.redAccent,
                  gravity: ToastGravity.BOTTOM,
                );

                Navigator.pop(context);
              },
              decoration: InputDecoration(
                contentPadding: const EdgeInsets.only(left: 17),
                label: const Text('Search'),
                suffixIcon: IconButton(
                    onPressed: () async {
                      Weather_Services weather = Weather_Services();
                      WeatherData? weatherdata = await weather.getWeather(tmp!);

                      Provider.of<WeatherProvider>(context, listen: false)
                          .weatherData = weatherdata;

                      Navigator.pop(context);
                    },
                    icon: const Icon(Icons.search)),
                border: const OutlineInputBorder(),
                hintText: 'entre city name',
              ),
            ),
          ],
        ),
      ),
    );
  }
}
