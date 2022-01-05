import 'package:dogdom_ui/constants/colors.dart';
import 'package:dogdom_ui/constants/icons.dart';
import 'package:dogdom_ui/constants/size_confi.dart';
import 'package:dogdom_ui/screens/circle/widgets/text_semibold.dart';
import 'package:dogdom_ui/screens/circle_details/widgets/dynamic_tab_bar.dart';
import 'package:dogdom_ui/screens/home/text/meidum_text.dart';
import 'package:dogdom_ui/screens/home/text/text_regular.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';

class UserPage extends StatelessWidget {
  const UserPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.dark,
    ));
    return Scaffold(
      body: Column(
        children: [
          // APPBAR SECTION
          buildImageAppBar(context),

          // MY PET SECTION
          Container(
            height: getProportionateScreenHeight(46.0),
            padding: EdgeInsets.symmetric(
                horizontal: getProportionateScreenWidth(18.0)),
            child: Row(
              children: [
                MyTextMedium(data: 'My pet', size: 13),
                const Spacer(),
                Container(
                  width: 140,
                  alignment: Alignment.centerRight,
                  child: Stack(
                    children: [
                      Align(
                        alignment: const Alignment(0.5, 0),
                        child: CircleAvatar(
                            backgroundColor: whiteConst,
                            radius: getProportionateScreenWidth(14.0),
                            child: CircleAvatar(
                              foregroundImage: const NetworkImage(
                                  'https://source.unsplash.com/random'),
                              radius: getProportionateScreenWidth(12.5),
                            )),
                      ),
                      Align(
                        alignment: const Alignment(0.75, 0),
                        child: CircleAvatar(
                            backgroundColor: whiteConst,
                            radius: getProportionateScreenWidth(14.0),
                            child: CircleAvatar(
                              foregroundImage: const NetworkImage(
                                  'https://source.unsplash.com/random'),
                              radius: getProportionateScreenWidth(12.5),
                            )),
                      ),
                      Align(
                        alignment: const Alignment(1, 0),
                        child: CircleAvatar(
                            backgroundColor: whiteConst,
                            radius: getProportionateScreenWidth(14.0),
                            child: CircleAvatar(
                              foregroundImage: const NetworkImage(
                                  'https://source.unsplash.com/random'),
                              radius: getProportionateScreenWidth(12.5),
                            )),
                      )
                    ],
                  ),
                ),
                IconButton(
                    onPressed: () {},
                    icon: SvgPicture.asset(
                      MyIcons.addSmall,
                      width: getProportionateScreenWidth(25.0),
                    ))
              ],
            ),
          ),
          buildTabBar(context),
        ],
      ),
    );
  }

  Widget buildTabBar(BuildContext context) {
    return Container(
      height: getProportionateScreenHeight(38.0),
      padding: EdgeInsets.only(
          left: getProportionateScreenWidth(18.0),
          top: getProportionateScreenHeight(10)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const DynamicsTabBarItem(index: 0, itemName: 'Dynamic'),
          SizedBox(width: getProportionateScreenWidth(28.0)),
          const DynamicsTabBarItem(index: 1, itemName: 'Answer'),
          SizedBox(width: getProportionateScreenWidth(28.0)),
          const DynamicsTabBarItem(index: 2, itemName: 'Article'),
          SizedBox(width: getProportionateScreenWidth(28.0)),
          const DynamicsTabBarItem(index: 3, itemName: 'Video'),
        ],
      ),
    );
  }

  Widget buildImageAppBar(BuildContext context) {
    return Stack(children: [
      Column(
        children: [
          Container(
            height: getProportionateScreenHeight(180.0),
            decoration: const BoxDecoration(
              color: whiteConst,
              image: DecorationImage(
                fit: BoxFit.cover,
                image: NetworkImage('https://source.unsplash.com/random'),
              ),
            ),
            child: Container(
              alignment: Alignment.topCenter,
              height: getProportionateScreenHeight(180),
              decoration: BoxDecoration(
                color: whiteConst,
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.center,
                  colors: [
                    blackConst.withOpacity(0.8),
                    blackConst.withOpacity(0.0)
                  ],
                ),
              ),
              child: SafeArea(
                  child: Container(
                width: SizeConfig.screenWidth,
                height: getProportionateScreenHeight(44.0),
                padding: EdgeInsets.symmetric(
                    horizontal: getProportionateScreenHeight(10.0)),
                child: Row(
                  children: [
                    IconButton(
                      onPressed: () => Navigator.pop(context),
                      icon: SvgPicture.asset(MyIcons.left, color: whiteConst),
                    ),
                    const Spacer(),
                    IconButton(
                      onPressed: () => Navigator.pop(context),
                      icon: SvgPicture.asset(MyIcons.dynamicTwo,
                          color: whiteConst),
                    ),
                    IconButton(
                      onPressed: () => Navigator.pop(context),
                      icon: SvgPicture.asset(
                        MyIcons.qrCode,
                        color: whiteConst,
                      ),
                    ),
                    IconButton(
                      onPressed: () => Navigator.pop(context),
                      icon: SvgPicture.asset(MyIcons.moreV, color: whiteConst),
                    ),
                  ],
                ),
              )),
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: getProportionateScreenHeight(10)),
            padding: EdgeInsets.symmetric(
              horizontal: getProportionateScreenWidth(18.0),
              vertical: getProportionateScreenHeight(10.0),
            ),
            height: getProportionateScreenHeight(129),
            width: SizeConfig.screenWidth,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                MyTextSemibold(data: 'Kate Winslet', size: 24),
                SizedBox(height: getProportionateScreenHeight(10.0)),
                Row(
                  children: [
                    MyTextRegular(data: '9868', size: 16),
                    SizedBox(width: getProportionateScreenWidth(4.0)),
                    MyTextRegular(
                      data: 'Followers',
                      size: 13,
                      color: blackConst.withOpacity(0.4),
                    ),
                    SizedBox(width: getProportionateScreenWidth(20.0)),
                    MyTextRegular(data: '689', size: 16),
                    SizedBox(width: getProportionateScreenWidth(4.0)),
                    MyTextRegular(
                      data: 'Following',
                      size: 13,
                      color: blackConst.withOpacity(0.4),
                    ),
                  ],
                ),
                SizedBox(height: getProportionateScreenWidth(12.0)),
                MyTextRegular(
                    data:
                        'A dog is the only thing that loves you more than you love yourself.',
                    size: 13,
                    maxLines: 2),
              ],
            ),
          ),
        ],
      ),
      Positioned(
        top: getProportionateScreenHeight(149.0),
        right: getProportionateScreenWidth(18.0),
        child: CircleAvatar(
          radius: getProportionateScreenWidth(45.0),
          backgroundColor: redConst,
          foregroundImage:
              const NetworkImage('https://source.unsplash.com/random'),
        ),
      )
    ]);
  }
}
