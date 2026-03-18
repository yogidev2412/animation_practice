import 'package:flutter/material.dart';

class ListAnimation extends StatefulWidget {
  const ListAnimation({super.key});

  @override
  State<ListAnimation> createState() => _ListAnimationState();
}

class _ListAnimationState extends State<ListAnimation>
    with SingleTickerProviderStateMixin {
  late AnimationController controllerl;
  late List<Animation<Offset>> slideAnimation = [];

  @override
  void initState() {
    super.initState();
    controllerl = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 4000),
    );

    slideAnimation = List.generate(
      5,
      (index) => Tween<Offset>(begin: Offset(-1, 0), end: Offset.zero).animate(
        CurvedAnimation(
          parent: controllerl,
          curve: Interval(index * (1 / 5), 1),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: 5,
        itemBuilder: (_, index) {
          return SlideTransition(
            position: slideAnimation[index],
            child: ListTile(title: Text("This is List Animation : $index")),
          );
        },
      ),

      //
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          if (controllerl.isCompleted) {
            controllerl.reverse();
          } else {
            controllerl.forward();
          }
        },
        child: Icon(Icons.create),
      ),
    );
  }
}
