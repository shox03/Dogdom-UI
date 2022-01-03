import 'package:dogdom_ui/constants/colors.dart';
import 'package:dogdom_ui/constants/size_confi.dart';
import 'package:dogdom_ui/screens/circle_details/circle_detail_page.dart';
import 'package:dogdom_ui/screens/home/text/text_regular.dart';
import 'package:flutter/material.dart';

class MyCirclesListView extends StatelessWidget {
  const MyCirclesListView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: SizeConfig.screenWidth,
      height: getProportionateScreenHeight(124.0),
      color: greyConst,
      child: ListView.builder(
          padding: EdgeInsets.only(left: getProportionateScreenWidth(18.0)),
          scrollDirection: Axis.horizontal,
          physics: const BouncingScrollPhysics(),
          itemCount: 4,
          itemBuilder: (context, index) {
            return InkWell(
              onTap: () => Navigator.push(context,
                  MaterialPageRoute(builder: (context) => CircleDetailPage())),
              child: Container(
                margin:
                    EdgeInsets.only(right: getProportionateScreenWidth(18.0)),
                padding: EdgeInsets.zero,
                height: getProportionateScreenHeight(104.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    CircleAvatar(
                      foregroundImage: NetworkImage(
                          'https://source.unsplash.com/random/${index + 1}'),
                      backgroundColor: greyConst,
                      radius: getProportionateScreenWidth(40.0),
                    ),
                    SizedBox(height: getProportionateScreenHeight(6.0)),
                    MyTextRegular(data: 'Name Surname', size: 13.0),
                  ],
                ),
              ),
            );
          }),
    );
  }
}
