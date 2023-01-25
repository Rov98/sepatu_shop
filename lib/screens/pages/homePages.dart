import 'package:flutter/material.dart';
import 'package:sepatu_shop/screens/theme/appTheme.dart';
import 'package:sepatu_shop/widgets/bannerCarousel.dart';
import 'package:sepatu_shop/widgets/carouselView.dart';
import 'package:sepatu_shop/widgets/containerRecommendation.dart';
import 'package:sepatu_shop/widgets/rowTextButton.dart';
import 'package:sepatu_shop/widgets/tallbannerCarousel.dart';

class HomePages extends StatefulWidget {
  const HomePages({super.key});

  @override
  State<HomePages> createState() => _HomePagesState();
}

class _HomePagesState extends State<HomePages> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return ListView(
      children: [
        Container(
          width: double.infinity,
          height: size.height * 0.2,
          margin: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 0),
          padding: const EdgeInsets.symmetric(horizontal: 0.0, vertical: 10.0),
          child: CarouselView(listBanner: [
            Banner_Carousel('First Banner'),
            Banner_Carousel('Second Banner'),
            Banner_Carousel('Third Banner'),
          ]),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 20.0),
          child: RowTextButton(
              title: 'Discover',
              buttonTitle: 'See More',
              mainAxisAlignment: MainAxisAlignment.spaceBetween),
        ),
        Container(
          width: double.infinity,
          height: size.height * 0.3,
          padding: const EdgeInsets.symmetric(vertical: 0.0, horizontal: 20.0),
          child: CarouselView(
            listBanner: [
              tallBannerCarousel(
                title: 'Sepatu 1',
                price: '\$300',
              ),
              tallBannerCarousel(
                title: 'Sepatu 2',
                price: '\$400',
              ),
              tallBannerCarousel(
                title: 'Sepatu 3',
                price: '\$100',
              ),
            ],
            withBullet: false,
            isImplicit: true,
          ),
        ),
        Container(
          width: double.infinity,
          height: size.height * 0.4,
          margin: const EdgeInsets.symmetric(horizontal: 0.0, vertical: 20.0),
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 0.0),
          child: ContainerRecommendation(
              title: 'StreetWear Inspiration', subtitle: 'Shop Now'),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 5.0),
          child: Text(
            'Brand Recommendation',
            style: AppTheme().themeData().textTheme.bodySmall!.copyWith(
                color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
          ),
        ),
      ],
    );
  }
}
