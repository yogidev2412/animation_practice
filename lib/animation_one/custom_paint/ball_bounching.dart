import 'package:flutter/material.dart';

class BallBounching extends StatefulWidget {
  const BallBounching({super.key});

  @override
  State<BallBounching> createState() => _BallBounchingState();
}

class _BallBounchingState extends State<BallBounching>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation<double> animation;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 2000),
    );
    animation = Tween<double>(begin: 0, end: 1).animate(controller);

    animation.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        controller.reverse();
      } else if (status == AnimationStatus.dismissed) {
        controller.forward();
      }
    });
    controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            //
            AnimatedBuilder(
              animation: animation,
              builder: (context, child) => CustomPaint(
                size: Size(200, 300),
                painter: Ball(animation.value),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class Ball extends CustomPainter {
  final double animationValue;
  Ball(this.animationValue);
  @override
  void paint(Canvas canvas, Size size) {
    canvas.drawCircle(
      Offset(size.width / 2, size.height - (size.height * animationValue)),
      30,
      Paint()..color = Colors.blue,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
