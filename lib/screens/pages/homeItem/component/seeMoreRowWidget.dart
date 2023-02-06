import 'package:flutter/material.dart';

import '../../../../widgets/rowTextButton.dart';

class seeMoreRowWidget extends StatelessWidget {
  const seeMoreRowWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 20.0),
      child: RowTextButton(
          title: 'Discover',
          buttonTitle: 'See More',
          mainAxisAlignment: MainAxisAlignment.spaceBetween),
    );
  }
}
