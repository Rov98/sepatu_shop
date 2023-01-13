import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:sepatu_shop/model/hot_products.dart';
import 'package:sepatu_shop/model/products.dart';
import 'package:http/http.dart' as http;

class Provider_Helper extends ChangeNotifier {
  List<Products>? _items;

  List<Products>? get items {
    return _items;
  }

  Future<List<Products>> fetchData() async {
    final url = 'https://api.escuelajs.co/api/v1/products';
    try {
      final response = await http.get(Uri.parse(url));
      return (json.decode(response.body) as List)
          .map((e) => Products.fromJson(e))
          .toList();
    } catch (e) {
      rethrow;
    }
  }

  Future<List<HotProducts?>?> fetchData_secondary() async {
    final url = 'https://fakestoreapi.com/products';
    try {
      final response = await http.get(Uri.parse(url));
      return (json.decode(response.body) as List)
          .map((e) => HotProducts.fromJson(e))
          .toList();
    } catch (e) {
      rethrow;
    }
  }
}
