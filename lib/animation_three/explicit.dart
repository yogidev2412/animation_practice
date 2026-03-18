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
                    color: Colors.amber,
                    child: Text(
                      "Fade Transition Animations",
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),

                ScaleTransition(
                  scale: scaleAnimation,
                  child: Container(
                    width: 200,
                    height: 100,
                    color: Colors.amber,
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

class GpayStylePopup extends StatefulWidget {
  const GpayStylePopup({super.key});

  @override
  State<GpayStylePopup> createState() => _GpayStylePopupState();
}

class _GpayStylePopupState extends State<GpayStylePopup>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;

  late Animation<Offset> slideAnimation;
  late Animation<double> fadeAnimation;
  late Animation<double> scaleAnimation;

  bool isOpen = false;

  @override
  void initState() {
    super.initState();

    controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 500),
    );

    slideAnimation = Tween<Offset>(
      begin: Offset(0, 1), // bottom
      end: Offset(0, 0),
    ).animate(CurvedAnimation(parent: controller, curve: Curves.easeOut));

    fadeAnimation = Tween<double>(begin: 0, end: 1).animate(controller);

    scaleAnimation = Tween<double>(
      begin: 0.9,
      end: 1,
    ).animate(CurvedAnimation(parent: controller, curve: Curves.easeOutBack));
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  void togglePopup() {
    if (isOpen) {
      controller.reverse();
    } else {
      controller.forward();
    }
    isOpen = !isOpen;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("GPay Style Animation")),
      body: Stack(
        children: [
          /// Main Screen
          Center(
            child: ElevatedButton(
              onPressed: togglePopup,
              child: Text("Show Popup"),
            ),
          ),

          /// 🔥 Background Fade
          FadeTransition(
            opacity: fadeAnimation,
            child: GestureDetector(
              onTap: togglePopup,
              child: Container(color: Colors.black54),
            ),
          ),

          /// 🔥 Popup
          Align(
            alignment: Alignment.bottomCenter,
            child: SlideTransition(
              position: slideAnimation,
              child: ScaleTransition(
                scale: scaleAnimation,
                child: Container(
                  height: 250,
                  padding: EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.vertical(
                      top: Radius.circular(20),
                    ),
                  ),
                  child: Column(
                    children: [
                      Text(
                        "Payment Successful 💸",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 20),
                      ElevatedButton(
                        onPressed: togglePopup,
                        child: Text("Close"),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
