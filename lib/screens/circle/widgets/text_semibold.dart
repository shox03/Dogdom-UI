import 'package:dogdom_ui/constants/size_confi.dart';
import 'package:flutter/material.dart';

class MyTextSemibold extends StatelessWidget {
  final String data;
  final double size;
  Color? color;
  int? maxLines;
  TextAlign? textAlign;

  MyTextSemibold(
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
      style: TextStyle(
          fontSize: getProportionateScreenWidth(size),
          color: color,
          fontWeight: FontWeight.w600),
    );
  }
}
