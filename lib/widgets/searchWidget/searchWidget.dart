import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sepatu_shop/controller/item_controller.dart';
import 'package:sepatu_shop/screens/theme/appBarDelegateTheme.dart';

class SearchWidget extends SearchDelegate {
  //theme Data for AppBar
  @override
  ThemeData appBarTheme(BuildContext context) {
    return AppBarDelegateTheme();
  }

  //used when actions button after title clicked
  @override
  List<Widget>? buildActions(BuildContext context) {
    try {
      return [
        IconButton(
          onPressed: () {
            query = '';
          },
          icon: const Icon(Icons.clear_rounded),
        ),
      ];
    } catch (e) {
      throw UnimplementedError();
    }
  }

  //used when actions button before title clicked
  @override
  Widget? buildLeading(BuildContext context) {
    try {
      return IconButton(
        onPressed: () {
          close(context, null);
        },
        icon: const Icon(Icons.arrow_back_rounded),
      );
    } catch (e) {
      throw UnimplementedError();
    }
  }

  //buld result when type in search bar
  @override
  Widget buildResults(BuildContext context) {
    try {
      return FutureBuilder(
        future: Provider.of<Item_Controller>(context).fetchSearch(query),
        builder: (context, snapshot) => snapshot.hasData ? Consumer<Item_Controller>(
          builder: (context, value, child) => value.itemProductsSearch.isEmpty
              ? child!
              : ListView.builder(
                  itemCount: value.itemProductsSearch.length,
                  itemBuilder: (context, index) =>
                      Text(value.itemProductsSearch[index].title.toString()),
                ),
          child: const Center(
            child: Text('No Data'),
          ),
        ) : const Center(child: Text('No Data'),),
      );
    } catch (e) {
      throw UnimplementedError();
    }
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    try {
      return Column();
    } catch (e) {
      throw UnimplementedError();
    }
  }
}
