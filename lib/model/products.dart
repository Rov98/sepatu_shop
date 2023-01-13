import 'dart:convert';

import 'package:flutter/material.dart';


class Products {
  int? id;
  String? title;
  int? price;
  String? description;
  Category? category;
  List<String>? images;

  Products(
      {this.id,
      this.title,
      this.price,
      this.description,
      this.category,
      this.images});

  Products.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    price = json['price'];
    description = json['description'];
    category =
        json['category'] != null ? Category.fromJson(json['category']) : null;
    images = [...json['images']];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = id;
    data['title'] = title;
    data['price'] = price;
    data['description'] = description;
    if (this.category != null) {
      data['category'] = category!.toJson();
    }
    data['images'] = images;
    return data;
  }
}

class Category {
  int? id;
  String? name;
  String? image;

  Category({this.id, this.name, this.image});

  Category.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    image = json['image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['id'] = id;
    data['name'] = name;
    data['image'] = image;
    return data;
  }
}
