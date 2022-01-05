import 'package:dogdom_ui/constants/colors.dart';
import 'package:dogdom_ui/constants/icons.dart';
import 'package:dogdom_ui/constants/size_confi.dart';
import 'package:dogdom_ui/providers/homepage_provider.dart';
import 'package:dogdom_ui/providers/search_field_provider.dart';
import 'package:dogdom_ui/screens/home/text/meidum_text.dart';
import 'package:dogdom_ui/screens/home/text/text_regular.dart';
import 'package:dogdom_ui/screens/home/widgets/my_images.dart';
import 'package:dogdom_ui/screens/home/widgets/my_tab_bar_item.dart';
import 'package:dogdom_ui/screens/home/widgets/search_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/src/provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool select = context.watch<HomePageProvider>().select;
    return Scaffold(
      backgroundColor: whiteConst,
      body: Column(
        children: [
          SizedBox(height: getProportionateScreenHeight(44.0)),
          buildAppBar(select, context),
          buildSearchField(context),
          buildTabBar(select),
          if (select) buldHorizontalScroll(),
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
        itemCount: 10,
        itemBuilder: (context, index) {
          return Container(
            height: 300,
            width: 500,
            color: Colors.amber,
            margin: const EdgeInsets.all(10),
            child: Image.network(
              "https://source.unsplash.com/random/${index + 1}",
              fit: BoxFit.cover,
            ),
          );
        },
      ),
    );
  }

  Widget buldHorizontalScroll() {
    return Container(
      margin: EdgeInsets.only(bottom: getProportionateScreenHeight(10.0)),
      width: SizeConfig.screenWidth,
      height: getProportionateScreenHeight(190.0),
      child: ListView(
        scrollDirection: Axis.horizontal,
        physics: const BouncingScrollPhysics(),
        padding: EdgeInsets.symmetric(
          horizontal: getProportionateScreenWidth(18.0),
        ),
        children: [
          Container(
            width: getProportionateScreenWidth(339.0),
            height: getProportionateScreenHeight(190.0),
            alignment: Alignment.bottomLeft,
            child: Padding(
              padding: EdgeInsets.only(
                left: getProportionateScreenWidth(24.0),
                bottom: getProportionateScreenHeight(30.0),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: getProportionateScreenHeight(38.0)),
                  const Text(
                    "Take me home",
                    style:
                        TextStyle(fontSize: 24.0, fontWeight: FontWeight.w600),
                  ),
                  const Text(
                    "Take care of stray dogs, please\ntake them home.",
                    style:
                        TextStyle(fontSize: 13.0, fontWeight: FontWeight.w400),
                  ),
                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      primary: blackConst,
                      padding: EdgeInsets.symmetric(
                        horizontal: getProportionateScreenWidth(22.5),
                        vertical: getProportionateScreenHeight(6.0),
                      ),
                    ),
                    child: MyTextRegular(
                      data: 'Let me',
                      size: 12,
                      maxLines: 1,
                    ),
                  ),
                ],
              ),
            ),
            decoration: BoxDecoration(
              image: const DecorationImage(
                image: AssetImage("assets/Card-Shuffling.png"),
                fit: BoxFit.cover,
              ),
              color: greyConst,
              borderRadius: BorderRadius.circular(
                getProportionateScreenWidth(18.0),
              ),
            ),
          ),
          SizedBox(width: getProportionateScreenWidth(10.0)),
          Container(
            width: getProportionateScreenWidth(339.0),
            height: getProportionateScreenHeight(190.0),
            decoration: BoxDecoration(
              image: const DecorationImage(
                image: AssetImage(MyImages.homeCard2),
                fit: BoxFit.cover,
              ),
              color: greyConst,
              borderRadius: BorderRadius.circular(
                getProportionateScreenWidth(18.0),
              ),
            ),
          )
        ],
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
                TapBarItem(
                  image: MyIcons.ranking,
                  text: "Ranking",
                ),
                TapBarItem(
                  image: MyIcons.discuss,
                  text: "Discuss",
                ),
                TapBarItem(
                  image: MyIcons.surrounding,
                  text: "Surrounding",
                ),
              ]
            : const [
                TapBarItem(
                  image: MyIcons.nearby,
                  text: "Nearby",
                ),
                TapBarItem(
                  image: MyIcons.revelation,
                  text: "Revelation",
                ),
                TapBarItem(
                  image: MyIcons.fosterCare,
                  text: "Foster care",
                ),
              ],
      ),
    );
  }

  Widget buildSearchField(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: getProportionateScreenWidth(18.0),
      ),
      child: MySearchTextField(
        controller: context.watch<SearchFieldProvider>().searchController,
        hintText: 'Send the sample',
        suffixIcon: SvgPicture.asset(
          MyIcons.voiceTwo,
          color: blackConst.withOpacity(0.55),
          width: getProportionateScreenWidth(24.0),
          fit: BoxFit.none,
        ),
        prefixIcon: SvgPicture.asset(
          MyIcons.searchSmall,
          width: getProportionateScreenWidth(24.0),
          fit: BoxFit.none,
          color: blackConst.withOpacity(0.25),
        ),
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
          getProportionateScreenHeight(10.0),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
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
                  if (select)
                    SvgPicture.asset(
                      MyIcons.smile2,
                      color: redConst,
                    ),
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
                  if (!select)
                    SvgPicture.asset(
                      MyIcons.smile2,
                      color: redConst,
                    ),
                ],
              ),
            ),
            const Spacer(),
            //
            SvgPicture.asset(
              MyIcons.notification,
              height: getProportionateScreenHeight(24.0),
              color: blackConst.withOpacity(0.3),
            ),
          ],
        ),
      ),
    );
  }
}
