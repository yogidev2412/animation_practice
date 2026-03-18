import 'package:flutter/material.dart';

class ProductModel {
  final Color color;
  final String image;

  ProductModel({required this.color, required this.image});
}

List<ProductModel> products = [
  ProductModel(color: Color(0xff000000), image: "images/image11.png"),
  ProductModel(color: Color(0xfffcecd0), image: "images/image33.png"),
  ProductModel(color: Color(0xffb6d7e4), image: "images/image22.png"),
];
