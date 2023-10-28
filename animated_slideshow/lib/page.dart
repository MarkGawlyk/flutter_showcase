import 'package:animated_slideshow/destination.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class AnimatedSlideshow extends StatelessWidget {
  AnimatedSlideshow({super.key});

  static List<String> titles = [
    'Big Sur',
    'Milan',
    'Mexico City',
    'Lofoten',
  ];

  static List<String> subtitles = [
    'California',
    'Italy',
    'Mexico',
    'Norway',
  ];

  final controller = PageController(keepPage: true);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PageView.builder(
            controller: controller,
            itemCount: 4,
            scrollDirection: Axis.vertical,
            itemBuilder: (context, index) {
              return Destination(
                bottom: index % 2 == 0,
                title: titles[index],
                body: subtitles[index],
                imageLoc: 'assets/image${index + 1}.jpg',
              );
            },
          ),
          Positioned(
            right: 10,
            top: MediaQuery.of(context).size.height / 2 - 80,
            child: SmoothPageIndicator(
              axisDirection: Axis.vertical,
              controller: controller,
              count: 4,
              effect: const ExpandingDotsEffect(
                dotColor: Color.fromARGB(255, 214, 214, 214),
                activeDotColor: Color.fromARGB(255, 84, 84, 84),
                dotHeight: 10,
                dotWidth: 10,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
