import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/cart_provider.dart';

import '../widgets/cart_widget.dart';

class CartScreen extends StatelessWidget {
  static const routeName = '/cart-screen';

  @override
  Widget build(BuildContext context) {
    final CartData = Provider.of<CartProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Cart'),
      ),
      body: Column(
        children: [
          Card(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  width: 10,
                ),
                Text('Total'),
                Spacer(),
                Chip(label: Text('${CartData.TotlePrice} JOD')),
                TextButton(onPressed: () {}, child: Text('ORDER NOW'))
              ],
            ),
          ),
          Expanded(
              child: ListView.builder(
                  itemCount: CartData.CartCount,
                  itemBuilder: (ctx, i) => CardWidget(
                        title: CartData.items.values.toList()[i].title,
                    numberOrItem: CartData.items.values.toList()[i].quantity,
                    price: CartData.items.values.toList()[i].price,
                    id: CartData.items.values.toList()[i].id,
                    productId: CartData.items.keys.toList()[i],
                    imgUrl: CartData.items.values.toList()[i].imgUrl,
                      )))
        ],
      ),
    );
  }
}
