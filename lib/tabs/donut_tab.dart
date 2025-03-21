import 'package:donut_app_2c_hector/utils/donut_tile.dart';
import 'package:flutter/material.dart';
import 'package:donut_app_2c_hector/cart/cart.dart';
import 'package:donut_app_2c_hector/cart/cart_item.dart';

class DonutTab extends StatelessWidget {
  final Cart cart;

  //Lista de donas
  final List donutsOnSale = [
    // [ donutFlavor, provider, donutPrice, donutColor, imageName ]
    [
      "Ice Cream",
      "Krispy Kreme",
      "36",
      Colors.blue,
      "lib/images/icecream_donut.png"
    ],
    [
      "Strawberry",
      "Dunkin Donuts",
      "45",
      Colors.red,
      "lib/images/strawberry_donut.png"
    ],
    [
      "Grape Ape",
      "El Globo",
      "84",
      Colors.purple,
      "lib/images/grape_donut.png"
    ],
    [
      "Choco",
      "Starbucks",
      "95",
      Colors.brown,
      "lib/images/chocolate_donut.png"
    ],
    [
      "Ice Cream",
      "Krispy Kreme",
      "36",
      Colors.blue,
      "lib/images/icecream_donut.png"
    ],
    [
      "Strawberry",
      "Dunkin Donuts",
      "45",
      Colors.red,
      "lib/images/strawberry_donut.png"
    ],
    [
      "Grape Ape",
      "El Globo",
      "84",
      Colors.purple,
      "lib/images/grape_donut.png"
    ],
    [
      "Choco",
      "Starbucks",
      "95",
      Colors.brown,
      "lib/images/chocolate_donut.png"
    ],
  ];

  DonutTab({super.key, required this.cart});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: donutsOnSale.length,
      padding: const EdgeInsets.all(12),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 1 / 1.5,
      ),
      itemBuilder: (context, index) {
        return DonutTile(
          donutFlavor: donutsOnSale[index][0],
          donutProvider: donutsOnSale[index][1],
          donutPrice: donutsOnSale[index][2],
          donutColor: donutsOnSale[index][3],
          imageName: donutsOnSale[index][4],
          onTap: () {
            cart.addItem(
              CartItem(
                productName: donutsOnSale[index][0],
                productPrice: donutsOnSale[index][2],
                quantity: 1,
                imageName: donutsOnSale[index][4],
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
