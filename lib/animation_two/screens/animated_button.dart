import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';

class AnimatedButton extends StatefulWidget {
  const AnimatedButton({super.key});

  @override
  State<AnimatedButton> createState() => _AnimatedButtonState();
}

class _AnimatedButtonState extends State<AnimatedButton> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            //button 1
            MyButtonItem(
              color: Colors.white,
              child: Text(
                "Click here",
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
            ),

            //button 2
            MyButtonItem(
              color: Colors.purpleAccent,
              child: SizedBox(
                width: 250.0,
                child: DefaultTextStyle(
                  style: const TextStyle(
                    fontSize: 70.0,
                    fontFamily: 'Canterbury',
                  ),
                  child: AnimatedTextKit(
                    animatedTexts: [
                      ScaleAnimatedText('Think'),
                      ScaleAnimatedText('Build'),
                      ScaleAnimatedText('Ship'),
                    ],
                    onTap: () {
                      print("Tap Event");
                    },
                  ),
                ),
              ),
            ),

            //button 3
            MyButtonItem(
              color: Colors.orangeAccent,
              child: DefaultTextStyle(
                style: const TextStyle(fontSize: 20.0),
                child: AnimatedTextKit(
                  animatedTexts: [
                    WavyAnimatedText('Hello World'),
                    WavyAnimatedText('Look at the waves'),
                  ],
                  isRepeatingAnimation: true,
                  onTap: () {
                    print("Tap Event");
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class MyButtonItem extends StatefulWidget {
  const MyButtonItem({super.key, required this.child, required this.color});
  final Widget child;
  final Color color;

  @override
  State<MyButtonItem> createState() => _MyButtonItemState();
}

class _MyButtonItemState extends State<MyButtonItem>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 3000),
    );

    controller.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        controller.reverse();
      } else if (status == AnimationStatus.dismissed) {
        controller.forward(from: 0.0);
      }
    });

    controller.forward();
  }

  @override
  void dispose() {
    super.dispose();
    controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: AnimatedBuilder(
        animation: controller,
        builder: (context, index) {
          return Container(
            alignment: Alignment.center,
            padding: EdgeInsets.all(15),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              gradient: LinearGradient(
                colors: [Colors.purple, widget.color, Colors.blue],
                stops: [0.0, controller.value, 1.0],
              ),
            ),
            child: widget.child,
          );
        },
      ),
    );
  }
}
