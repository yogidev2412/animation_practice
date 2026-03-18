import 'package:flutter/material.dart';

class Implicity extends StatefulWidget {
  const Implicity({super.key});

  @override
  State<Implicity> createState() => _ImplicityState();
}

class _ImplicityState extends State<Implicity> {
  bool isBig = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              children: [
                GestureDetector(
                  onTap: () {
                    setState(() {
                      isBig = !isBig;
                    });
                  },
                  child: AnimatedContainer(
                    curve: Curves.decelerate,
                    // transform: Matrix4.rotationZ(isBig ? 100 : 0),
                    duration: Duration(milliseconds: 1000),
                    width: isBig ? 120 : 100,
                    height: isBig ? 120 : 100,
                    color: Colors.amber,
                  ),
                ),
                SizedBox(height: 20),
                AnimatedOpacity(
                  opacity: isBig ? 0.8 : 0.1,
                  duration: Duration(milliseconds: 1000),
                  child: Container(width: 100, height: 100, color: Colors.blue),
                ),
                SizedBox(height: 20),
                AnimatedAlign(
                  alignment: isBig ? Alignment.bottomRight : Alignment.topLeft,
                  duration: Duration(milliseconds: 1000),
                  child: Container(
                    width: 100,
                    height: 100,
                    color: Colors.green,
                  ),
                ),
                SizedBox(height: 20),
                Container(
                  height: 50,
                  color: Colors.blue[100],
                  child: Stack(
                    children: [
                      AnimatedPositioned(
                        duration: Duration(milliseconds: 1000),
                        left: isBig ? 0.0 : 100.0,
                        right: isBig ? 100.0 : 0.0,
                        child: Container(height: 50, color: Colors.red),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 20),
                Opacity(
                  opacity: isBig ? 0.8 : 0.1,
                  child: Text(
                    "Opacity",
                    style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                  ),
                ),

                /// ✅ FIX: Wrap with Stack
                Container(
                  height: 150,
                  color: Colors.black12,
                  child: Stack(
                    children: [
                      AnimatedPositioned(
                        duration: Duration(milliseconds: 1000),
                        left: isBig ? 100 : 0,
                        top: isBig ? 50 : 0,
                        child: Container(
                          width: 100,
                          height: 100,
                          color: Colors.red,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
