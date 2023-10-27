# flutter_showcase
A collection of demo widgets built in flutter.

## Demos

- [Circular Loading Demo](#circular-loading-demo)
- [Animated Vertical Slideshow](#animated-vertical-slideshow)

### Circular Loading Demo
A circular loading widget made with CustomPainter. 3 animated rings circle around indefinitely and grow as the percentage increases.

### Animated Vertical Slideshow
A vertical slideshow widget that animates between a list of widgets. The widget is built with a PageView and a PageController. The PageController is used to animate between the widgets. The PageView is wrapped in a GestureDetector to detect swipes and change the page accordingly. The PageView is also wrapped in a Listener to detect the direction of the swipe and change the animation direction accordingly.