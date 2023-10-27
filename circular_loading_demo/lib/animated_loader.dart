// Painter that takes in a percentage and draws a loading animation
// Concentric circles that animate to the percentage given

import 'dart:math';
import 'package:flutter/material.dart';

class LoadingPainter extends CustomPainter {
  final List<Color> colors;
  final Color textColor;
  final double animValue;
  final double percentage;

  LoadingPainter({
    required this.animValue,
    required this.percentage,
    this.colors = const [
      Colors.blue,
      Colors.green,
      Colors.yellow,
      Colors.red,
      Colors.purple,
      Colors.orange,
    ],
    this.textColor = Colors.white,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final Offset center = Offset(size.width / 2, size.height / 2);

    final shadowPaint = Paint()
      ..shader = LinearGradient(
        begin: Alignment.bottomLeft,
        end: Alignment.topRight,
        colors: colors,
      ).createShader(
        Rect.fromCircle(
          center: center,
          radius: center.dx / 1.5,
        ),
      )
      ..style = PaintingStyle.stroke
      ..strokeWidth = 8
      ..maskFilter = const MaskFilter.blur(BlurStyle.solid, 10)
      ..strokeCap = StrokeCap.round;

    // Function to draw shadow and then the arc
    void drawArcWithShadow(Rect rect, double startAngle, double sweepAngle) {
      final Path arcPath = Path()
        ..moveTo(center.dx, center.dy)
        ..arcTo(rect, startAngle, sweepAngle, false)
        ..close();

      canvas.drawArc(rect, startAngle, sweepAngle, false, shadowPaint);
    }

    drawArcWithShadow(
      Rect.fromCenter(
          center: center, width: size.width * 0.8, height: size.height * 0.8),
      // use curve to animate to smooth out animation:
      -Curves.easeInOutBack.transform(animValue) * (2 * pi),
      (2 * pi) * (percentage / 100),
    );

    drawArcWithShadow(
      Rect.fromCenter(
          center: center, width: size.width * 0.7, height: size.height * 0.7),
      // use curve to animate to smooth out animation:
      Curves.easeInOutBack.transform(animValue) * (2 * pi) + 2,
      (2 * pi) * (percentage / 100),
    );

    drawArcWithShadow(
      Rect.fromCenter(
          center: center, width: size.width * 0.6, height: size.height * 0.6),
      // use curve to animate to smooth out animation:
      -Curves.easeInOutBack.transform(animValue) * (2 * pi) + 4,
      (2 * pi) * (percentage / 100),
    );

    // // Write percentage text in center, use the same shadow paint

    final textPainter = TextPainter(
      text: TextSpan(
        text: '${percentage.toInt()}',
        style: TextStyle(
          color: textColor,
          fontSize: size.width / 6,
          fontWeight: FontWeight.w600,
          letterSpacing: 5,
        ),
      ),
      textDirection: TextDirection.ltr,
    );

    textPainter.layout();

    textPainter.paint(
      canvas,
      Offset(
        center.dx - textPainter.width / 2,
        center.dy - textPainter.height / 2,
      ),
    );
  }

  @override
  bool shouldRepaint(covariant LoadingPainter oldDelegate) {
    return animValue != oldDelegate.animValue;
  }
}
