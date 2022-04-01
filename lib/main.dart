import 'package:flutter/material.dart';
import 'package:shop/screens/products_overview_screen.dart';
import './screens/product_detail_screen.dart';
import 'package:provider/provider.dart';
import './providers/product_provider.dart';
import './providers/products.dart';
import './providers/cart_provider.dart';
import './screens/cart_screen.dart';

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
    )
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
        CartScreen.routeName : (ctx)=> CartScreen()  ,
      },
    );
  }
}
