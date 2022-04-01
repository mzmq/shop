import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../providers/orders.dart';

class ItemOrderWidget extends StatefulWidget {
  final OrderItem order;

  const ItemOrderWidget({Key? key, required this.order}) : super(key: key);

  @override
  State<ItemOrderWidget> createState() => _ItemOrderWidgetState();
}

class _ItemOrderWidgetState extends State<ItemOrderWidget> {
  bool _expand = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        elevation: 5,
        child: Column(
          children: [
            ListTile(
              title: Text('${widget.order.amount} JOD '),
              subtitle: Row(
                children: [
                  Text(DateFormat('dd/MM/yyyy ').format(widget.order.datetime)),
                  Text(
                    DateFormat().add_jm().format(widget.order.datetime),
                    style: TextStyle(color: Colors.blue),
                  ),
                ],
              ),
              trailing: IconButton(
                  onPressed: () {
                    setState(() {
                      _expand = !_expand;
                    });
                  },
                  icon: Icon(_expand ? Icons.expand_less : Icons.expand_more)),
            ),
            _expand
                ? Column(
                    children: widget.order.products
                        .map((e) => ListTile(
                              title: Text('${e.title}'),
                              leading: CircleAvatar(
                                backgroundImage: NetworkImage(e.imgUrl),
                              ),
                              subtitle: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Row(
                                    children: [
                                      Text(DateFormat('dd/MM/yyyy ')
                                          .format(widget.order.datetime)),
                                      Text(
                                        DateFormat()
                                            .add_jm()
                                            .format(widget.order.datetime),
                                        style: TextStyle(color: Colors.blue),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Row(
                                    children: [
                                      Text('Quantity ${e.quantity}X'),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                ],
                              ),
                              trailing: Text('${e.price} JOD'),
                            ))
                        .toList(),
                  )
                : Container(),
          ],
        ),
      ),
    );
  }
}
