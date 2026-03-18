import 'package:animated_background/animated_background.dart';
import 'package:flutter/material.dart';

class BackgroundAnimated extends StatefulWidget {
  const BackgroundAnimated({super.key});

  @override
  State<BackgroundAnimated> createState() => _BackgroundAnimatedState();
}

class _BackgroundAnimatedState extends State<BackgroundAnimated>
    with SingleTickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnimatedBackground(
        vsync: this,
        behaviour: RandomParticleBehaviour(
          options: ParticleOptions(
            baseColor: Colors.pink,
            spawnMaxRadius: 30,
            spawnMinSpeed: 15,
            spawnMaxSpeed: 40,
            particleCount: 80,
            spawnOpacity: 0.1,
            // image: Image.network(
            //   "https://static.vecteezy.com/system/resources/thumbnails/016/717/262/small/education-object-rocket-illustration-3d-png.png",
            // ),
          ),
        ),
        child: Center(child: Text("Animated Background")),
      ),
    );
  }
}
