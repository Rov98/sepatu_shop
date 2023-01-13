// To parse this JSON data, do
//
//     final hotProducts = hotProductsFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

List<HotProducts?>? hotProductsFromJson(String str) => json.decode(str) == null ? [] : List<HotProducts?>.from(json.decode(str)!.map((x) => HotProducts.fromJson(x)));

String hotProductsToJson(List<HotProducts?>? data) => json.encode(data == null ? [] : List<dynamic>.from(data.map((x) => x!.toJson())));

class HotProducts {
    HotProducts({
        required this.id,
        required this.title,
        required this.price,
        required this.description,
        required this.category,
        required this.image,
        required this.rating,
    });

    int? id;
    String? title;
    double? price;
    String? description;
    Category? category;
    String? image;
    Rating? rating;

    factory HotProducts.fromJson(Map<String, dynamic> json) => HotProducts(
        id: json["id"],
        title: json["title"],
        price: double.parse(json["price"].toString()),
        description: json["description"],
        category: categoryValues.map[json["category"]],
        image: json["image"],
        rating: Rating.fromJson(json["rating"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "price": price,
        "description": description,
        "category": categoryValues.reverse![category],
        "image": image,
        "rating": rating!.toJson(),
    };
}

enum Category { MEN_S_CLOTHING, JEWELERY, ELECTRONICS, WOMEN_S_CLOTHING }

final categoryValues = EnumValues({
    "electronics": Category.ELECTRONICS,
    "jewelery": Category.JEWELERY,
    "men's clothing": Category.MEN_S_CLOTHING,
    "women's clothing": Category.WOMEN_S_CLOTHING
});

class Rating {
    Rating({
        required this.rate,
        required this.count,
    });

    double? rate;
    int? count;

    factory Rating.fromJson(Map<String, dynamic> json) => Rating(
        rate: double.parse(json["rate"].toString()),
        count: json["count"],
    );

    Map<String, dynamic> toJson() => {
        "rate": rate,
        "count": count,
    };
}

class EnumValues<T> {
    Map<String, T> map;
    Map<T, String>? reverseMap;

    EnumValues(this.map);

    Map<T, String>? get reverse {
        reverseMap ??= map.map((k, v) => MapEntry(v, k));
        return reverseMap;
    }
}
