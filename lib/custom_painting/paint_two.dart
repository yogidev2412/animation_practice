import 'dart:ui';

import 'package:flutter/material.dart';
import 'dart:math' as math;

class PaintTwo extends StatefulWidget {
  const PaintTwo({super.key});

  @override
  State<PaintTwo> createState() => _PaintTwoState();
}

class _PaintTwoState extends State<PaintTwo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        // child: Container(
        //   color: Colors.grey[300],
        //   child: CustomPaint(painter: TwoPainter(), size: Size(300, 500)),
        // ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 15, sigmaY: 15),
            child: CustomPaint(
              painter: GlassPainter(),
              child: Container(
                width: 250,
                height: 150,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(color: Colors.white.withOpacity(0.3)),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class GlassPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Rect rect = Rect.fromLTWH(0, 0, size.width, size.height);

    Paint paint = Paint()
      ..shader = LinearGradient(
        colors: [
          Colors.white.withOpacity(0.25),
          Colors.white.withOpacity(0.05),
        ],
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
      ).createShader(rect);

    canvas.drawRRect(RRect.fromRectAndRadius(rect, Radius.circular(20)), paint);

    // ✨ Highlight effect
    Paint shine = Paint()
      ..shader = LinearGradient(
        colors: [Colors.white.withOpacity(0.6), Colors.transparent],
      ).createShader(Rect.fromLTWH(0, 0, size.width, size.height / 2));

    canvas.drawRRect(RRect.fromRectAndRadius(rect, Radius.circular(20)), shine);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

class TwoPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    // canvas.drawRect(
    //   Rect.fromCenter(
    //     center: Offset(size.width / 2, size.height / 2),
    //     width: 200,
    //     height: 200,
    //   ),
    //   Paint()
    //     ..color = Colors.blue
    //     ..style = PaintingStyle.fill,
    // );
    // canvas.drawRect(
    //   Rect.fromCenter(
    //     center: Offset(size.width / 2, size.height / 2),
    //     width: 100,
    //     height: 100,
    //   ),
    //   Paint()
    //     ..color = Colors.orange
    //     ..style = PaintingStyle.fill,
    // );
    // canvas.drawRect(
    //   Rect.fromLTWH(0, 0, 120, 300),
    //   Paint()
    //     ..color = Colors.yellow
    //     ..style = PaintingStyle.fill,
    // );

    // canvas.drawRect(
    //   Rect.fromLTWH(120, 0, 120, 300),
    //   Paint()
    //     ..color = Colors.orange
    //     ..style = PaintingStyle.fill,
    // );

    // canvas.drawRect(
    //   Rect.fromCenter(
    //     center: Offset(size.width * 0.6, size.height * 0.6),
    //     width: 120,
    //     height: 140,
    //   ),
    //   Paint()
    //     ..color = Colors.blue.withOpacity(0.5)
    //     ..style = PaintingStyle.fill,
    // );

    // Rect rect1 = Rect.fromCenter(
    //   center: Offset(size.width * 0.17, size.height * 0.2),
    //   width: 100,
    //   height: 200,
    // );
    // Rect rect2 = Rect.fromCenter(
    //   center: Offset(size.width * 0.54, size.height * 0.45),
    //   width: 120,
    //   height: 140,
    // );

    // RRect rOne = RRect.fromRectAndRadius(rect1, Radius.circular(20));
    // RRect rTwo = RRect.fromRectAndRadius(rect2, Radius.circular(20));
    // Path path1 = Path()
    //   ..addRRect(rOne)
    //   ..addOval(rect1)
    //   ..addArc(rect2, 0, math.pi / 2);
    // print(math.pi / 2);

    // canvas.drawPath(
    //   path1,
    //   Paint()
    //     ..color = Colors.blue
    //     ..style = PaintingStyle.stroke
    //     ..strokeWidth = 4,
    // );

    Paint paint = Paint()
      ..color = Colors.orange
      ..style = PaintingStyle.stroke
      ..strokeWidth = 4;

    Path path = Path();
    // path.moveTo(0, size.height / 2);
    // path.conicTo(size.width / 10, size.height, size.width, size.height / 2, 1);

    // canvas.drawPath(path, paint);

    path.lineTo(size.width / 2, 0);
    path.lineTo(size.width / 2, size.height / 2);
    path.lineTo(size.width, size.height / 2);
    path.lineTo(size.width, size.height);
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}

//

// import 'dart:math';
// import 'package:flutter/material.dart';

// class AnimatedWaveScreen extends StatefulWidget {
//   const AnimatedWaveScreen({super.key});

//   @override
//   State<AnimatedWaveScreen> createState() => _AnimatedWaveScreenState();
// }

// class _AnimatedWaveScreenState extends State<AnimatedWaveScreen>
//     with SingleTickerProviderStateMixin {
//   late AnimationController controller;

//   @override
//   void initState() {
//     super.initState();

//     controller = AnimationController(
//       vsync: this,
//       duration: const Duration(seconds: 2),
//     )..repeat(); // infinite animation
//   }

//   @override
//   void dispose() {
//     controller.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: AnimatedBuilder(
//         animation: controller,
//         builder: (context, child) {
//           return CustomPaint(
//             painter: WavePainter(controller.value),
//             size: Size.infinite,
//           );
//         },
//       ),
//     );
//   }
// }

// class WavePainter extends CustomPainter {
//   final double animationValue;

//   WavePainter(this.animationValue);

//   @override
//   void paint(Canvas canvas, Size size) {
//     final paint = Paint()
//       ..color = Colors.blue
//       ..style = PaintingStyle.fill;

//     final path = Path();

//     double waveHeight = 20;
//     double waveLength = size.width;

//     path.moveTo(0, size.height * 0.8);

//     for (double i = 0; i <= size.width; i++) {
//       double y =
//           size.height * 0.8 +
//           sin((i / waveLength * 2 * pi) + (animationValue * 2 * pi)) *
//               waveHeight;

//       path.lineTo(i, y);
//     }

//     path.lineTo(size.width, size.height);
//     path.lineTo(0, size.height);
//     path.close();
//     canvas.drawPath(path, paint);
//   }

//   @override
//   bool shouldRepaint(covariant WavePainter oldDelegate) => true;
// }
