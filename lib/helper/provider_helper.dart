import 'dart:convert';
import 'package:sepatu_shop/model/hot_products.dart';
import 'package:sepatu_shop/model/products.dart';
import 'package:sepatu_shop/model/categories.dart';
import 'package:http/http.dart' as http;

class Provider_Helper {
  Future<List<Products>> fetchData() async {
    const url = 'https://api.escuelajs.co/api/v1/products';
    try {
      final response = await http.get(Uri.parse(url));
      return (json.decode(response.body) as List)
          .map((e) => Products.fromJson(e))
          .toList();
    } catch (e) {
      rethrow;
    }
  }

  Future<List<Products>> fetchDataLimit(int limit) async {
    final url =
        'https://api.escuelajs.co/api/v1/products?limit=$limit&offset=0';
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
    const url = 'https://fakestoreapi.com/products';
    try {
      final response = await http.get(Uri.parse(url));
      return (json.decode(response.body) as List)
          .map((e) => HotProducts.fromJson(e))
          .toList();
    } catch (e) {
      rethrow;
    }
  }

  Future<List<Categories>> fetchData_categories() async {
    const url = 'https://api.escuelajs.co/api/v1/categories';
    try {
      final response = await http.get(Uri.parse(url));
      return (json.decode(response.body) as List)
          .map((e) => Categories.fromJson(e))
          .toList();
    } catch (e) {
      rethrow;
    }
  }

  Future<Products> fetchData_Search(String id) async {
    final url = 'https://api.escuelajs.co/api/v1/products/$id';
    try {
      final response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        return Products.fromJson(json.decode(response.body));
      } else {
        return Products();
      }
    } catch (e) {
      rethrow;
    }
  }
}
