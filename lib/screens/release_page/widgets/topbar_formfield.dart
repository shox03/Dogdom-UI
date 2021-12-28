import 'package:dogdom_ui/constants/size_confi.dart';
import 'package:flutter/material.dart';

buildTopBarField() => Padding(
      padding: EdgeInsets.only(left: getProportionateScreenWidth(16.0)),
      child: TextFormField(
        decoration: const InputDecoration(
          border: InputBorder.none,
          hintText: "What you're thinking right now...",
          hintStyle: TextStyle(fontSize: 13.0, fontWeight: FontWeight.w400),
        ),
      ),
    );
