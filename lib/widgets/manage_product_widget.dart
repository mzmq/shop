import 'package:flutter/material.dart';

import '../screens/edit_product_screen.dart';
import '../screens/edit_product_screen.dart';
class ManageProductWidget extends StatelessWidget {
  String title;
  String imgUrl ;
  
  
   ManageProductWidget({Key? key , required this.title , required this.imgUrl}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ListTile(
        leading: CircleAvatar(backgroundImage: NetworkImage(imgUrl)),
        title: Text(title),
        trailing: Container(
          width: 100,
          child: Row(
            children: [
              IconButton(onPressed: (){

              }, icon: Icon(Icons.edit)),
              IconButton(onPressed: (){}, icon: Icon(Icons.delete , color:  Colors.red,) ),
            ],
          ),
        ),
      ),
    );
  }
}
