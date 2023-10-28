import 'package:flutter/material.dart';
import 'package:weather_ui/forecast.dart';
import 'package:weather_ui/info_table.dart';

class WeatherUI extends StatelessWidget {
  const WeatherUI({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(40),
        child: AppBar(
          leading: const Icon(Icons.menu, color: Colors.black),
          title: const Text(
            'Weather Forecast',
            style: TextStyle(
              color: Colors.black,
              fontSize: 20,
              fontWeight: FontWeight.w600,
              letterSpacing: 1,
            ),
          ),
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(
            height: 30,
            width: double.infinity,
          ),
          Image.asset(
            'assets/sun.png',
            height: 50,
            width: 50,
            color: Color.fromARGB(255, 254, 182, 1),
          ),
          const SizedBox(
            height: 20,
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Text(
                '27.5',
                style: TextStyle(
                  color: Color.fromARGB(255, 0, 0, 0),
                  fontSize: 70,
                  fontWeight: FontWeight.w600,
                ),
              ),
              Text(
                '°',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 40,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 1,
          ),
          const Text(
            'Kiev, UKRAINE',
            style: TextStyle(
              color: Color.fromARGB(255, 156, 156, 156),
              fontSize: 20,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(
            height: 50,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: const [
              Forecast(
                hour: '16:00',
                color: Color.fromARGB(255, 245, 186, 84),
                temp: '25',
                icon: 'sun.png',
              ),
              Forecast(
                hour: '18:00',
                color: Color.fromARGB(255, 121, 187, 240),
                temp: '22',
                icon: 'rain.png',
              ),
              Forecast(
                hour: '20:00',
                color: Color.fromARGB(255, 182, 120, 223),
                temp: '18',
                icon: 'moon.png',
              ),
            ],
          ),
          const SizedBox(
            height: 50,
          ),
          const Padding(
            padding: EdgeInsets.only(left: 20.0),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Additional Info',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 22,
                  letterSpacing: 1,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          const InfoTable(
            uvIndex: '2',
            wind: '15km/h',
            humidity: '17%',
            pressure: '990 hPa',
            airQuality: '83%',
            visibility: '10 km',
          ),
        ],
      ),
    );
  }
}
