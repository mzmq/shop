import 'package:flutter/foundation.dart';

import 'cart.dart';



class CartProvider with ChangeNotifier {

     Map<String, Cart> _items = {

    };
  Map<String, Cart> get items {
    return {..._items};
  }

  int get CartCount {
    return _items == null ? 0 : _items.length;
  }
  double get TotlePrice {
   var total = 0.0 ;
   _items.forEach((key, value) {
     total += value.price * value.quantity  ;
   }) ;
    return total ;
  }
  void addItem(String productId, String title, double price , String imgUrl) {
    if (_items.containsKey(productId)) {
      // update quantity
      _items.update(
          productId,
          (value) => Cart(
                id: value.id,
                imgUrl: value.imgUrl,
                title: value.title,
                price: value.price,
                quantity: value.quantity + 1,
              ));
    } else {
      _items.putIfAbsent(
          productId,
          () => Cart(
              id: DateTime.now().toString(),
              title: title,
              price: price,
              imgUrl: imgUrl ,
              quantity: 1));
      notifyListeners() ;
    }
  }
  void deleteItemInCart (String id){
    _items.remove(id) ;
    notifyListeners() ;
  }

  void clear(){

    _items = {} ;
    notifyListeners() ;
  }

}
