import 'package:flutter/material.dart';

class ShoppingCart extends StatefulWidget {
  const ShoppingCart({super.key});

  @override
  State<ShoppingCart> createState() => _ShoppingCartState();
}

class _ShoppingCartState extends State<ShoppingCart> {
  bool isExpand = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            //button
            GestureDetector(
              onTap: () {
                print("this");

                setState(() {
                  isExpand = !isExpand;
                });
              },
              child: AnimatedContainer(
                duration: Duration(milliseconds: 1000),
                height: 60,
                // ignore: dead_code
                width: isExpand ? 300 : 80,
                decoration: BoxDecoration(
                  color: isExpand ? Colors.green : Colors.blue,
                  borderRadius: BorderRadius.circular(10),
                ),

                child: isExpand
                    ? Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(width: 20),

                          Icon(Icons.check, color: Colors.white),
                          SizedBox(width: 20),
                          if (isExpand)
                            Text(
                              "Well Done",
                              style: TextStyle(
                                fontSize: 16,
                                color: Colors.white,
                                overflow: TextOverflow.ellipsis,
                              ),
                              overflow: TextOverflow.ellipsis,
                            ),
                        ],
                      )
                    : Icon(Icons.shopping_cart, color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
