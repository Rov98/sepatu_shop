import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sepatu_shop/controller/item_controller.dart';
import 'package:sepatu_shop/misc/misc.dart';

import '../../theme/appTheme.dart';
import 'component/forYouWidget.dart';

class categoriesItems extends StatefulWidget {
  const categoriesItems({super.key});

  @override
  State<categoriesItems> createState() => _categoriesItemsState();
}

class _categoriesItemsState extends State<categoriesItems> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return FutureBuilder(
      future: Provider.of<Item_Controller>(context).fetchCategories(),
      builder: (context, snapshot) => Consumer<Item_Controller>(
        child: const Center(
          child: CircularProgressIndicator(),
        ),
        builder: (context, value, child) => value.itemCategories.isEmpty
            ? child!
            : ListView(
                children: [
                  ListView.builder(
                    physics: const ClampingScrollPhysics(),
                    shrinkWrap: true,
                    padding: const EdgeInsets.all(10.0),
                    itemCount: value.itemCategories.length,
                    itemBuilder: (context, index) => Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 5.0, horizontal: 0.0),
                      child: Column(
                        children: [
                          Container(
                            width: double.infinity,
                            height: 120,
                            margin: const EdgeInsets.symmetric(
                                vertical: 5.0, horizontal: 15.0),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(20.0),
                            ),
                            child: Row(
                              children: [
                                Expanded(
                                  flex: 3,
                                  child: Container(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 0.0, horizontal: 20.0),
                                    child: Text(
                                      value.itemCategories[index].name
                                          .toString(),
                                      overflow: TextOverflow.clip,
                                      style: AppTheme()
                                          .themeData()
                                          .textTheme
                                          .titleLarge!
                                          .copyWith(shadows: [
                                        const Shadow(
                                          offset: Offset(1.0, 5.0),
                                          blurRadius: 10.0,
                                          color: buttonCustomColor,
                                        ),
                                      ]),
                                    ),
                                  ),
                                ),
                                Expanded(
                                  flex: 2,
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(20.0),
                                    child: Container(
                                      // padding: const EdgeInsets.all(20.0),
                                      height: double.infinity,
                                      color: Colors.black,
                                      child: value.itemCategories[index].image!
                                              .isEmpty
                                          ? const Center(
                                              child: Text('Loading...'),
                                            )
                                          : Image(
                                              image: NetworkImage(
                                                value
                                                    .itemCategories[index].image
                                                    .toString(),
                                              ),
                                              fit: BoxFit.fitHeight,
                                            ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 10.0, horizontal: 25.0),
                    child: Text(
                      'For You',
                      style: AppTheme()
                          .themeData()
                          .textTheme
                          .bodySmall!
                          .copyWith(
                              color: buttonCustomColor,
                              fontSize: 25,
                              fontWeight: FontWeight.bold),
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  forYouWidget(
                    size: size,
                    image: value.itemCategories.first.image.toString(),
                    image_sales: value.itemCategories.last.image.toString(),
                  ),
                ],
              ),
      ),
    );
  }
}
