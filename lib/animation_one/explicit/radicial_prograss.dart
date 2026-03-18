import 'package:flutter/material.dart';

class RadicialPrograss extends StatefulWidget {
  const RadicialPrograss({
    super.key,
    required this.prograsss,
    required this.color,
  });

  final double prograsss;
  final Color color;
  @override
  State<RadicialPrograss> createState() => _RadicialPrograssState();
}

class _RadicialPrograssState extends State<RadicialPrograss>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation<double> animation;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 1000),
    );

    animation = Tween<double>(
      begin: 0.0,
      end: widget.prograsss,
    ).animate(controller);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnimatedBuilder(
        animation: animation,
        builder: (context, child) => Center(
          child: Stack(
            alignment: Alignment.center,
            children: [
              SizedBox(
                height: 150,
                width: 150,
                child: CircularProgressIndicator(
                  value: animation.value,
                  strokeWidth: 15,
                  backgroundColor: Colors.grey.shade100,
                  color: widget.color,
                ),
              ),
              Text(
                "${(animation.value * 100).toInt()}%",
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: () {
          controller.forward();
        },
      ),
    );
  }
}
