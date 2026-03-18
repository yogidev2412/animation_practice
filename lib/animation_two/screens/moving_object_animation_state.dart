import 'package:animation/animation_two/model/product_model.dart';
import 'package:flutter/material.dart';

class MovingObjectAnimationState extends StatefulWidget {
  const MovingObjectAnimationState({super.key});

  @override
  State<MovingObjectAnimationState> createState() =>
      _MovingObjectAnimationStateState();
}

class _MovingObjectAnimationStateState extends State<MovingObjectAnimationState>
    with SingleTickerProviderStateMixin {
  late AnimationController animationController;
  late Animation<Offset> moveAnimation;

  @override
  void initState() {
    super.initState();
    animationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 500),
    );

    moveAnimation = Tween<Offset>(
      begin: Offset(0, 0),
      end: Offset(0, 0.1),
    ).animate(animationController);

    animationController.repeat(reverse: true);
  }

  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 41, 41, 41),
      body: SafeArea(
        child: Column(
          children: [
            SlideTransition(
              position: moveAnimation,
              child: AnimatedSwitcher(
                duration: Duration(milliseconds: 500),
                child: Image.asset(
                  products[selectedIndex].image,
                  key: ValueKey<int>(selectedIndex),
                ),
              ),
            ),
            SizedBox(height: 25),
            Text(
              "BOAT ROCKZE 450R",
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 35,
              ),
            ),
            Text(
              "Bluthooth Headphone",
              style: TextStyle(color: Colors.grey, fontSize: 25),
            ),
            SizedBox(height: 25),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(products.length, (index) {
                return Container(
                  margin: EdgeInsets.symmetric(horizontal: 10),
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedIndex = index;
                      });
                    },
                    child: Container(
                      height: 50,
                      width: 50,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: products[index].color,
                        border: Border.all(
                          width: 2,
                          color: selectedIndex == index
                              ? Colors.white70
                              : Colors.transparent,
                        ),
                      ),
                      child: Icon(
                        Icons.check,
                        color: selectedIndex == index
                            ? Colors.white70
                            : Colors.transparent,
                      ),
                    ),
                  ),
                );
              }),
            ),
          ],
        ),
      ),
    );
  }
}
