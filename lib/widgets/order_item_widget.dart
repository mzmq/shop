import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../providers/orders.dart';
class ItemOrderWidget extends StatelessWidget {
  final OrderItem order ;
  const ItemOrderWidget({Key? key , required this.order}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        elevation: 5 ,
        child: ListTile(
          title: Text('${order.amount} JOD '),
          subtitle: Row(
            children: [
              Text(DateFormat('dd/MM/yyyy ' ).format(order.datetime)),
              Text(DateFormat().add_jm().format(order.datetime) , style: TextStyle(color: Colors.blue),),
            ],
          ),
          trailing: IconButton(onPressed: (){}, icon: Icon(Icons.expand_more)),


        ),
      ),
    );
  }
}
