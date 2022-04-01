import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../widgets/drawer_widget.dart';
import '../widgets/order_item_widget.dart';

import '../providers/orders.dart';

class OrderScreen extends StatelessWidget {
  static const routeName = '/Order-Screen';

  const OrderScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final getOrder = Provider.of<Orders>(context);

    return Scaffold(
      drawer: DrawerWidget(),
      appBar: AppBar(
        title: const Text('Order Page'),
      ),
      body: ListView.builder(
          itemCount: getOrder.orders.length,
          itemBuilder: (ctx, i) =>ItemOrderWidget(order: getOrder.orders[i])),
    );
  }
}
