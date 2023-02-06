import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sepatu_shop/controller/item_controller.dart';

import '../../../../widgets/carouselView.dart';
import '../../../../widgets/tallbannerCarousel.dart';

class itemTrendingWidget extends StatelessWidget {
  itemTrendingWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      width: double.infinity,
      height: size.height * 0.4,
      padding: const EdgeInsets.symmetric(vertical: 0.0, horizontal: 20.0),
      child: FutureBuilder(
        future: Provider.of<Item_Controller>(context).fetchItemProducts(),
        builder: (context, snapshot) => Consumer<Item_Controller>(
          child: const Center(
            child: CircularProgressIndicator(),
          ),
          builder: (context, value, child) => value.itemProducts.isEmpty
              ? child!
              : CarouselView(
                  listBanner: [
                    ...List.generate(
                      value.itemProducts.length,
                      (index) => tallBannerCarousel(
                          title: value.itemProducts[index].title.toString(),
                          price: '\$${value.itemProducts[index].price}',
                          image: value.itemProducts[index].images!.first),
                    )
                  ],
                  withBullet: false,
                  isImplicit: true,
                ),
        ),
      ),
    );
  }
}
