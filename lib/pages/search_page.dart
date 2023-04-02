import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/models/weathe_model.dart';
import 'package:weather_app/providers/weather-provider.dart';

import '../services/weather_services.dart';

class SearchPage extends StatelessWidget {
  String? cityName;
  SearchPage({Key? key, this.updateUi}) : super(key: key);
  VoidCallback? updateUi;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Search a city",
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Center(
          child: TextField(
            onChanged: (data) {
              cityName = data;
            },
            onSubmitted: (data) async {
              cityName = data;
              WeatherService service = WeatherService();
              WeatherModel? weather =
                  await service.getWeather(cityName: cityName!);
              Provider.of<weatherProvider>(context, listen: false).weatherData =
                  weather;
              Provider.of<weatherProvider>(context, listen: false).cityName =
                  cityName;
              Navigator.pop(context);
            },
            decoration: InputDecoration(
                hintText: "Enter City Name",
                border: const OutlineInputBorder(),
                label: const Text("Search"),
                suffixIcon: GestureDetector(
                  onTap: () async {
                    WeatherService service = WeatherService();
                    WeatherModel? weather =
                        await service.getWeather(cityName: cityName!);
                    Provider.of<weatherProvider>(context, listen: false)
                        .weatherData = weather;
                    Provider.of<weatherProvider>(context, listen: false)
                        .cityName = cityName;
                    Navigator.pop(context);
                  },
                  child: const Icon(
                    Icons.search,
                  ),
                ),
                contentPadding: const EdgeInsetsDirectional.symmetric(
                    horizontal: 24.0, vertical: 32.0)),
          ),
        ),
      ),
    );
  }
}
