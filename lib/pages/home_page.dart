import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/models/weathe_model.dart';
import 'package:weather_app/pages/search_page.dart';
import 'package:weather_app/providers/weather-provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  void updateUi() {
    setState(() {});
  }

  WeatherModel? weatherData;
  @override
  Widget build(BuildContext context) {
    weatherData = Provider.of<weatherProvider>(context).weatherData;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Weather App'),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return SearchPage(
                  updateUi: updateUi,
                );
              }));
            },
            icon: const Icon(
              Icons.search,
            ),
          )
        ],
      ),
      body: weatherData == null
          ? Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: const [
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
                  )
                ],
              ),
            )
          : Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    weatherData!.getThemeColor(),
                    weatherData!.getThemeColor()[300]!,
                    weatherData!.getThemeColor()[100]!,
                  ],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Spacer(
                    flex: 3,
                  ),
                  Text(
                    Provider.of<weatherProvider>(context).cityName!,
                    style: const TextStyle(
                      fontSize: 32.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    'updated: ${weatherData!.date}',
                    style: const TextStyle(
                      fontSize: 22.0,
                    ),
                  ),
                  const Spacer(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Image.asset(weatherData!.getImage()),
                      Text(
                        weatherData!.Temp.toInt().toString(),
                        style: const TextStyle(
                          fontSize: 32.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Column(
                        children: [
                          Text(
                            'maxTemp : ${weatherData!.maxTemp.toInt()}',
                          ),
                          Text(
                            'minTemp :${weatherData!.minTemp.toInt()}',
                          ),
                        ],
                      ),
                    ],
                  ),
                  const Spacer(),
                  Text(
                    weatherData!.weatherStateName,
                    style: const TextStyle(
                      fontSize: 32.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const Spacer(
                    flex: 3,
                  ),
                ],
              ),
            ),
    );
  }
}
