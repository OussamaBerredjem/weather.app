import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather/pages/Search.dart';
import 'package:weather/provider/WeatherProvider.dart';

class home_page extends StatefulWidget {
  const home_page({Key? key}) : super(key: key);

  @override
  State<home_page> createState() => _home_page();
}

class _home_page extends State<home_page> {
  GlobalKey<ScaffoldState> scafoldstate = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.orange,
        appBar: AppBar(
          title: Text('Weather App'),
          actions: [
            IconButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return Search();
                  }));
                },
                icon: Icon(Icons.search))
          ],
        ),
        body: Provider.of<WeatherProvider?>(context)?.weatherData == null
            ? const Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      'there is no weather 😔 start',
                      style: TextStyle(
                        fontSize: 30,
                      ),
                    ),
                    Text(
                      'searching now 🔍',
                      style: TextStyle(
                        fontSize: 30,
                      ),
                    ),
                  ],
                ),
              )
            : Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(colors: [
                    Provider.of<WeatherProvider>(context)
                        .weatherData!
                        .themeColor(),
                    Provider.of<WeatherProvider>(context)
                        .weatherData!
                        .themeColor()[300]!,
                    Provider.of<WeatherProvider>(context)
                        .weatherData!
                        .themeColor()[100]!,
                  ], begin: Alignment.topCenter, end: Alignment.bottomCenter),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(top: 140, bottom: 3),
                      child: Text(
                        Provider.of<WeatherProvider>(context)
                            .weatherData!
                            .City
                            .toString(),
                        style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 33,
                            color: Colors.black54),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(bottom: 80),
                      child: Text(
                        "updated " +
                            Provider.of<WeatherProvider>(context)
                                .weatherData!
                                .Date,
                        style: TextStyle(color: Colors.black54, fontSize: 18),
                      ),
                    ),
                    Row(
                      children: [
                        MaterialButton(
                            child: Text("lick me"),
                            onPressed: () {
                              scafoldstate.currentState!
                                  .showBottomSheet((context) => Container(
                                        height: 200,
                                        color: Colors.green,
                                      ));
                            }),
                        Spacer(
                          flex: 1,
                        ),
                        Image.asset(
                          Provider.of<WeatherProvider>(context)
                              .weatherData!
                              .Path(),
                          height: 100,
                          width: 100,
                          scale: 1.0,
                          fit: BoxFit.contain,
                        ),
                        const Spacer(
                          flex: 2,
                        ),
                        Text(
                          Provider.of<WeatherProvider>(context)
                              .weatherData!
                              .Temp
                              .toString(),
                          style: const TextStyle(
                              color: Colors.black54,
                              fontSize: 28,
                              fontWeight: FontWeight.bold),
                        ),
                        const Spacer(
                          flex: 2,
                        ),
                        Column(
                          children: [
                            Text(
                              "min temp : " +
                                  Provider.of<WeatherProvider>(context)
                                      .weatherData!
                                      .Temp
                                      .toString(),
                              style: const TextStyle(
                                  color: Colors.black54,
                                  fontSize: 17,
                                  fontWeight: FontWeight.bold),
                            ),
                            Text(
                              "max temp : " +
                                  Provider.of<WeatherProvider>(context)
                                      .weatherData!
                                      .Temp
                                      .toString(),
                              style: const TextStyle(
                                  color: Colors.yellow,
                                  fontSize: 17,
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                        const Spacer(
                          flex: 1,
                        ),
                      ],
                    ),
                    const Spacer(
                      flex: 1,
                    ),
                    Text(
                      Provider.of<WeatherProvider>(context)
                          .weatherData!
                          .weatherStateName,
                      style: const TextStyle(
                          fontSize: 26,
                          fontWeight: FontWeight.bold,
                          color: Colors.black54),
                      textAlign: TextAlign.center,
                    ),
                    const Spacer(
                      flex: 2,
                    ),
                  ],
                ),
              ));
  }
}
