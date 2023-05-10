import 'dart:convert';

class FavouriteModel {
  int id;
  String title;
  String image;
  String price;

  FavouriteModel({
    required this.id,
    required this.title,
    required this.image,
    required this.price,
  });

  factory FavouriteModel.fromRawJson(String str) =>
      FavouriteModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory FavouriteModel.fromJson(Map<String, dynamic> json) => FavouriteModel(
        id: json["id"],
        title: json["title"],
        image: json["image"],
        price: json["price"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "image": image,
        "price": price,
};
}