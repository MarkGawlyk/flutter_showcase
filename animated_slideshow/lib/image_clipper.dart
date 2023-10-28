import 'package:flutter/material.dart';

class ImageClipper extends StatelessWidget {
  final bool bottom;
  final String imageLoc;

  const ImageClipper({super.key, required this.bottom, required this.imageLoc});

  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: bottom ? BottomClipper() : TopClipper(),
      child: Image.asset(
        imageLoc,
        // fill space
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        fit: BoxFit.cover,
      ),
    );
  }
}

Path getClip(Size size) {
  final path = Path();
  path.moveTo(size.width / 2, 0.0);
  path.lineTo(size.width, size.height);
  path.lineTo(0.0, size.height);
  path.close();
  return path;
}

class TopClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();
    path.moveTo(size.width, 0.0);
    path.lineTo(size.width, size.height * 0.7);
    path.lineTo(0.0, size.height * 0.85);
    path.lineTo(0.0, 0.0);

    path.close();
    return path;
  }

  @override
  bool shouldReclip(TopClipper oldClipper) => false;
}

class BottomClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();
    path.moveTo(size.width, size.height);
    path.lineTo(size.width, size.height * 0.3);
    path.lineTo(0.0, size.height * 0.15);
    path.lineTo(0.0, size.height);

    path.close();
    return path;
  }

  @override
  bool shouldReclip(BottomClipper oldClipper) => false;
}
