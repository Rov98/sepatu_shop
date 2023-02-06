import 'package:flutter/material.dart';

import '../../../../misc/misc.dart';
import '../../../theme/appTheme.dart';

class forYouWidget extends StatelessWidget {
  const forYouWidget({
    super.key,
    required this.size,
    required this.image,
    required this.image_sales,
  });

  final Size size;
  final String image, image_sales;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 25.0),
      child: Row(
        children: [
          Expanded(
              flex: 2,
              child: Container(
                height: size.height * 0.2,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20.0)),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(20.0),
                      child: image.isEmpty
                          ? const Icon(Icons.supervised_user_circle_rounded)
                          : Image(
                              image: NetworkImage(
                                image,
                              ),
                              fit: BoxFit.fitHeight,
                            ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 0.0, horizontal: 5.0),
                      child: Text(
                        '20% Discount On First Order.',
                        overflow: TextOverflow.clip,
                        maxLines: 2,
                        style: AppTheme()
                            .themeData()
                            .textTheme
                            .titleLarge!
                            .copyWith(
                                fontSize: 15, fontWeight: FontWeight.w800),
                      ),
                    ),
                  ],
                ),
              )),
          Expanded(
              flex: 4,
              child: Container(
                width: double.infinity,
                height: size.height * 0.2,
                margin: const EdgeInsets.only(left: 10.0),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20.0),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Expanded(
                      flex: 2,
                      child: Container(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          'Flash Sales!!!!',
                          style: AppTheme()
                              .themeData()
                              .textTheme
                              .titleLarge!
                              .copyWith(
                                  fontSize: 15, fontWeight: FontWeight.w800),
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 4,
                      child: SizedBox(
                        height: size.height * 0.2,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(20.0),
                          child: image_sales.isEmpty
                              ? const Icon(Icons.sd_card_alert_rounded)
                              : Image(
                                  image: NetworkImage(
                                    image_sales,
                                  ),
                                  fit: BoxFit.fitHeight,
                                ),
                        ),
                      ),
                    )
                  ],
                ),
              )),
        ],
      ),
    );
  }
}
