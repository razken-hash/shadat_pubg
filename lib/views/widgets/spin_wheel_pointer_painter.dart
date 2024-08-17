import 'package:flutter/material.dart';

import 'dart:ui' as ui;

class SpinWheelPointerPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final double d = size.height;
    double r = d * .5;
    final paint = Paint();
    paint.color = const Color(0xFFF06F1D);

    Path path = Path();

    canvas.drawOval(
      Rect.fromLTWH(r - 40, r - 40, 80, 80),
      paint,
    );
    paint.shader = null;

    path.moveTo(r - 20, r - 30);
    path.lineTo(r, r - 70);
    path.lineTo(r + 20, r - 30);
    path.lineTo(r - 20, r - 30);
    path.close();
    canvas.drawPath(path, paint);

    paint.shader = ui.Gradient.linear(
      Offset(r, 0),
      Offset(r, d),
      [
        const Color(0xFFF3D34A),
        const Color.fromARGB(255, 240, 138, 29),
      ],
    );

    canvas.drawOval(
      Rect.fromLTWH(r - 30, r - 30, 60, 60),
      paint,
    );
    const textSpan = TextSpan(
      text: "WIN",
      style: TextStyle(
        color: Color(0xFFF06F1D),
        fontSize: 25,
        fontWeight: FontWeight.bold,
      ),
    );
    final textPainter = TextPainter(
      text: textSpan,
      textDirection: TextDirection.ltr,
    );
    textPainter.layout(
      minWidth: 0,
      maxWidth: d,
    );

    textPainter.paint(
      canvas,
      const Offset(16, 26),
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
