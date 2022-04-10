import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/product_provider.dart';
import '../widgets/drawer_widget.dart';
import '../widgets/manage_product_widget.dart';
import '../screens/edit_product_screen.dart';

class ProductManage extends StatelessWidget {
  static const routeName = '/ProductManage';

  const ProductManage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final getProducts = Provider.of<ProductProvider>(context).item;
    return Scaffold(
      drawer: DrawerWidget(),
      appBar: AppBar(
        title: Text('Product Manage'),
        actions: [

          IconButton(onPressed: (){
            Navigator.of(context).pushNamed(EditProductScreen.routeName) ;
          }, icon: Icon(Icons.add)),
          SizedBox(width: 7,) ,
        ],
      ),
      body: ListView.builder(
        itemCount: getProducts.length,
          itemBuilder: (ctx, i) => ManageProductWidget(
                title: getProducts[i].title,
                imgUrl: getProducts[i].imageUrl,
              )),
    );
  }
}
