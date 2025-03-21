import 'cart_item.dart';

class Cart {
  // Lista de artículos en el carrito
  final List<CartItem> _items = [];

  // Método para agregar un producto al carrito
  void addItem(CartItem item) {
    _items.add(item);
  }

  // Método para eliminar un producto del carrito
  void removeItem(CartItem item) {
    _items.remove(item);
  }

  // Método para obtener la lista de productos en el carrito
  List<CartItem> getItems() {
    return _items;
  }

  // Método para obtener el total de la compra
  double getTotal() {
    double total = 0;
    for (var item in _items) {
      total += item.getTotalPrice();
    }
    return total;
  }

  // Método para obtener el número de artículos en el carrito
  int getItemCount() {
    return _items.length;
  }

  // Método para actualizar la cantidad de un artículo en el carrito
  void updateItemQuantity(CartItem item, int quantity) {
    if (_items.contains(item)) {
      item.quantity = quantity;
    }
  }
}
