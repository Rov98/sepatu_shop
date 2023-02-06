import 'package:flutter/material.dart';

import './/widgets/containerRecommendation.dart';

class inspirationRowWidget extends StatelessWidget {
  inspirationRowWidget({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      width: double.infinity,
      height: size.height * 0.4,
      margin: const EdgeInsets.symmetric(horizontal: 0.0, vertical: 20.0),
      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 0.0),
      child: ContainerRecommendation(
          title: 'StreetWear Inspiration', subtitle: 'Shop Now'),
    );
  }
}
