import 'package:flutter/material.dart';

Row buildTimeText() => Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: const [
        Text(
          "01:50",
          style: TextStyle(
              color: Color.fromRGBO(0, 0, 0, 0.25),
              fontSize: 11,
              fontWeight: FontWeight.w400),
        ),
      ],
    );
