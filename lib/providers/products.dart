import 'package:flutter/foundation.dart';
import 'package:provider/provider.dart';
import './product_provider.dart';


class Product  with ChangeNotifier{

  final id;

  final title;

  final description;

  final price;
  final imageUrl;

  bool isFavourite;

  Product(
      {@required this.id,
      @required this.title,
      @required this.description,
      @required this.price,
      @required this.imageUrl,
      this.isFavourite = false

      });

  void ChangeFavourite (){
    isFavourite = !isFavourite ;
    notifyListeners() ;

  }

}
