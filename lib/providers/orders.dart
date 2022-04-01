import 'package:flutter/foundation.dart';

import 'cart.dart';

class OrderItem {
  String id;
  double amount;
  List<Cart> products;
  DateTime datetime;

  OrderItem({
    required this.id,
    required this.amount,
    required this.products,
    required this.datetime,
  });
}

class Orders with ChangeNotifier {
  final List<OrderItem> _orders = [];

  List<OrderItem> get orders {
    return [..._orders];
  }

  void addOrder(List<Cart> products, double total) {
    _orders.insert(
      0,
      OrderItem(
        id: DateTime.now().toString(),
        amount: total,
        products: products,
        datetime: DateTime.now(),
      ),
    );
  }

  void DeleteOrder(
    List<Cart> products,
  ) {
    _orders.remove(products);
    notifyListeners();
  }
}
