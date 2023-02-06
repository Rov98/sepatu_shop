import 'package:flutter/material.dart';

import '../../../../widgets/bannerCarousel.dart';
import '../../../../widgets/carouselView.dart';

class bannerWidget extends StatelessWidget {
  const bannerWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 100,
      margin: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 0),
      padding: const EdgeInsets.symmetric(horizontal: 0.0, vertical: 10.0),
      child: CarouselView(listBanner: [
        Banner_Carousel('First Banner'),
        Banner_Carousel('Second Banner'),
        Banner_Carousel('Third Banner'),
      ]),
    );
  }
}
