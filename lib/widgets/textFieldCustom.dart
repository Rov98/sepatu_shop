import 'package:flutter/material.dart';
import 'package:sepatu_shop/screens/theme/appTheme.dart';

class TextFieldCustom extends StatelessWidget {
  TextFieldCustom({super.key, required this.title, this.hint = '...'});
  String title;
  String hint;

  @override
  Widget build(BuildContext context) {
    final tfcontroller = TextEditingController();
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          width: double.infinity,
          padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 10.0),
          child: Text(
            title,
            textAlign: TextAlign.left,
            style: AppTheme()
                .themeData()
                .textTheme
                .bodySmall!
                .copyWith(fontSize: 15, color: Colors.white),
          ),
        ),
        const SizedBox(
          height: 5,
        ),
        Container(
          width: double.infinity,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10.0),
          ),
          padding: const EdgeInsets.all(10.0),
          child: TextField(
            controller: tfcontroller,
            decoration: InputDecoration(
              hintText: hint,
              border: const UnderlineInputBorder(borderSide: BorderSide.none),
            ),
          ),
        )
      ],
    );
  }
}
