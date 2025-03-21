import 'package:donut_app_2c_hector/utils/donut_tile.dart';
import 'package:flutter/material.dart';
import 'package:donut_app_2c_hector/cart/cart.dart';
import 'package:donut_app_2c_hector/cart/cart_item.dart';

class PancakesTab extends StatelessWidget {
  final Cart cart; // Agregar la instancia de Cart

  // Lista de pancakes
  final List pancakesOnSale = [
    [
      "Berry Cake",
      "El Globo",
      "36",
      Colors.blue,
      "lib/images/berry_cake.png"
    ],
    [
      "Black Cake",
      "Core Desserts",
      "45",
      Colors.red,
      "lib/images/black_cake.png"
    ],
    [
      "Blue Cake",
      "Fancy Dessert",
      "84",
      Colors.purple,
      "lib/images/blue_cake.png"
    ],
    [
      "Chocolate Cake",
      "Starbucks",
      "95",
      Colors.brown,
      "lib/images/chocolate_cake.png"
    ],
    [
      "Fancy",
      "Fancy Dessert",
      "36",
      Colors.blue,
      "lib/images/fancy_cake.png"
    ],
    [
      "Beloved",
      "Starbucks",
      "45",
      Colors.red,
      "lib/images/loved_cake.png"
    ],
  ];

  PancakesTab({super.key, required this.cart}); // Constructor que acepta el parámetro cart

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: pancakesOnSale.length,
      padding: const EdgeInsets.all(12),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 1 / 1.5,
      ),
      itemBuilder: (context, index) {
        final pancake = pancakesOnSale[index];

        return DonutTile(
          donutFlavor: pancake[0],
          donutProvider: pancake[1],
          donutPrice: pancake[2],
          donutColor: pancake[3],
          imageName: pancake[4],
          onTap: () {
            // Agregar el artículo al carrito
            cart.addItem(
              CartItem(
                productName: pancake[0],
                productPrice: pancake[2],
                quantity: 1,
                imageName: pancake[4],
              ),
            );
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text("Item added to cart")),
            );
          },
        );
      },
    );
  }
}