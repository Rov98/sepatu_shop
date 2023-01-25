import 'package:flutter/material.dart';
import 'package:sepatu_shop/misc/misc.dart';
import 'package:sepatu_shop/screens/theme/appTheme.dart';

class tallBannerCarousel extends StatelessWidget {
  tallBannerCarousel({super.key, required this.title, required this.price});
  String title, price;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 0.0, horizontal: 10.0),
      color: Colors.white,
      child: Column(
        children: [
          Expanded(
            flex: 0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.favorite_border_rounded))
              ],
            ),
          ),
          Expanded(
            flex: 3,
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Text(
                title,
                style: const TextStyle(color: Colors.black, fontSize: 20),
              ),
            ),
          ),
          Expanded(
            flex: 0,
            child: ListTile(
              title: Text(
                title,
                style: AppTheme().themeData().textTheme.titleMedium!,
              ),
              subtitle: Text(
                price,
                style: AppTheme()
                    .themeData()
                    .textTheme
                    .bodySmall!
                    .copyWith(fontSize: 15),
              ),
              trailing: TextButton(
                  style: TextButton.styleFrom(
                      backgroundColor: buttonCustomColor,
                      elevation: 4,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30.0),
                      )),
                  onPressed: () {},
                  child: Text(
                    'See More',
                    style: AppTheme()
                        .themeData()
                        .textTheme
                        .bodyMedium!
                        .copyWith(fontSize: 15),
                  )),
            ),
          )
        ],
      ),
    );
  }
}
