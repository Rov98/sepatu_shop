import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sepatu_shop/controller/item_controller.dart';
import 'package:sepatu_shop/helper/provider_helper.dart';

import '../../../../widgets/carouselView.dart';
import '../../../../widgets/tallbannerCarousel.dart';

class recommendItemWidget extends StatelessWidget {
  const recommendItemWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return FutureBuilder(
      future: Provider.of<Item_Controller>(context).fetchItemProductsLimit(5),
      builder: (context, snapshot) => Consumer<Item_Controller>(
        child: const Center(
          child: CircularProgressIndicator(),
        ),
        builder: (context, value, child) => value.itemProducts.isEmpty
            ? child!
            : Container(
                width: double.infinity,
                height: size.height * 0.4,
                padding:
                    const EdgeInsets.symmetric(vertical: 0.0, horizontal: 20.0),
                child: CarouselView(
                  listBanner: [
                    ...List<tallBannerCarousel>.generate(
                      value.itemProductsLimit.length,
                      (index) => tallBannerCarousel(
                        title: value.itemProductsLimit[index].title.toString(),
                        price: '\$${value.itemProductsLimit[index].price}',
                        image: value.itemProductsLimit[index].images!.first,
                      ),
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
