import 'package:flutter/material.dart';

import '../../../../widgets/rowTextButton.dart';

class brandSeeMoreWidget extends StatelessWidget {
  const brandSeeMoreWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 20.0),
      child: RowTextButton(
          title: 'Top 10 Brand',
          buttonTitle: 'See More',
          mainAxisAlignment: MainAxisAlignment.spaceBetween),
    );
  }
}