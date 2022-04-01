class Cart {
  String id;

  String title;

  double price;

  int quantity;

  String imgUrl ;

  Cart({
    required this.id,
    required this.title,
    required this.price,
     this.quantity = 0 ,
    required this.imgUrl ,
  });
}