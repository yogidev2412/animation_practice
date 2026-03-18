import 'package:animation/animation_two/model/onbording_items_model.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class AnimationOnboardingScreen extends StatefulWidget {
  const AnimationOnboardingScreen({super.key});

  @override
  State<AnimationOnboardingScreen> createState() =>
      _AnimationOnboardingScreenState();
}

class _AnimationOnboardingScreenState extends State<AnimationOnboardingScreen> {
  final PageController pageController = PageController();
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          CustomPaint(
            painter: ArchPaint(),
            child: SizedBox(height: size.height / 1.35, width: size.width),
          ),

          //
          Positioned(
            top: 150,
            right: 0,
            left: 0,
            child: Lottie.network(
              onBordingItem[currentIndex].lottieURL!,

              fit: BoxFit.cover,
            ),
          ),

          //for scrolling
          Align(
            alignment: Alignment.bottomCenter,
            child: SizedBox(
              height: 270,
              child: Column(
                children: [
                  Flexible(
                    child: PageView.builder(
                      controller: pageController,
                      itemCount: onBordingItem.length,
                      itemBuilder: (context, index) {
                        final item = onBordingItem[index];
                        return Column(
                          children: [
                            Text(
                              item.title!,
                              style: TextStyle(
                                fontSize: 30,
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              ),
                            ),
                            SizedBox(height: 50),
                            Text(
                              item.subTitle!,
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 16,

                                color: Colors.black54,
                              ),
                            ),
                          ],
                        );
                      },
                      onPageChanged: (val) {
                        setState(() {
                          currentIndex = val;
                        });
                      },
                    ),
                  ),

                  //dot indicator
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      for (int index = 0; index < onBordingItem.length; index++)
                        dotIndicator(isSelected: index == currentIndex),
                    ],
                  ),

                  SizedBox(height: 30),
                ],
              ),
            ),
          ),
        ],
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: () {
          pageController.nextPage(
            duration: Duration(milliseconds: 500),
            curve: Curves.bounceOut,
          );
        },
        elevation: 0,
        backgroundColor: Colors.white,
        child: Icon(Icons.arrow_forward_ios, color: Colors.black),
      ),
    );
  }

  Widget dotIndicator({required bool isSelected}) {
    return Padding(
      padding: EdgeInsets.only(right: 7),
      child: AnimatedContainer(
        duration: Duration(milliseconds: 500),
        height: isSelected ? 8 : 6,
        width: isSelected ? 8 : 6,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: isSelected ? Colors.black : Colors.black26,
        ),
      ),
    );
  }
}

class ArchPaint extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Path orangeArc = Path()
      ..moveTo(0, 0)
      ..lineTo(0, size.height - 175)
      ..quadraticBezierTo(
        size.width / 2,
        size.height,
        size.width,
        size.height - 175,
      )
      ..lineTo(size.width, size.height)
      ..lineTo(size.width, 0)
      ..close();

    canvas.drawPath(orangeArc, Paint()..color = Colors.orange);

    //white arc
    Path whiteArc = Path()
      ..moveTo(0, 0)
      ..lineTo(0, size.height - 180)
      ..quadraticBezierTo(
        size.width / 2,
        size.height - 60,
        size.width,
        size.height - 180,
      )
      ..lineTo(size.width, size.height)
      ..lineTo(size.width, 0)
      ..close();

    canvas.drawPath(
      whiteArc,
      Paint()..color = Color.fromARGB(255, 144, 202, 249),
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
