import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/pages/home_page.dart';
import 'package:weather_app/providers/weather-provider.dart';

void main() {
  runApp(const WeatherApp());
}

class WeatherApp extends StatelessWidget {
  const WeatherApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (BuildContext context) => weatherProvider(),
      builder: (context, child) => MaterialApp(
        theme: ThemeData(
          primarySwatch:
              Provider.of<weatherProvider>(context).weatherData == null
                  ? Colors.blue
                  : Provider.of<weatherProvider>(context)
                      .weatherData!
                      .getThemeColor(),
        ),
        debugShowCheckedModeBanner: false,
        home: const HomePage(),
      ),
    );
  }
}
