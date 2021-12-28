import 'package:dogdom_ui/constants/size_confi.dart';
import 'package:flutter/material.dart';

buildTopBarText() => Padding(
      padding: EdgeInsets.only(
          left: getProportionateScreenWidth(16.0),
          right: getProportionateScreenWidth(106.0),
          bottom: getProportionateScreenHeight(8.0)),
      child: const Text(
        "Release something new",
        style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.w600),
      ),
    );
