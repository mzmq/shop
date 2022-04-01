import 'package:flutter/material.dart';
import '../providers/product_provider.dart';
import '../providers/products.dart';
import '../widgets/product_grid.dart';
import '../widgets/product_item.dart';
import 'package:provider/provider.dart';
import '../providers/cart_provider.dart';
import '../screens/cart_screen.dart';

enum FilterOption { Favorites, All }

class ProductsOverviewScreen extends StatefulWidget {
  @override
  State<ProductsOverviewScreen> createState() => _ProductsOverviewScreenState();
}

class _ProductsOverviewScreenState extends State<ProductsOverviewScreen> {
  bool _Fav = false;

  @override
  Widget build(BuildContext context) {
    final productsGetProvider =
        Provider.of<ProductProvider>(context, listen: false);
    final CartDate = Provider.of<CartProvider>(context);

    int cartCount = CartDate.CartCount;
    return Scaffold(
      appBar: AppBar(
        title: Text('Shop'),
        backgroundColor: Theme.of(context).primaryColor,
        actions: [
          Consumer<CartProvider>(
            builder: (ctx, cartData, child) => Row(
              children: [
                IconButton(
                    onPressed: () {
                      Navigator.of(context).pushNamed(CartScreen.routeName) ;
                    },
                    icon: Icon(
                      Icons.shopping_cart,
                      color: Colors.white,
                    )),
                Text(cartCount.toString(),
                    style: TextStyle(color: Colors.white)),
                SizedBox(
                  width: 10,
                )
              ],
            ),
          ),
          PopupMenuButton(
              icon: const Icon(Icons.menu),
              onSelected: (FilterOption selected) {
                setState(() {
                  if (selected == FilterOption.Favorites) {
                    _Fav = true;
                  } else {
                    _Fav = false;
                  }
                });
              },
              itemBuilder: (_) => [
                    const PopupMenuItem(
                        child: Text('Favorites'),
                        value: FilterOption.Favorites),
                    const PopupMenuItem(
                        child: Text('All'), value: FilterOption.All),
                  ]),

        ],
      ),
      body: ProductGrid(isFav: _Fav),
    );
  }
}
