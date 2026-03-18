import 'package:flutter/material.dart';

class TweenAnimationO extends StatefulWidget {
  const TweenAnimationO({super.key});

  @override
  State<TweenAnimationO> createState() => _TweenAnimationOState();
}

class _TweenAnimationOState extends State<TweenAnimationO> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: TweenAnimationBuilder(
          tween: Tween<double>(begin: 0.0, end: 200),
          duration: Duration(milliseconds: 700),
          builder: (context, size, child) => Container(
            width: size,
            height: size,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.amber, 
            ),
          ),
        ),
      ),
    );
  }
}
