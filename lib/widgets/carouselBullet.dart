import 'package:flutter/material.dart';

List<Widget> Carousel_Bullet(int length, currIndex) {
  return length != null
      ? List<Widget>.generate(
          length,
          (index) => Container(
                margin: const EdgeInsets.all(10.0),
                width: 10,
                height: 10,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle,
                ),
              ))
      : [];
}
