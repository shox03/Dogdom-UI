import 'dart:io';

import 'package:dogdom_ui/constants/size_confi.dart';
import 'package:dogdom_ui/providers/release_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/src/provider.dart';

class ReleaseAddVieo extends StatelessWidget {
  const ReleaseAddVieo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    return Expanded(
      child: ListView.builder(
        itemBuilder: (_, __) => Dismissible(
          key: Key(context.watch<ReleaseProvider>().listOfImg.toString()),
          child: Padding(
            padding: EdgeInsets.only(
                right: getProportionateScreenWidth(18.0),
                left: getProportionateScreenWidth(18.0),
                bottom: getProportionateScreenHeight(18.0)),
            child: Row(
              children: [
                Container(
                  height: getProportionateScreenHeight(75.0),
                  width: getProportionateScreenWidth(75.0),
                  child: Image.file(
                    File(context.watch<ReleaseProvider>().listOfImg[__].path),
                    fit: BoxFit.cover,
                  ),
                  decoration:
                      BoxDecoration(borderRadius: BorderRadius.circular(20.0)),
                ),
                const Spacer(),
                const Icon(Icons.add)
              ],
            ),
          ),
          onDismissed: (direction) {
            context.read<ReleaseProvider>().dismissItem(__);
          },
        ),
        itemCount: context.watch<ReleaseProvider>().listOfImg.length,
      ),
    );
  }
}
