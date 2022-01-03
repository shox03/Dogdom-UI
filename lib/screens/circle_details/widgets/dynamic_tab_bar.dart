import 'package:dogdom_ui/constants/colors.dart';
import 'package:dogdom_ui/constants/size_confi.dart';
import 'package:dogdom_ui/providers/circle_tab_bar_provider.dart';
import 'package:dogdom_ui/screens/home/text/meidum_text.dart';
import 'package:flutter/material.dart';
import 'package:provider/src/provider.dart';

class DynamicsTabBarItem extends StatelessWidget {
  final int index;
  final String itemName;
  const DynamicsTabBarItem({
    required this.index,
    required this.itemName,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(
    BuildContext context,
  ) {
    return InkWell(
      onTap: () => context.read<CircleTabProvider>().changeTabIndex(index),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          MyTextMedium(
            data: itemName,
            size: 16.0,
            color: context.watch<CircleTabProvider>().currentIndex == index
                ? redConst
                : blackConst,
          ),
          SizedBox(height: getProportionateScreenHeight(4.0)),
          Container(
            height: getProportionateScreenHeight(3.0),
            width: getProportionateScreenWidth(18.0),
            decoration: BoxDecoration(
              color: context.watch<CircleTabProvider>().currentIndex == index
                  ? redConst
                  : Colors.transparent,
              borderRadius: BorderRadius.circular(2.0),
            ),
          )
        ],
      ),
    );
  }
}
