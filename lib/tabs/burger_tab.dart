import 'package:donut_app_2c_hector/utils/donut_tile.dart';
import 'package:flutter/material.dart';
import 'package:donut_app_2c_hector/cart/cart.dart';
import 'package:donut_app_2c_hector/cart/cart_item.dart';

class BurgerTab extends StatelessWidget {
  final Cart cart; // Agregar la instancia de Cart

  // Lista de hamburguesas
  final List burgersOnSale = [
    [
      "Basic burger",
      "macdonals",
      "100",
      Colors.blue,
      "lib/images/basic_burger.png"
    ],
    [
      "Cheese burger",
      "monica burgers",
      "145",
      Colors.red,
      "lib/images/cheese_burger.png"
    ],
    [
      "Double burger",
      "burger king",
      "180",
      Colors.purple,
      "lib/images/double_burger.png"
    ],
    [
      "Steak burger",
      "Starbucks",
      "200",
      Colors.brown,
      "lib/images/steak_burger.png"
    ],
    [
      "Supreme burger",
      "la parrilla",
      "235",
      Colors.blue,
      "lib/images/supreme_burger.png"
    ],
    [
      "Tiny burger",
      "burger king",
      "45",
      Colors.red,
      "lib/images/tiny_burger.png"
    ],
    [
      "Basic burger",
      "macdonals",
      "90",
      Colors.blue,
      "lib/images/basic_burger.png"
    ],
    [
      "Cheese burger",
      "monica burgers",
      "145",
      Colors.red,
      "lib/images/cheese_burger.png"
    ],
  ];

  BurgerTab({super.key, required this.cart}); // Constructor que acepta el parámetro cart

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: burgersOnSale.length,
      padding: const EdgeInsets.all(12),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 1 / 1.5,
      ),
      itemBuilder: (context, index) {
        final burger = burgersOnSale[index];

        return DonutTile(
          donutFlavor: burger[0],
          donutProvider: burger[1],
          donutPrice: burger[2],
          donutColor: burger[3],
          imageName: burger[4],
          onTap: () {
            // Agregar el artículo al carrito
            cart.addItem(
              CartItem(
                productName: burger[0],
                productPrice: burger[2],
                quantity: 1,
                imageName: burger[4],
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