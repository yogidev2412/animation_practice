import 'dart:math';

import 'package:flutter/material.dart';

class AnimationColorChange extends StatefulWidget {
  const AnimationColorChange({super.key});

  @override
  State<AnimationColorChange> createState() => _AnimationColorChangeState();
}

class _AnimationColorChangeState extends State<AnimationColorChange> {
  late List<Color> colorPallet = genColor();

  //generate color
  List<Color> genColor() {
    final random = Random();
    return List.generate(
      5,
      (_) => Color.fromRGBO(
        random.nextInt(256),
        random.nextInt(256),
        random.nextInt(256),
        1,
      ),
    );
  }

  //change the color
  void reGenColor() {
    setState(() {
      colorPallet = genColor();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Color Change",
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
      ),

      //body
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            //color plate
            for (Color color in colorPallet)
              AnimatedContainer(
                duration: Duration(milliseconds: 2000),
                curve: Curves.bounceInOut,
                width: 100,
                height: 100,
                color: color,
                margin: EdgeInsets.all(10),
              ),

            //change button
            ElevatedButton(
              onPressed: reGenColor,
              child: Text("Change Color Button"),
            ),
          ],
        ),
      ),
    );
  }
}
