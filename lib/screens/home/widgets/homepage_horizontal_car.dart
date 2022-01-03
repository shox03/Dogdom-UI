import 'package:dogdom_ui/constants/colors.dart';
import 'package:dogdom_ui/constants/size_confi.dart';
import 'package:dogdom_ui/screens/home/text/meidum_text.dart';
import 'package:dogdom_ui/screens/home/text/text_regular.dart';
import 'package:flutter/material.dart';

class MyHorizontalScrollCard extends StatelessWidget {
  void Function()? onpressed;
  String? buttonText;
  String? image;
  String title;
  double? titleSize;
  String? subtitle;
  double? subtitleSize;
  Color? textColor;
  Color? cardColor;
  MyHorizontalScrollCard(
      {required this.title,
      this.titleSize,
      this.subtitleSize,
      this.subtitle,
      this.onpressed,
      this.buttonText,
      this.image,
      this.textColor,
      this.cardColor,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: getProportionateScreenWidth(10.0)),
      padding: EdgeInsets.only(
          left: getProportionateScreenWidth(24.0),
          bottom: getProportionateScreenHeight(20.0)),
      width: getProportionateScreenWidth(339.0),
      height: getProportionateScreenHeight(190.0),
      alignment: Alignment.bottomLeft,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          MyTextMedium(
            data: title,
            size: titleSize ?? 24,
            color: textColor,
          ),
          SizedBox(height: getProportionateScreenHeight(4.0)),
          if (subtitle != null)
            MyTextRegular(
              data: subtitle!,
              size: subtitleSize ?? 13,
              color: textColor,
            ),
          if (onpressed != null)
            SizedBox(height: getProportionateScreenHeight(16.0)),
          if (onpressed != null)
            ElevatedButton(
              onPressed: onpressed,
              style: ElevatedButton.styleFrom(
                primary: blackConst,
                padding: EdgeInsets.symmetric(
                    horizontal: getProportionateScreenWidth(22.5),
                    vertical: getProportionateScreenHeight(6.0)),
              ),
              child: MyTextRegular(
                data: buttonText.toString(),
                size: 12,
              ),
            ),
          if (onpressed != null)
            SizedBox(height: getProportionateScreenHeight(10.0)),
        ],
      ),
      decoration: BoxDecoration(
        image: image != null
            ? DecorationImage(image: AssetImage(image!), fit: BoxFit.cover)
            : null,
        color: cardColor ?? greyConst,
        borderRadius: BorderRadius.circular(
          getProportionateScreenHeight(18.0),
        ),
      ),
    );
  }
}
