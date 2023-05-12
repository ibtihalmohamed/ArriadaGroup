// To parse this JSON data, do
//
//     final productModel = productModelFromJson(jsonString);

// import 'dart:convert';
import 'dart:convert';

class ApiProductModel {
  String id;
  String title;
  String price;
  String description;
  List<String>? images;
  DateTime creationAt;
  DateTime updatedAt;
  Category category;

  ApiProductModel({
    required this.id,
    required this.title,
    required this.price,
    required this.description,
    this.images,
    required this.creationAt,
    required this.updatedAt,
    required this.category,
  });

  factory ApiProductModel.fromRawJson(String str) =>
      ApiProductModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory ApiProductModel.fromJson(Map<String, dynamic> json) =>
      ApiProductModel(
        id: json["id"].toString(),
        title: json["title"],
        price: json["price"].toString(),
        description: json["description"],
        images: List<String>.from(json["images"]?.map((x) => x)),
        creationAt: DateTime.parse(json["creationAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        category: Category.fromJson(json["category"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "price": price,
        "description": description,
        "images": List<dynamic>.from(images!.map((x) => x)).toString(),
        "creationAt": creationAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
        "category": category.toJson(),
      };
}

class Category {
  int id;
  String name;
  String image;
  DateTime creationAt;
  DateTime updatedAt;

  Category({
    required this.id,
    required this.name,
    required this.image,
    required this.creationAt,
    required this.updatedAt,
  });

  factory Category.fromRawJson(String str) =>
      Category.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Category.fromJson(Map<String, dynamic> json) => Category(
        id: json["id"],
        name: json["name"],
        image: json["image"],
        creationAt: DateTime.parse(json["creationAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "image": image,
        "creationAt": creationAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
      };
}
