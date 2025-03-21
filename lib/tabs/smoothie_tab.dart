import 'package:donut_app_2c_hector/utils/donut_tile.dart';
import 'package:flutter/material.dart';
import 'package:donut_app_2c_hector/cart/cart.dart';
import 'package:donut_app_2c_hector/cart/cart_item.dart';

class SmoothieTab extends StatelessWidget {
  final Cart cart; // Agregar la instancia de Cart

  // Lista de smoothies
  final List smoothiesOnSale = [
    [
      "Apple Smoothie",
      "Japan Kawaii",
      "50",
      Colors.blue,
      "lib/images/apple_smoothie.png"
    ],
    [
      "Berry Smoothie",
      "Core Desserts",
      "60",
      Colors.red,
      "lib/images/berry_smoothie.png"
    ],
    [
      "Carrot Smoothie",
      "Starbucks",
      "45",
      Colors.purple,
      "lib/images/carrot_smoothie.png"
    ],
    [
      "Fresh Smoothie",
      "Japan Kawaii",
      "35",
      Colors.brown,
      "lib/images/fresh_smoothie.png"
    ],
    [
      "Pear Smoothie",
      "Core Desserts",
      "50",
      Colors.blue,
      "lib/images/pear_smoothie.png"
    ],
    [
      "Pink Smoothie",
      "Starbucks",
      "45",
      Colors.red,
      "lib/images/pink_smoothie.png"
    ],
  ];

  SmoothieTab({super.key, required this.cart}); // Constructor que acepta el parámetro cart

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: smoothiesOnSale.length,
      padding: const EdgeInsets.all(12),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 1 / 1.5,
      ),
      itemBuilder: (context, index) {
        final smoothie = smoothiesOnSale[index];

        return DonutTile(
          donutFlavor: smoothie[0],
          donutProvider: smoothie[1],
          donutPrice: smoothie[2],
          donutColor: smoothie[3],
          imageName: smoothie[4],
          onTap: () {
            // Agregar el artículo al carrito
            cart.addItem(
              CartItem(
                productName: smoothie[0],
                productPrice: smoothie[2],
                quantity: 1,
                imageName: smoothie[4],
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