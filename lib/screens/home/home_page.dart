import 'package:dogdom_ui/constants/colors.dart';
import 'package:dogdom_ui/constants/icons.dart';
import 'package:dogdom_ui/constants/size_confi.dart';
import 'package:dogdom_ui/providers/homepage_provider.dart';
import 'package:dogdom_ui/providers/search_field_provider.dart';
import 'package:dogdom_ui/screens/home/text/meidum_text.dart';
import 'package:dogdom_ui/screens/home/widgets/homepage_horizontal_car.dart';
import 'package:dogdom_ui/screens/home/widgets/my_images.dart';
import 'package:dogdom_ui/screens/home/widgets/my_tab_bar_item.dart';
import 'package:dogdom_ui/screens/home/widgets/search_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/src/provider.dart';

class HomeSelectPage extends StatelessWidget {
  const HomeSelectPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool select = context.watch<HomePageProvider>().select;
    return Scaffold(
      backgroundColor: whiteConst,
      body: Column(
        children: [
          // SELECT DISCOVER SECTION
          buildAppBar(select, context),

          // SEACH FIELD SECTION
          buildSearchField(context),

          // TOP NAVIGATION BAR
          buildTabBar(select),

          // HORIZONTAL SCROLL CARD
          if (select) buildHorizontalScroll(),
          SizedBox(height: getProportionateScreenHeight(10.0)),

          // VERTICAL SCROLL CARD
          buildVerticalScroll()
        ],
      ),
    );
  }

  Widget buildVerticalScroll() {
    return Expanded(
        child: ListView.builder(
            padding: EdgeInsets.zero,
            physics: const BouncingScrollPhysics(),
            itemCount: 3,
            itemBuilder: (context, index) {
              return Container(
                height: 300,
                width: 500,
                color: Colors.amber,
                margin: const EdgeInsets.all(10),
              );
            }));
  }

  Widget buildHorizontalScroll() {
    return SizedBox(
      width: SizeConfig.screenWidth,
      height: getProportionateScreenHeight(190.0),
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        physics: const BouncingScrollPhysics(),
        padding:
            EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(18.0)),
        itemCount: 2,
        itemBuilder: (context, index) {
          return index == 0
              ? MyHorizontalScrollCard(
                  onpressed: () {},
                  buttonText: 'Let name',
                  title: 'Take me home',
                  subtitle: 'Take care of stay dogs, please\ntake them home',
                  image: MyImages.homeCard1,
                )
              : MyHorizontalScrollCard(
                  image: MyImages.homeCard2,
                  title: 'Take me home',
                  titleSize: 17,
                  subtitle: 'Please take me home',
                  textColor: whiteConst,
                );
        },
      ),
    );
  }

  Widget buildTabBar(bool select) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: getProportionateScreenHeight(10)),
      width: SizeConfig.screenWidth,
      height: getProportionateScreenHeight(78.8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: select
            ? const [
                MyTapBarItem(
                  image: MyIcons.ranking,
                  text: "Ranking",
                ),
                MyTapBarItem(
                  image: MyIcons.discuss,
                  text: "Discuss",
                ),
                MyTapBarItem(
                  image: MyIcons.surrounding,
                  text: "Surrounding",
                ),
              ]
            : const [
                MyTapBarItem(
                  image: MyIcons.nearby,
                  text: "Nearby",
                ),
                MyTapBarItem(
                  image: MyIcons.revelation,
                  text: "Revelation",
                ),
                MyTapBarItem(
                  image: MyIcons.fosterCare,
                  text: "Foster care",
                ),
              ],
      ),
    );
  }

  Widget buildSearchField(BuildContext context) {
    return Padding(
      padding:
          EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(18.0)),
      child: MySearchTextField(
        controller: context.watch<SearchFieldProvider>().searchController,
      ),
    );
  }

  Widget buildAppBar(bool select, BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.fromLTRB(
            getProportionateScreenWidth(18.0),
            getProportionateScreenHeight(10.0),
            getProportionateScreenWidth(18.0),
            getProportionateScreenHeight(10.0)),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(width: getProportionateScreenWidth(24.0)),
            const Spacer(),
            //
            InkWell(
              onTap: () => context.read<HomePageProvider>().changeSelect(true),
              child: Column(
                children: [
                  MyTextMedium(
                    data: 'Select',
                    size: 17,
                    color: select ? blackConst : blackConst.withOpacity(0.4),
                  ),
                  SizedBox(height: getProportionateScreenHeight(5.0)),
                  SvgPicture.asset(
                    MyIcons.smile2,
                    color: select ? redConst : Colors.transparent,
                  )
                ],
              ),
            ),
            SizedBox(width: getProportionateScreenWidth(38.0)),
            //
            InkWell(
              onTap: () {
                context.read<HomePageProvider>().changeSelect(false);
              },
              child: Column(
                children: [
                  MyTextMedium(
                    data: 'Discover',
                    size: 17,
                    color: !select ? blackConst : blackConst.withOpacity(0.4),
                  ),
                  SizedBox(height: getProportionateScreenHeight(5.0)),
                  SvgPicture.asset(
                    MyIcons.smile2,
                    color: !select ? redConst : Colors.transparent,
                  )
                ],
              ),
            ),
            const Spacer(),
            //
            SvgPicture.asset(
              MyIcons.notification,
              height: getProportionateScreenHeight(24.0),
              color: blackConst.withOpacity(0.3),
            )
          ],
        ),
      ),
    );
  }
}
