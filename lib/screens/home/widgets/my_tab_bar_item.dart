import 'package:dogdom_ui/constants/size_confi.dart';
import 'package:dogdom_ui/screens/home/text/text_regular.dart';
import 'package:flutter/material.dart';

class MyTapBarItem extends StatelessWidget {
  final String image;
  final String text;
  const MyTapBarItem({
    required this.image,
    required this.text,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: getProportionateScreenWidth(125),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset(
            image,
            width: getProportionateScreenWidth(40.0),
          ),
          MyTextRegular(data: text, size: 13)
        ],
      ),
    );
  }
}
