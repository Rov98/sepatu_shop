import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:sepatu_shop/misc/misc.dart';
import 'package:sepatu_shop/widgets/appbarCustom.dart';

class Detail extends StatelessWidget {
  Detail(
      {super.key,
      required this.title,
      required this.desc,
      required this.price,
      required this.imageUrl});
  String? title, desc, imageUrl;
  num? price;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: pitchBlack,
      appBar: AppbarCustom(title!, autoBack: true),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                padding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 20.0),
                child: CachedNetworkImage(
                  imageUrl: imageUrl!,
                  fit: BoxFit.cover,
                  errorWidget: (context, url, error) =>
                      const CircularProgressIndicator(),
                ),
              ),
              Text(
                '\$$price',
                style: const TextStyle(color: Colors.white, fontSize: 40),
              ),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  color: Colors.grey,
                ),
                padding: const EdgeInsets.all(10.0),
                child: Text(
                  desc!,
                  style: const TextStyle(
                    fontSize: 20,
                    color: Colors.black,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
