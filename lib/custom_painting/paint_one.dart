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
        child: CustomPaint(painter: LinePainter(), size: Size(300, 400)),
      ),
    );
  }
}

class LinePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint();

    paint.color = Colors.red;
    paint.strokeWidth = 10;
    paint.style = PaintingStyle.stroke;

    canvas.drawLine(Offset(-5, 0), Offset(305, 0), paint);
    canvas.drawLine(Offset(0, 400), Offset(300, 400), paint);
    canvas.drawLine(Offset.zero, Offset(0, 405), paint);
    canvas.drawLine(Offset(300, 0), Offset(300, 405), paint);

    //circle
    canvas.drawCircle(Offset(size.width / 2, size.width / 2), 40, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
