import 'dart:math';

import 'package:flutter/material.dart';

class SpinWheelPainter extends CustomPainter {
  double piBy4 = cos(pi / 4);

  @override
  void paint(Canvas canvas, Size size) {
    final double d = size.height;
    double r = d * .5;
    double c = d * .5;

    final paint = Paint();
    paint.color = const Color(0xFFF3D34A);
    Path path = Path();
    path.moveTo(c, c);
    canvas.drawOval(
      Rect.fromLTWH(0, 0, d, d),
      paint,
    );

    paint.color = const Color(0xFFF06F1D);

    canvas.drawOval(
      Rect.fromLTWH(r - 7, 3, 14, 14),
      paint,
    );
    canvas.drawOval(
      Rect.fromLTWH(r - 7, d - 17, 14, 14),
      paint,
    );
    canvas.drawOval(
      Rect.fromLTWH(3, r - 7, 14, 14),
      paint,
    );
    canvas.drawOval(
      Rect.fromLTWH(d - 17, r - 7, 14, 14),
      paint,
    );

    canvas.drawOval(
      Rect.fromLTWH(r + r * piBy4 - 14, r - r * piBy4, 14, 14),
      paint,
    );
    canvas.drawOval(
      Rect.fromLTWH(r + r * piBy4 - 14, r + r * piBy4 - 14, 14, 14),
      paint,
    );
    canvas.drawOval(
      Rect.fromLTWH(r - r * piBy4 + 3, r + r * piBy4 - 14, 14, 14),
      paint,
    );
    canvas.drawOval(
      Rect.fromLTWH(r - r * piBy4 - 3, r - r * piBy4 + 3, 14, 14),
      paint,
    );

    double cosPiBy3 = cos(pi / 3);
    double sinPiBy3 = sin(pi / 3);
    paint.color = const Color(0xFFF3F6EF);

    canvas.drawOval(
      Rect.fromLTWH(r + r * cosPiBy3 - 26, r - r * sinPiBy3 - 6, 14, 14),
      paint,
    );
    canvas.drawOval(
      Rect.fromLTWH(r + r * sinPiBy3 - 8, r - r * cosPiBy3 + 12, 14, 14),
      paint,
    );
    canvas.drawOval(
      Rect.fromLTWH(r + r * sinPiBy3 - 6, r + r * cosPiBy3 - 30, 14, 14),
      paint,
    );
    canvas.drawOval(
      Rect.fromLTWH(r + r * cosPiBy3 - 28, r + r * sinPiBy3 - 7, 14, 14),
      paint,
    );

    canvas.drawOval(
      Rect.fromLTWH(r * cosPiBy3 + 14, r - r * sinPiBy3 - 7, 14, 14),
      paint,
    );

    canvas.drawOval(
      Rect.fromLTWH(15, r - r * cosPiBy3 + 15, 14, 14),
      paint,
    );
    canvas.drawOval(
      Rect.fromLTWH(15, r + r * cosPiBy3 - 28, 14, 14),
      paint,
    );
    canvas.drawOval(
      Rect.fromLTWH(r * cosPiBy3 + 14, r + r * sinPiBy3 - 8, 14, 14),
      paint,
    );

    path.close();
    paint.color = Colors.black;
    canvas.drawPath(path, paint);

    double newR = r - 20;

    Color firstColor = const Color(0xFFF1DEBD),
        secondColor = const Color(0xFFF4F4F4);

    drawPizza(
      canvas,
      size,
      Offset(r, 20),
      Offset(r + newR * piBy4, r - newR * piBy4),
      firstColor,
      text: "1",
    );
    drawPizza(
      canvas,
      size,
      Offset(r + newR * piBy4, r - newR * piBy4),
      Offset(d - 20, r),
      secondColor,
      text: "2",
    );
    drawPizza(
      canvas,
      size,
      Offset(d - 20, r),
      Offset(r + newR * piBy4, r + newR * piBy4),
      firstColor,
      text: "3",
    );
    drawPizza(
      canvas,
      size,
      Offset(r + newR * piBy4, r + newR * piBy4),
      Offset(r, d - 20),
      secondColor,
      text: "4",
    );
    drawPizza(
      canvas,
      size,
      Offset(r, d - 20),
      Offset(r - newR * piBy4, r + newR * piBy4),
      firstColor,
      text: "5",
    );
    drawPizza(
      canvas,
      size,
      Offset(r - newR * piBy4, r + newR * piBy4),
      Offset(20, r),
      secondColor,
      text: "6",
    );
    drawPizza(
      canvas,
      size,
      Offset(20, r),
      Offset(r - newR * piBy4, r - newR * piBy4),
      firstColor,
      text: "7",
    );
    drawPizza(
      canvas,
      size,
      Offset(r - newR * piBy4, r - newR * piBy4),
      Offset(r, 20),
      secondColor,
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

    paint.color = const Color(0xFFF3D34A);
    paint.strokeWidth = 4;
    canvas.drawLine(
        Offset(r, r), start.translate(int.parse(text) < 5 ? 2 : -2, 0), paint);

    final textSpan = TextSpan(
      text: text,
      style: const TextStyle(
        color: Colors.black,
        fontSize: 30,
        fontWeight: FontWeight.bold,
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
        canvas, Offset((start.dx + end.dx) * .48, (start.dy + end.dy) * .44));
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
