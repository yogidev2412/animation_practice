import 'package:flutter/material.dart';

class ExplicitAnimations extends StatefulWidget {
  const ExplicitAnimations({super.key});

  @override
  State<ExplicitAnimations> createState() => _ExplicitAnimationsState();
}

class _ExplicitAnimationsState extends State<ExplicitAnimations>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation<double> animation;
  late Animation<double> fadeAnimation;
  late Animation<double> scaleAnimation;
  late Animation<Offset> slideAnimation;
  late Animation<double> rotationAnimation;
  late Animation<double> anitClockRotationAnimation;

  @override
  void initState() {
    super.initState();

    controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 2),
    );

    animation = Tween<double>(
      begin: 0.0,
      end: 100,
    ).animate(CurvedAnimation(parent: controller, curve: Curves.easeInOut));

    fadeAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(parent: controller, curve: Curves.easeInOut));

    scaleAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(parent: controller, curve: Curves.easeInOut));

    slideAnimation = Tween<Offset>(
      begin: Offset(-2.5, 0),
      end: Offset(0, 0),
    ).animate(CurvedAnimation(parent: controller, curve: Curves.easeInOut));

    rotationAnimation = Tween<double>(
      begin: 0,
      end: 1,
    ).animate(CurvedAnimation(parent: controller, curve: Curves.easeInOut));

    anitClockRotationAnimation = Tween<double>(
      begin: 0,
      end: -1,
    ).animate(CurvedAnimation(parent: controller, curve: Curves.easeInOut));

    controller.forward();

    controller.addListener(() {
      setState(() {
        if (controller.status == AnimationStatus.completed) {
          controller.reverse();
        } else if (controller.status == AnimationStatus.dismissed) {
          controller.forward();
        }
      });
    });
  }

  @override
  void dispose() {
    super.dispose();
    controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnimatedBuilder(
        animation: controller,
        builder: (context, asyncSnapshot) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Container(
                //   height: animation.value,
                //   width: animation.value,

                //   decoration: BoxDecoration(
                //     color: Colors.red,
                //     borderRadius: BorderRadius.circular(100),
                //   ),
                // ),
                Container(
                  height: 100,
                  width: animation.value,

                  decoration: BoxDecoration(
                    color: Colors.red,
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                SizedBox(height: 20),

                FadeTransition(
                  opacity: fadeAnimation,
                  child: Container(
                    width: 100,
                    height: 100,
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: Colors.amber,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Center(
                      child: Text(
                        "Fade Transition Animations",
                        style: TextStyle(
                          fontSize: 10,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),

                SizedBox(height: 20),
                ScaleTransition(
                  scale: scaleAnimation,
                  child: Container(
                    width: 100,
                    height: 100,
                    decoration: BoxDecoration(
                      color: Colors.amber,
                      borderRadius: BorderRadius.circular(100),
                    ),
                  ),
                ),

                SizedBox(height: 20),

                SlideTransition(
                  position: slideAnimation,
                  child: AnimatedOpacity(
                    duration: Duration(seconds: 1),
                    opacity: fadeAnimation.value,
                    child: Container(
                      width: 100,
                      height: 100,
                      decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                ),

                SizedBox(height: 20),

                Stack(
                  alignment: Alignment.center,
                  children: [
                    RotationTransition(
                      turns: rotationAnimation,
                      child: Container(
                        width: 130,
                        height: 130,
                        decoration: BoxDecoration(
                          color: Colors.green,
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                    RotationTransition(
                      turns: anitClockRotationAnimation,
                      child: Container(
                        width: 100,
                        height: 100,
                        decoration: BoxDecoration(
                          color: Colors.amber,
                          borderRadius: BorderRadius.circular(30),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
