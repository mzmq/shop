import 'package:flutter/material.dart';
import 'package:shop/screens/product_detail_screen.dart';
import '../providers/products.dart';
import 'package:provider/provider.dart';
import '../providers/cart_provider.dart';

class ProductItem extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final getProductProvider = Provider.of<Product>(context);
    final cart = Provider.of<CartProvider>(context);
    return GestureDetector(
      onTap: () {
        Navigator.of(context).pushNamed(ProductDetailScreen.routeName,
            arguments: getProductProvider.id);
      },
      child: ClipRRect(
        borderRadius: BorderRadius.circular(15),
        child: GridTile(
          child: Image.network(
            getProductProvider.imageUrl,
            fit: BoxFit.cover,
          ),
          footer: GridTileBar(
            backgroundColor: Colors.black87,
            title: Text(
              getProductProvider.title,
              textAlign: TextAlign.center,
            ),
            leading: IconButton(
                onPressed: () {
                  getProductProvider.ChangeFavourite();
                },
                icon: Icon(
                  getProductProvider.isFavourite
                      ? Icons.favorite
                      : Icons.favorite_border_rounded,
                  color: Theme.of(context).colorScheme.secondary,
                )),
            trailing: IconButton(
                onPressed: () {
                  cart.addItem(getProductProvider.id, getProductProvider.title,
                      getProductProvider.price, getProductProvider.imageUrl);

                  ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(duration: Duration(seconds: 2),

                    content: Text("Added item to cart! "),
                    elevation: 10,
                    action: SnackBarAction(
                      label:'UNDO',
                      onPressed: (){
                        cart.removeSingleItem(getProductProvider.id) ;

                      },
                    ),
                  ));
                },
                icon: Icon(Icons.add_shopping_cart_rounded,
                    color: Theme.of(context).colorScheme.secondary)),
          ),
        ),
      ),
    );
  }
}
