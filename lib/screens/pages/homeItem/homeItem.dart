import 'package:flutter/material.dart';

import 'component/bannerWidget.dart';
import 'component/brandMoreWidget.dart';
import 'component/brandRecRowWidget.dart';
import 'component/inspirationRowWidget.dart';
import 'component/itemTrendingWidget.dart';
import 'component/recommendItemWidget.dart';
import 'component/seeMoreRowWidget.dart';

class HomeItem extends StatefulWidget {
  const HomeItem({super.key});

  @override
  State<HomeItem> createState() => _HomeItemState();
}

class _HomeItemState extends State<HomeItem> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        const bannerWidget(),
        const seeMoreRowWidget(),
        itemTrendingWidget(),
        inspirationRowWidget(),
        const brandRecTextWidget(),
        const brandSeeMoreWidget(),
        const recommendItemWidget(),
      ],
    );
  }
}
