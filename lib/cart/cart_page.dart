import 'package:flutter/material.dart';
import 'package:donut_app_2c_hector/cart/cart.dart';
import 'package:donut_app_2c_hector/cart/cart_item.dart';

class CartPage extends StatefulWidget {
  final Cart cart;

  const CartPage({super.key, required this.cart});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Your Cart"),
      ),
      body: widget.cart.getItems().isEmpty
          ? const Center(child: Text("Your cart is empty"))
          : ListView.builder(
              itemCount: widget.cart.getItems().length,
              itemBuilder: (context, index) {
                final item = widget.cart.getItems()[index];
                return ListTile(
                  leading: Image.asset(item.imageName, width: 50, height: 50),
                  title: Text(item.productName),
                  subtitle: Text("${item.quantity} x \$${item.productPrice}"),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton(
                        icon: const Icon(Icons.remove),
                        onPressed: () {
                          setState(() {
                            if (item.quantity > 1) {
                              item.decrementQuantity();
                            } else {
                              widget.cart.removeItem(item);
                            }
                          });
                        },
                      ),
                      Text("${item.quantity}"),
                      IconButton(
                        icon: const Icon(Icons.add),
                        onPressed: () {
                          setState(() {
                            item.incrementQuantity();
                          });
                        },
                      ),
                    ],
                  ),
                );
              },
            ),
      bottomNavigationBar: Container(
        padding: const EdgeInsets.all(16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("Total: \$${widget.cart.getTotal().toStringAsFixed(2)}",
                style: const TextStyle(
                    fontSize: 18, fontWeight: FontWeight.bold)),
            ElevatedButton(
              onPressed: () {
                // Aquí puedes implementar la lógica para procesar el pago
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text("Checkout not implemented")),
                );
              },
              child: const Text("Checkout"),
            ),
          ],
        ),
      ),
    );
  }
}
