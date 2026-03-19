import 'dart:ui';

import 'package:flutter/material.dart';

class PaintOne extends StatefulWidget {
  const PaintOne({super.key});

  @override
  State<PaintOne> createState() => _PaintOneState();
}

class _PaintOneState extends State<PaintOne> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Center(child: drawLine()));
  }

  Widget drawLine() {
    return AnimatedOpacity(
      opacity: 1.0,
      duration: Duration(seconds: 2),
      child: Container(
        color: Colors.grey[300],
        child: CustomPaint(painter: LinePainter(), size: Size(300, 500)),
      ),
    );
  }
}

class LinePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    // Paint paint = Paint();

    // paint.color = Colors.black;
    // paint.strokeWidth = 4;
    // paint.style = PaintingStyle.fill;

    // canvas.drawLine(Offset(-5, 0), Offset(305, 0), paint);
    // canvas.drawLine(Offset(0, 400), Offset(300, 400), paint);
    // canvas.drawLine(Offset.zero, Offset(0, 405), paint);
    // canvas.drawLine(Offset(300, 0), Offset(300, 405), paint);

    //circle
    // canvas.drawCircle(Offset(size.width / 2, size.width / 2), 40, paint);

    //rectangle
    // Offset center = Offset(size.width / 2, size.height / 2);

    // canvas.drawRect(
    //   Rect.fromCenter(
    //     center: Offset(size.width / 2, size.height / 2),
    //     width: 100,
    //     height: 200,
    //   ),
    //   paint,
    // );

    // canvas.drawRect(Rect.fromCircle(center: center, radius: 80), paint);

    // canvas.drawRect(Rect.fromLTRB(10, 10, 200, 100), paint);

    // canvas.drawRect(Rect.fromLTWH(10, 10, 200, 100), paint);

    //over
    // canvas.drawOval(
    //   Rect.fromCenter(center: center, width: 100, height: 200),
    //   paint,
    // );

    // canvas.drawOval(Rect.fromCircle(center: center, radius: 80), paint);

    // canvas.drawOval(Rect.fromLTRB(20, 160, 280, 230), paint);

    // canvas.drawOval(Rect.fromLTWH(20, 10, 260, 70), paint);

    // //rrect rounded rectangle
    // Rect rect = Rect.fromCenter(center: center, width: 100, height: 200);
    // Rect rect1 = Rect.fromCenter(center: center, width: 120, height: 220);
    // canvas.drawRRect(RRect.fromRectAndRadius(rect, Radius.circular(20)), paint);

    // canvas.drawRRect(
    //   RRect.fromRectAndCorners(rect, topLeft: Radius.circular(20)),
    //   paint,
    // );

    // canvas.drawRRect(
    //   RRect.fromLTRBR(10, 20, 100, 200, Radius.circular(30)),
    //   paint,
    // );

    // canvas.drawRRect(RRect.fromRectXY(rect, 50, 200), paint);

    //multiple rectangles
    // paint.color = Colors.blue;
    // paint.style = PaintingStyle.fill;

    // Rect bigRect = Rect.fromLTRB(10, 20, 100, 200);
    // Rect smallRect = Rect.fromLTRB(20, 30, 100, 190);
    // RRect rrectOne = RRect.fromRectXY(bigRect, 70, 25);
    // RRect rrectTwo = RRect.fromRectXY(smallRect, 70, 25);
    // canvas.drawDRRect(rrectOne, rrectTwo, paint);

    // canvas.drawColor(Colors.indigo, BlendMode.saturation);

    // paint.shader = ui.Gradient.linear(
    //   Offset.zero,
    //   Offset(size.width, size.height),
    //   [
    //     const Color.fromARGB(255, 87, 180, 246),
    //     const Color.fromARGB(255, 220, 231, 243),
    //   ],
    // );
    // canvas.clipRect(Offset.zero & size);
    // canvas.drawPaint(paint);

    // final List<Offset> points = [
    //   Offset.zero,
    //   Offset(size.width, 0),
    //   Offset(size.width / 2, size.height / 2),
    //   Offset.zero,
    // ];

    // canvas.drawPoints(PointMode.polygon, points, paint);

    // Path path = Path()
    //   ..addOval(
    //     Rect.fromCircle(
    //       center: Offset(size.width / 2, size.height / 2),
    //       radius: 80,
    //     ),
    //   );
    // canvas.drawShadow(path, Colors.red, 10, false);

    // canvas.drawPath(path, paint);

    //
    Paint backPaint = Paint()
      ..color = Colors.black
      ..style = PaintingStyle.fill;

    Paint roundPaint = Paint()
      ..color = Colors.blue
      ..style = PaintingStyle.fill;

    Rect rect = Rect.fromCenter(
      center: Offset(75, 150),
      width: 150,
      height: 300,
    );

    canvas.clipRRect(RRect.fromRectAndRadius(rect, Radius.circular(30)));
    canvas.drawRect(rect, backPaint);

    canvas.drawCircle(Offset(size.width / 2, size.height / 2), 70, roundPaint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
