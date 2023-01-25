import 'package:flutter/material.dart';
import 'package:sepatu_shop/widgets/carouselBullet.dart';

class CarouselView extends StatefulWidget {
  CarouselView({super.key, required this.listBanner, this.withBullet = true, this.isImplicit = false});
  List<Widget> listBanner;
  bool withBullet, isImplicit;

  @override
  State<CarouselView> createState() => _CarouselViewState();
}

class _CarouselViewState extends State<CarouselView> {
  int? bannerIndex = 0;

  List<Widget> _carouselBullet(int length, currIndex) {
    return length > 0
        ? List<Widget>.generate(
            length,
            (index) => Container(
              margin: const EdgeInsets.all(10.0),
              width: 10,
              height: 10,
              decoration: BoxDecoration(
                color: currIndex == index ? Colors.white : Colors.grey,
                shape: BoxShape.circle,
              ),
            ),
          )
        : [];
  }

  final _pageController = PageController();
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned.fill(
          child: PageView.builder(
            allowImplicitScrolling: widget.isImplicit,
            onPageChanged: (value) => setState(() {
              bannerIndex = value;
            }),
            itemCount: widget.listBanner.length,
            itemBuilder: (context, index) => widget.listBanner[index],
          ),
        ),
        widget.withBullet ?
        Positioned(
          child: Padding(
            padding: const EdgeInsets.only(bottom: 10.0),
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children:
                    _carouselBullet(widget.listBanner.length, bannerIndex),
              ),
            ),
          ),
        ) : Container(),
      ],
    );
  }
}
