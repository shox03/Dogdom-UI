import 'package:dogdom_ui/constants/colors.dart';
import 'package:dogdom_ui/constants/icons.dart';
import 'package:dogdom_ui/constants/size_confi.dart';
import 'package:dogdom_ui/providers/search_field_provider.dart';
import 'package:dogdom_ui/screens/circle/widgets/circle_list.dart';
import 'package:dogdom_ui/screens/circle/widgets/text_semibold.dart';
import 'package:dogdom_ui/screens/circle_details/circle_detail_page.dart';
import 'package:dogdom_ui/screens/home/text/meidum_text.dart';
import 'package:dogdom_ui/screens/home/text/text_regular.dart';
import 'package:dogdom_ui/screens/home/widgets/homepage_horizontal_car.dart';
import 'package:dogdom_ui/screens/home/widgets/search_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/src/provider.dart';

class CirclePage extends StatelessWidget {
  const CirclePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteConst,
      body: Column(
        children: [
          buildAppBar(),
          buildTextField(context),
          buildHorizontalScroll(),
          // POPULAR CIRCLE SECTION
          buildSectionTitle('Popular circle'),
          const MyCirclesListView(),
          SizedBox(height: getProportionateScreenHeight(10.0)),
          // THE CIRCLE JOIN SECTION
          buildSectionTitle('The Circle to Join'),
          Flexible(
              child: ListView.builder(
                  padding: EdgeInsets.symmetric(
                    horizontal: getProportionateScreenWidth(18.0),
                    vertical: getProportionateScreenHeight(10.0),
                  ),
                  physics: const BouncingScrollPhysics(),
                  itemCount: 5,
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => CircleDetailPage())),
                      child: SizedBox(
                        width: SizeConfig.screenWidth,
                        height: getProportionateScreenHeight(90.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            CircleAvatar(
                              backgroundColor: greyConst,
                              foregroundImage: NetworkImage(
                                  'https://source.unsplash.com/random/${index + 1}'),
                              radius: getProportionateScreenWidth(35.0),
                            ),
                            SizedBox(width: getProportionateScreenWidth(16.0)),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                MyTextRegular(
                                    data: 'I love Golden Retriever',
                                    size: getProportionateScreenWidth(16.0)),
                                MyTextRegular(
                                  data: '548 Members',
                                  size: getProportionateScreenWidth(16.0),
                                  color: blackConst.withOpacity(0.4),
                                ),
                              ],
                            ),
                            const Spacer(),
                            ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                primary: redConst,
                                fixedSize: Size(
                                  getProportionateScreenWidth(70.0),
                                  getProportionateScreenHeight(28.0),
                                ),
                              ),
                              onPressed: () {},
                              child: Text(
                                'Joined',
                                style: TextStyle(
                                  fontSize: getProportionateScreenWidth(12.0),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  }))
        ],
      ),
    );
  }

  Widget buildSectionTitle(String title) {
    return Container(
      height: getProportionateScreenHeight(35.0),
      alignment: Alignment.bottomCenter,
      padding:
          EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(18.0)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          MyTextMedium(data: title, size: 20),
          InkWell(
            onTap: () {},
            child: MyTextRegular(
              data: 'More',
              size: 13,
              color: blackConst.withOpacity(0.4),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildHorizontalScroll() {
    return Container(
      margin: EdgeInsets.only(top: getProportionateScreenHeight(20)),
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
                  cardColor: redConst.withOpacity(0.3),
                  onpressed: () {},
                  buttonText: 'Create',
                  title: 'How do you\ncreate your circle?',
                  titleSize: 20,
                )
              : MyHorizontalScrollCard(
                  cardColor: pincAksent,
                  title: 'How do you create your circle?',
                  titleSize: 17,
                );
        },
      ),
    );
  }

  Widget buildTextField(BuildContext context) {
    return Padding(
      padding:
          EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(18.0)),
      child: MySearchTextField(
        controller: context.watch<SearchFieldProvider>().searchController,
      ),
    );
  }

  Widget buildAppBar() {
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: getProportionateScreenWidth(18.0),
          vertical: getProportionateScreenHeight(18.0),
        ),
        child: Row(
          children: [
            MyTextSemibold(data: 'Circle', size: 24),
            const Spacer(),
            IconButton(
              onPressed: () {},
              icon: SvgPicture.asset(
                MyIcons.scan,
                width: getProportionateScreenWidth(24.0),
              ),
            ),
            SizedBox(width: getProportionateScreenWidth(25.0)),
            IconButton(
              onPressed: () {},
              icon: SvgPicture.asset(
                MyIcons.add,
                width: getProportionateScreenWidth(24.0),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
