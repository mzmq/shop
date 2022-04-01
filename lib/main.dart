import 'package:flutter/material.dart';

import './screens/products_overview_screen.dart';
import './screens/product_detail_screen.dart';
import 'package:provider/provider.dart';
import './providers/product_provider.dart';
import './providers/products.dart';
import './providers/cart_provider.dart';
import './screens/cart_screen.dart';
import './screens/orders_screen.dart';
import './providers/orders.dart';
import './screens/product_manage_screen.dart';
import './screens/edit_product_screen.dart';

void main() {
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(
      create: (ctx) => ProductProvider(),
    ),
    ChangeNotifierProvider(
      create: (ctx) => Product(),
    ),
    ChangeNotifierProvider(
      create: (ctx) => CartProvider(),
    ),
    ChangeNotifierProvider(
      create: (ctx) => Orders(),
    ),
  ], child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ThemeData them = ThemeData();
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          fontFamily: 'Lato',
          primarySwatch: Colors.deepPurple,
          colorScheme: them.colorScheme.copyWith(secondary: Colors.deepOrange)),
      home: ProductsOverviewScreen(),
      routes: {
        ProductDetailScreen.routeName: (ctx) => ProductDetailScreen(),
        CartScreen.routeName: (ctx) => CartScreen(),
        OrderScreen.routeName: (ctx) => OrderScreen(),
        ProductsOverviewScreen.routeName: (ctx) => ProductsOverviewScreen(),
        ProductManage.routeName : (ctx) => ProductManage() ,
        ProductManage.routeName : (ctx) => ProductManage() ,
        EditProductScreen.routeName : (ctx) => EditProductScreen(),

      },
    );
  }
}
