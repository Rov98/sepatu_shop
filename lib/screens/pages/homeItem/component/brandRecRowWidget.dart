import 'package:flutter/material.dart';

import '../../../theme/appTheme.dart';

class brandRecTextWidget extends StatelessWidget {
  const brandRecTextWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 5, 20, 20),
      child: Text(
        'Brand Recommendation',
        style: AppTheme().themeData().textTheme.bodySmall!.copyWith(
            color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
      ),
    );
  }
}
