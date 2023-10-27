import 'package:circular_loading_demo/animated_loader.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

// Standard MyApp class
class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Circular Loading Demo',
      theme: ThemeData.light().copyWith(
        // Change the background color of the app
        scaffoldBackgroundColor: Color.fromARGB(255, 34, 33, 32),
      ),
      home: const AnimationDemo(),
    );
  }
}

class AnimationDemo extends StatefulWidget {
  const AnimationDemo({super.key});

  @override
  State<AnimationDemo> createState() => _AnimationDemoState();
}

class _AnimationDemoState extends State<AnimationDemo>
    with TickerProviderStateMixin {
  // the percentage variable dictates the length arc length of the rings, as well as the centred text
  double percentage = 0.0;

  // the animation controller for the percentage variable
  late AnimationController _percentageController;

  // the animation controller for the continual rotation of the rings
  late AnimationController _animationController;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this, // the SingleTickerProviderStateMixin
      duration: const Duration(seconds: 2, milliseconds: 500),
    );

    _animationController.addListener(() {
      setState(() {});
    });

    _animationController.repeat(reverse: false);

    _percentageController = AnimationController(
      vsync: this,
      duration: const Duration(
        seconds: 3,
      ),
    );

    // We start off the animation by changing the percentage
    startAnimation();
  }

  // Function to mock a loading task - providing the animation controller with new percentages
  // Play around with the timing of the Future.delayed() functions to see how the animation changes
  void startAnimation() async {
    setNewPercentage(6);
    await Future.delayed(const Duration(seconds: 3));
    setNewPercentage(24);
    await Future.delayed(const Duration(seconds: 4));
    setNewPercentage(86);
    await Future.delayed(const Duration(seconds: 5));
    setNewPercentage(100);
  }

  void setNewPercentage(double newPercentage) {
    // We restart the animation controller to start from the current percentage and animate to the new percentage
    _percentageController = AnimationController(
        vsync: this,
        duration: const Duration(seconds: 4),
        lowerBound: percentage,
        upperBound: newPercentage);
    _percentageController.addListener(() {
      setState(() {
        percentage = _percentageController.value;
      });
    });

    // We start the animation
    _percentageController.forward();

    setState(() {
      percentage = newPercentage;
    });
  }

  @override
  void dispose() {
    _animationController.dispose();
    _percentageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.width,
            child: CustomPaint(
              painter: LoadingPainter(
                animValue: _animationController.value,
                percentage: percentage,

                // Change the colors provided to the painter, provided are a few examples

                // colors: [Color.fromARGB(255, 146, 146, 146), Colors.white],
                // colors: [Colors.red, Colors.red],
                colors: [Colors.blue, Colors.red, Colors.purple],

                // Change the text color of the centred text

                // textColor: Color.fromARGB(255, 51, 51, 51),
                // textColor: Colors.red,
              ),
            ),
          ),
          const SizedBox(height: 40),
          const Text(
            'LOADING...',
            style: TextStyle(
              fontSize: 26,
              fontWeight: FontWeight.w600,
              letterSpacing: 1,
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 100),
        ],
      ),
    );
  }
}
