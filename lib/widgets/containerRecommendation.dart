import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sepatu_shop/controller/item_controller.dart';
import 'package:sepatu_shop/misc/misc.dart';
import 'package:sepatu_shop/screens/theme/appTheme.dart';

class ContainerRecommendation extends StatelessWidget {
  ContainerRecommendation(
      {super.key, required this.title, required this.subtitle});
  String title, subtitle;
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: Provider.of<Item_Controller>(context).fetchItemProducts(),
      builder: (context, snapshot) => Consumer<Item_Controller>(
        child: const Center(
          child: CircularProgressIndicator(),
        ),
        builder: (context, value, child) => value.itemProducts.isEmpty
            ? child!
            : Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20.0),
                  image: DecorationImage(
                    image: NetworkImage(value.itemProducts.last.images!.first),
                    fit: BoxFit.fill,
                  ),
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20.0),
                          color: buttonCustomColor),
                      padding: const EdgeInsets.symmetric(
                          vertical: 10.0, horizontal: 20.0),
                      child: Text(
                        title,
                        overflow: TextOverflow.clip,
                        textAlign: TextAlign.center,
                        style: AppTheme()
                            .themeData()
                            .textTheme
                            .bodyMedium!
                            .copyWith(color: Colors.white),
                      ),
                    ),
                    const SizedBox(
                      height: 10.0,
                    ),
                    TextButton(
                      style: TextButton.styleFrom(
                        backgroundColor: Colors.white,
                        padding: const EdgeInsets.all(10.0),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                      ),
                      onPressed: () {},
                      child: Text(
                        subtitle,
                        style: AppTheme()
                            .themeData()
                            .textTheme
                            .bodyMedium!
                            .copyWith(fontSize: 15, color: Colors.black),
                      ),
                    ),
                    const SizedBox(
                      height: 10.0,
                    ),
                  ],
                ),
              ),
      ),
    );
  }
}
