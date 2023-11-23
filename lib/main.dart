import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather/pages/home_page.dart';
import 'package:weather/provider/WeatherProvider.dart';

void main() {
  runApp(ChangeNotifierProvider(
    create: (context) {
      return WeatherProvider();
    },
    child: Home(),
  ));
}

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Provider
            .of<WeatherProvider>(context)
            .weatherData
            ?.themeColor(),
      ),
      home: home_page(),
    );
  }
}
