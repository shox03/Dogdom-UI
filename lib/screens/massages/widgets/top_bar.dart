import 'package:flutter/material.dart';

Row buildtopBar() => Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        IconButton(onPressed: () {}, icon: Icon(Icons.arrow_back_ios_rounded)),
        const Text(
          "Messages",
          style: TextStyle(
            fontSize: 17,
            fontWeight: FontWeight.w500,
          ),
        ),
        const Icon(
          Icons.add,
          size: 29.0,
        )
      ],
    );
