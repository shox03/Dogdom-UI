import 'package:dogdom_ui/constants/icons.dart';
import 'package:dogdom_ui/constants/size_confi.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

buildNoticeTopBar() => Container(
      alignment: Alignment.center,
      height: getProportionateScreenHeight(175.0),
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.vertical(bottom: Radius.elliptical(154, 20)),
        color: Color.fromRGBO(250, 102, 80, 1),
      ),
      child: Padding(
        padding:
            EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(18.0)),
        child: Column(
          children: [
            SizedBox(height: getProportionateScreenHeight(62.0)),
            Row(
              children: [
                const Text(
                  "Message",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 24.0,
                      fontWeight: FontWeight.w600),
                ),
                const Spacer(),
                SvgPicture.asset(
                  MyIcons.scan,
                  color: Colors.white,
                ),
                SizedBox(width: getProportionateScreenWidth(25.0)),
                SvgPicture.asset(
                  MyIcons.searchBig,
                  color: Colors.white,
                ),
              ],
            ),
          ],
        ),
      ),
    );
