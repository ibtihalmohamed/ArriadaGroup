import 'dart:convert';

class CartModel {
  String uid;
  String title;
  String imageUrl;
  double price;

  CartModel({
    required this.uid,
    required this.title,
    required this.imageUrl,
    required this.price,
  });

  factory CartModel.fromRawJson(String str) =>
      CartModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory CartModel.fromJson(Map<String, dynamic> json) => CartModel(
        uid: json["uid"],
        title: json["title"],
        imageUrl: json["image_url"],
        price: json["price"].toDouble(),
      );

  Map<String, dynamic> toJson() => {
        "uid": uid,
        "title": title,
        "image_url": imageUrl,
        "price": price,
      };
}

// class Cart {
//   final ProductModel product;
//   final int numOfItem;

//   Cart({required this.product, required this.numOfItem});
// }

// // Demo data for our cart

// List<Cart> demoCarts = [
//   // Cart(product: demoProducts[0], numOfItem: 2),
//   // Cart(product: demoProducts[1], numOfItem: 1),
//   // Cart(product: demoProducts[3], numOfItem: 1),
// ];
