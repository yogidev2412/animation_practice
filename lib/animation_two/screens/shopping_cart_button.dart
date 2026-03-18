import 'package:flutter/material.dart';

class ShoppingCartButton extends StatefulWidget {
  const ShoppingCartButton({super.key});

  @override
  State<ShoppingCartButton> createState() => _ShoppingCartButtonState();
}

class _ShoppingCartButtonState extends State<ShoppingCartButton> {
  bool isExp = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: GestureDetector(
          onTap: () {
            setState(() {
              isExp = !isExp;
            });
          },
          child: AnimatedContainer(
            duration: Duration(milliseconds: 500),
            width: isExp ? 220 : 90,
            height: 60,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(isExp ? 50 : 10),
              color: isExp ? Colors.green : Colors.purpleAccent,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                if (isExp) SizedBox(width: 40),
                Icon(
                  isExp ? Icons.check : Icons.shopping_cart,
                  size: 24,
                  color: Colors.white,
                ),
                if (isExp)
                  Expanded(
                    child: Text(
                      "  Add to cart",
                      maxLines: 1,
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
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
