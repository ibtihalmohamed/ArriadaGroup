// To parse this JSON data, do
//
//     final categoryModel = categoryModelFromJson(jsonString);
import 'dart:convert';

class CategoryModel {
    int id;
    String name;
    String image;
    DateTime creationAt;
    DateTime updatedAt;

    CategoryModel({
        required this.id,
        required this.name,
        required this.image,
        required this.creationAt,
        required this.updatedAt,
    });

    factory CategoryModel.fromRawJson(String str) => CategoryModel.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory CategoryModel.fromJson(Map<String, dynamic> json) => CategoryModel(
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
