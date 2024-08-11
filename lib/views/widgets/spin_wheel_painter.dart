import 'dart:math';

import 'package:flutter/material.dart';

class SpinWheelPainter extends CustomPainter {
  double piBy4 = cos(pi / 4);

  @override
  void paint(Canvas canvas, Size size) {
    final double d = size.height;
    final double r = d * .5;
    drawPizza(
      canvas,
      size,
      Offset(r, 0),
      Offset(r + r * piBy4, r - r * piBy4),
      Colors.green,
      text: "1",
    );
    drawPizza(
      canvas,
      size,
      Offset(r + r * piBy4, r - r * piBy4),
      Offset(d, r),
      Colors.blue,
      text: "2",
    );
    drawPizza(
      canvas,
      size,
      Offset(d, r),
      Offset(r + r * piBy4, r + r * piBy4),
      Colors.yellow,
      text: "3",
    );
    drawPizza(
      canvas,
      size,
      Offset(r + r * piBy4, r + r * piBy4),
      Offset(r, d),
      Colors.blueGrey,
      text: "4",
    );
    drawPizza(
      canvas,
      size,
      Offset(r, d),
      Offset(r - r * piBy4, r + r * piBy4),
      Colors.pink,
      text: "5",
    );
    drawPizza(
      canvas,
      size,
      Offset(r - r * piBy4, r + r * piBy4),
      Offset(0, r),
      Colors.orange,
      text: "6",
    );
    drawPizza(
      canvas,
      size,
      Offset(0, r),
      Offset(r - r * piBy4, r - r * piBy4),
      Colors.yellow,
      text: "7",
    );
    drawPizza(
      canvas,
      size,
      Offset(r - r * piBy4, r - r * piBy4),
      Offset(r, 0),
      Colors.white,
      text: "8",
    );
  }

  void drawPizza(
      Canvas canvas, Size size, Offset start, Offset end, Color color,
      {String text = "10"}) {
    final double d = size.height;
    final double r = d * .5;
    final double c = r;
    final paint = Paint();
    paint.color = color;
    Path path = Path();
    path.moveTo(c, c);
    path.lineTo(start.dx, start.dy);
    path.arcToPoint(end, radius: Radius.circular(r));
    path.close();
    canvas.drawPath(path, paint);

    final textSpan = TextSpan(
      text: text,
      style: const TextStyle(
        color: Colors.black,
        fontSize: 30,
      ),
    );
    final textPainter = TextPainter(
      text: textSpan,
      textDirection: TextDirection.ltr,
    );
    textPainter.layout(
      minWidth: 0,
      maxWidth: d / 4,
    );

    textPainter.paint(
        canvas, Offset((start.dx + end.dx) * .45, (start.dy + end.dy) * .44));
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
