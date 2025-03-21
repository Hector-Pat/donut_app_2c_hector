import 'package:flutter/material.dart';

class CartItem {
  final String productName;
  final String productPrice;
  int quantity; // Cambiar a int sin final
  final String imageName;

  CartItem({
    required this.productName,
    required this.productPrice,
    required this.quantity,
    required this.imageName,
  });

  // Método para incrementar la cantidad de un artículo en el carrito
  void incrementQuantity() {
    quantity++;
  }

  // Método para decrementar la cantidad de un artículo en el carrito
  void decrementQuantity() {
    if (quantity > 1) {
      quantity--;
    }
  }

  // Método para obtener el total por artículo
  double getTotalPrice() {
    return double.parse(productPrice) * quantity;
  }
}