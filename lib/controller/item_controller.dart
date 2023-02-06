import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sepatu_shop/helper/provider_helper.dart';
import 'package:sepatu_shop/model/categories.dart';
import 'package:sepatu_shop/model/products.dart';

class Item_Controller extends ChangeNotifier {
  List<Products> _itemProducts = [];
  List<Products> _itemProductsLimit = [];
  List<Categories> _itemCategories = [];
  List<Products> _itemSearch = [];

  List<Products> get itemProducts {
    return [..._itemProducts];
  }

  List<Products> get itemProductsLimit {
    return [..._itemProductsLimit];
  }

  List<Categories> get itemCategories {
    return [..._itemCategories];
  }

  List<Products> get itemProductsSearch {
    return [..._itemSearch];
  }

  Future<void> fetchItemProducts() async {
    final data = await Provider_Helper().fetchData();
    _itemProducts = [...data];
    notifyListeners();
  }

  Future<void> fetchItemProductsLimit(int limit) async {
    final data = await Provider_Helper().fetchDataLimit(limit);
    _itemProductsLimit = [...data];
    notifyListeners();
  }

  Future<void> fetchCategories() async {
    final data = await Provider_Helper().fetchData_categories();
    _itemCategories = [...data];
    notifyListeners();
  }

  Future<void> fetchSearch(String id) async {
    final data = await Provider_Helper().fetchData_Search(id);
    print(data);
    _itemSearch = [data];
    notifyListeners();
  }
}
