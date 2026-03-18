import 'dart:math';
import 'package:flutter/material.dart';

class DownloadButton extends StatefulWidget {
  const DownloadButton({super.key});

  @override
  State<DownloadButton> createState() => _DownloadButtonState();
}

class _DownloadButtonState extends State<DownloadButton>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 6),
    );

    // controller.addStatusListener((status) {
    //   if (status == AnimationStatus.completed) {
    //     controller.reset();
    //   }
    // });
  }

  //for width change
  late final Animation<double> width = Tween<double>(begin: 250, end: 110)
      .animate(
        CurvedAnimation(
          parent: controller,
          curve: Interval(0.0, 0.3, curve: Curves.fastOutSlowIn),
        ),
      );

  //for fontsize change
  late final Animation<double> arc = Tween<double>(begin: 0.0, end: 2 * pi)
      .animate(
        CurvedAnimation(
          parent: controller,
          curve: Interval(0.3, 0.8, curve: Curves.fastOutSlowIn),
        ),
      );

  //for circlur arc change
  late final Animation<double> fontSized = Tween<double>(begin: 30, end: 0)
      .animate(
        CurvedAnimation(
          parent: controller,
          curve: Interval(0.0, 0.3, curve: Curves.fastOutSlowIn),
        ),
      );

  //for line
  Offset firstDot = Offset(-15, 5);
  Offset firstCommen = Offset(-5, -15);
  Offset secondDot = Offset(20, -10);

  late final Animation<Offset> first =
      Tween<Offset>(begin: firstDot, end: firstCommen).animate(
        CurvedAnimation(
          parent: controller,
          curve: Interval(0.9, 0.99, curve: Curves.fastOutSlowIn),
        ),
      );

  late final Animation<Offset> second =
      Tween<Offset>(begin: firstCommen, end: secondDot).animate(
        CurvedAnimation(
          parent: controller,
          curve: Interval(0.9, 0.99, curve: Curves.fastOutSlowIn),
        ),
      );

  //dot pointer

  late final Animation<Offset> centerDot =
      Tween<Offset>(begin: Offset.zero, end: firstDot).animate(
        CurvedAnimation(
          parent: controller,
          curve: Interval(0.8, 0.9, curve: Curves.fastOutSlowIn),
        ),
      );

  //for animating dot size
  late final Animation<double> dotSize = Tween<double>(begin: 8.0, end: 3.0)
      .animate(
        CurvedAnimation(
          parent: controller,
          curve: Interval(0.8, 0.9, curve: Curves.fastOutSlowIn),
        ),
      );
  //for animating dot opacity
  late final Animation<double> dotOpacity = Tween<double>(begin: 0.0, end: 1.0)
      .animate(
        CurvedAnimation(
          parent: controller,
          curve: Interval(0.3, 0.3, curve: Curves.fastOutSlowIn),
        ),
      );

  //for opacity change
  late final Animation<double> opacity =
      TweenSequence([
        TweenSequenceItem(
          tween: Tween<double>(
            begin: 0.0,
            end: 1.0,
          ).chain(CurveTween(curve: Curves.fastOutSlowIn)),
          weight: 50,
        ),
        TweenSequenceItem(
          tween: Tween<double>(
            begin: 0.1,
            end: 0.0,
          ).chain(CurveTween(curve: Curves.fastOutSlowIn)),
          weight: 50,
        ),
      ]).animate(
        CurvedAnimation(
          parent: controller,
          curve: Interval(0.03, 0.5, curve: Curves.fastOutSlowIn),
        ),
      );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: GestureDetector(
          onTap: () {
            controller.forward();
          },
          child: AnimatedBuilder(
            animation: controller,
            builder: (context, index) {
              return Stack(
                alignment: Alignment.center,
                children: [
                  Container(
                    width: width.value,
                    height: 110,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.blue, width: 5),
                      color: Colors.blue[100],
                      borderRadius: BorderRadius.circular(80),
                    ),
                    child: Text(
                      "Download",
                      style: TextStyle(
                        fontSize: fontSized.value,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),

                  Opacity(
                    opacity: opacity.value,
                    child: Icon(
                      Icons.arrow_downward,
                      size: 55,
                      color: Colors.black,
                    ),
                  ),

                  CustomPaint(
                    painter: ArcPaint(startAngle: -pi / 2, endAngle: arc.value),
                  ),
                  CustomPaint(
                    painter: LinerPaint(
                      first: first,
                      second: second,
                      firstDot: firstDot,
                      firstCommen: firstCommen,
                      secondDot: secondDot,
                    ),
                  ),
                  Opacity(
                    opacity: dotOpacity.value,
                    child: CustomPaint(
                      painter: DotPainter(
                        radius: dotSize.value,
                        offset: centerDot.value,
                      ),
                    ),
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}

class ArcPaint extends CustomPainter {
  final double startAngle;
  final double endAngle;
  ArcPaint({super.repaint, required this.startAngle, required this.endAngle});

  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset.zero;
    final paint = Paint()
      ..color = Colors.blue
      ..strokeWidth = 10
      ..style = PaintingStyle.fill;

    final rect = Rect.fromCircle(center: center, radius: 40);

    canvas.drawArc(rect, startAngle, endAngle, true, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}

class LinerPaint extends CustomPainter {
  final Animation<Offset> first;
  final Animation<Offset> second;
  final Offset firstDot;
  final Offset firstCommen;
  final Offset secondDot;

  LinerPaint({
    super.repaint,
    required this.first,
    required this.second,
    required this.firstDot,
    required this.firstCommen,
    required this.secondDot,
  });
  @override
  void paint(Canvas canvas, Size size) {
    double radius = 3;
    final paint = Paint()
      ..color = Colors.white
      ..strokeWidth = 0
      ..style = PaintingStyle.fill;

    if (first.value != firstDot) {
      canvas.drawCircle(firstDot, radius, paint);
    }

    canvas.drawLine(firstDot, first.value, paint);
    if (first.value != firstDot) {
      canvas.drawCircle(firstCommen, radius, paint);
    }

    canvas.drawLine(firstCommen, first.value, paint);
    if (second.value != firstCommen) {
      canvas.drawCircle(second.value, radius, paint);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}

class DotPainter extends CustomPainter {
  final double radius;
  final Offset offset;

  DotPainter({super.repaint, required this.radius, required this.offset});
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.white
      ..style = PaintingStyle.fill;

    canvas.drawCircle(offset, radius, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
