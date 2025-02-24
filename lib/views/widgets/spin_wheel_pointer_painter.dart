import 'package:flutter/material.dart';

import 'dart:ui' as ui;

import 'package:shadat_pubg/views/themes/colors.dart';

class SpinWheelPointerPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final double d = size.height;
    double r = d * .5;
    final paint = Paint();
    paint.color = PubgColors.orangeColor;

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
        PubgColors.yellowColor,
        const Color.fromARGB(255, 240, 138, 29),
      ],
    );

    canvas.drawOval(
      Rect.fromLTWH(r - 30, r - 30, 60, 60),
      paint,
    );
    const textSpan = TextSpan(
      text: "WiN",
      style: TextStyle(
          color: PubgColors.orangeColor,
          fontSize: 25,
          fontWeight: FontWeight.bold,
          fontFamily: "ElMessiri"),
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
      const Offset(18, 26),
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
