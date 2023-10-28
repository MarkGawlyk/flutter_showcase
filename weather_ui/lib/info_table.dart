import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class InfoTable extends StatelessWidget {
  final String uvIndex;
  final String wind;
  final String humidity;
  final String pressure;
  final String airQuality;
  final String visibility;

  const InfoTable({
    super.key,
    required this.uvIndex,
    required this.wind,
    required this.humidity,
    required this.pressure,
    required this.airQuality,
    required this.visibility,
  });

  @override
  Widget build(BuildContext context) {
    // 2 x 3 grid of InfoRecords
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: SizedBox(
        height: MediaQuery.of(context).size.height * 0.2,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  InfoRecord(
                    title: 'UV Index',
                    value: uvIndex,
                  ),
                  InfoRecord(
                    title: 'Wind',
                    value: wind,
                  ),
                  InfoRecord(
                    title: 'Humidity',
                    value: humidity,
                  ),
                ],
              ),
            ),
            // const Padding(
            //   padding: EdgeInsets.symmetric(horizontal: 8.0),
            //   child: VerticalDivider(
            //     color: Colors.grey,
            //     thickness: 1,
            //   ),
            // ),
            const SizedBox(
              width: 60,
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  InfoRecord(
                    title: 'Pressure',
                    value: pressure,
                  ),
                  InfoRecord(
                    title: 'Air Quality',
                    value: airQuality,
                  ),
                  InfoRecord(
                    title: 'Visibility',
                    value: visibility,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class InfoRecord extends StatelessWidget {
  final String title;
  final String value;
  const InfoRecord({
    super.key,
    required this.title,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: const TextStyle(
            color: Colors.black,
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(
          width: 10,
        ),
        Text(
          value,
          style: const TextStyle(
            color: Colors.grey,
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
        ),
      ],
    );
  }
}
