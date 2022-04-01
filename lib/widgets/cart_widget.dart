import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/cart_provider.dart';

class CardWidget extends StatelessWidget {
  String id;

  String title;

  double price;

  int numberOrItem;

  String productId;
  String imgUrl ;

  CardWidget({
    Key? key,
    required this.title,
    required this.price,
    required this.numberOrItem,
    required this.id,
    required this.productId,
    required this.imgUrl ,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Dismissible(
        key: Key(id),
        background: Container(
          color: Colors.red,
          child: Padding(
            padding: const EdgeInsets.only(right: 15.0),
            child: Icon(Icons.delete, size: 30, color: Colors.white),
          ),
          alignment: Alignment.centerRight,
        ),
        direction: DismissDirection.endToStart,
        onDismissed: (direction) {
          Provider.of<CartProvider>(context , listen: false).deleteItemInCart(productId);
        },
        child: Card(
elevation: 10,
          shadowColor: Colors.grey,

          child: Container(
            alignment: Alignment.center,
            height: 100,
            child: ListTile(
                trailing: Padding(
                  padding: const EdgeInsets.only(right: 8.0),
                  child: Text('${numberOrItem}x' , style: TextStyle(fontSize: 20 , color: Colors.grey)),
                ),
                leading: CircleAvatar(

                  radius: 28,
                  backgroundImage: NetworkImage(imgUrl),
                  child: CircleAvatar(
                    radius: 28,
                    backgroundColor: Colors.black54,
                    child: Text(price.toString(),
                        style: TextStyle(color: Colors.white)),
                  ),
                ),
                subtitle: Row(
                  children: [
                    Text('Total amount ' , style: TextStyle(color: Colors.blue)),
                    Text('${price * numberOrItem} JOD'),
                  ],
                ),
                title: Text(title)),
          ),
        ),
      ),
    );
  }
}
