import 'package:flutter/material.dart';
import 'package:weather_ui/page.dart';

void main() {
  runApp(const MyApp());
}

// Standard MyApp class
class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Weather App',
      home: WeatherUI(),
    );
  }
}
