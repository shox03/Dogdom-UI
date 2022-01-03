import 'package:dogdom_ui/constants/size_confi.dart';
import 'package:flutter/material.dart';

class MyTextRegular extends StatelessWidget {
  final String data;
  final double size;
  Color? color;
  TextAlign? textAlign;
  int? maxLines;

  MyTextRegular(
      {required this.data,
      required this.size,
      this.maxLines,
      this.textAlign,
      this.color,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      data,
      textAlign: textAlign,
      maxLines: maxLines,
      overflow: TextOverflow.ellipsis,
      style:
          TextStyle(fontSize: getProportionateScreenHeight(size), color: color),
    );
  }
}
