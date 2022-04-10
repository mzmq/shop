import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'products.dart';

class ProductProvider with ChangeNotifier {
  final List<Product> _items = [
    Product(
        id: 'p1',
        title: 'المنتج الاول',
        description: 'this is product 1 good product',
        price: 50.0,
        imageUrl:
        'https://cdn.pixabay.com/photo/2015/10/02/15/59/olive-oil-968657_960_720.jpg'),
    Product(
        id: 'p2',
        title: 'Product2',
        description: 'this is product 2 good product',
        price: 9.99,
        imageUrl:
        'https://cdn.pixabay.com/photo/2016/04/15/08/04/strawberry-1330459_960_720.jpg'),
    Product(
        id: 'p3',
        title: 'Product3',
        description: 'this is product 3 good product',
        price: 9.99,
        imageUrl:
        'https://cdn.pixabay.com/photo/2017/07/16/22/22/bath-oil-2510783_960_720.jpg'),
    Product(
        id: 'p4',
        title: 'Product4',
        description: 'this is product 4 good product',
        price: 9.99,
        imageUrl:
        'https://cdn.pixabay.com/photo/2017/07/05/15/41/milk-2474993_960_720.jpg'),
  ];

  var _showFavOnly = false;

  // fetch data from List
  List<Product> get item {
    // if (_showFavOnly) {
    //   return _items.where((element) => element.isFavourite).toList();
    // }

    return [..._items];
  }

  List<Product> get getFavouriteList {
    return _items.where((element) => element.isFavourite).toList();
  }

  // void showFavOnly() {
  //   _showFavOnly = true;
  //   notifyListeners();
  // }
  //
  // void showAll() {
  //   _showFavOnly = false;
  //   notifyListeners();
  // }

  void findId(String id) {

  }

  void addProduct(Product product) {
    final newProduct = Product(id: DateTime.now().toString(),
        title: product.title,
        description: product.description,
        price: product.price,
        imageUrl: product.imageUrl) ;

   // _items.add(newProduct);
    _items.insert(0, newProduct) ;// Start list
    notifyListeners();
  }
}
