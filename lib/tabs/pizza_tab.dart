import 'package:donut_app_2c_hector/utils/donut_tile.dart';
import 'package:flutter/material.dart';
import 'package:donut_app_2c_hector/cart/cart.dart';
import 'package:donut_app_2c_hector/cart/cart_item.dart';

class PizzaTab extends StatelessWidget {
  final Cart cart; // Agregar la instancia de Cart

  // Lista de pizzas
  final List pizzasOnSale = [
    [
      "Basic Pizza",
      "Pizzantino",
      "136",
      Colors.blue,
      "lib/images/basic_pizza.png"
    ],
    [
      "Double Pizza",
      "Chulitos Pizza",
      "145",
      Colors.red,
      "lib/images/double_pizza.png"
    ],
    [
      "Pepper Pizza",
      "Little Caesars",
      "184",
      Colors.purple,
      "lib/images/pepper_pizza.png"
    ],
    [
      "Pepperoni Pizza",
      "Dominos",
      "195",
      Colors.brown,
      "lib/images/pepperoni_pizza.png"
    ],
    [
      "Pineapple Pizza",
      "Dominos",
      "136",
      Colors.blue,
      "lib/images/pineapple_pizza.png"
    ],
    [
      "Vegan Pizza",
      "I Am Vegan",
      "45",
      Colors.red,
      "lib/images/vegan_pizza.png"
    ],
  ];

  PizzaTab({super.key, required this.cart}); // Constructor que acepta el parámetro cart

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: pizzasOnSale.length,
      padding: const EdgeInsets.all(12),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 1 / 1.5,
      ),
      itemBuilder: (context, index) {
        final pizza = pizzasOnSale[index];

        return DonutTile(
          donutFlavor: pizza[0],
          donutProvider: pizza[1],
          donutPrice: pizza[2],
          donutColor: pizza[3],
          imageName: pizza[4],
          onTap: () {
            // Agregar el artículo al carrito
            cart.addItem(
              CartItem(
                productName: pizza[0],
                productPrice: pizza[2],
                quantity: 1,
                imageName: pizza[4],
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