import 'dart:convert';
import 'package:dogdom_ui/constants/colors.dart';
import 'package:dogdom_ui/constants/icons.dart';
import 'package:dogdom_ui/constants/size_confi.dart';
import 'package:dogdom_ui/providers/persona;_provider.dart';
import 'package:dogdom_ui/screens/about/about_page.dart';
import 'package:dogdom_ui/screens/circle/widgets/text_semibold.dart';
import 'package:dogdom_ui/screens/home/text/meidum_text.dart';
import 'package:dogdom_ui/screens/home/text/text_regular.dart';
import 'package:dogdom_ui/screens/personal_center/user_page.dart';
import 'package:dogdom_ui/service/user_service/auth_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

class PerconalPage extends StatelessWidget {
  PerconalPage({Key? key}) : super(key: key);
  bool darkMode = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteConst,
      appBar: AppBar(
        backgroundColor: transpConst,
        elevation: 0,
        title: MyTextSemibold(
          data: 'Personal',
          size: 24,
          color: blackConst,
        ),
        actions: [
          IconButton(onPressed: () {}, icon: SvgPicture.asset(MyIcons.scan)),
          IconButton(
              onPressed: () {
                // Navigator.push(
                //     context,
                //     MaterialPageRoute(
                //         builder: (context) => SettingsPage()));
              },
              icon: SvgPicture.asset(MyIcons.setSvg))
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // CIRCLE AVATER SECTION
          Container(
            padding: EdgeInsets.symmetric(
                horizontal: getProportionateScreenHeight(18.0)),
            height: getProportionateScreenHeight(102.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CircleAvatar(
                  backgroundColor: greyConst,
                  foregroundImage:
                      NetworkImage('https://source.unsplash.com/random'),
                  radius: getProportionateScreenWidth(35.0),
                ),
                SizedBox(width: getProportionateScreenWidth(12.0)),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    MyTextMedium(data: 'Kelly Goldsmith', size: 17),
                    SizedBox(height: getProportionateScreenHeight(6.0)),
                    MyTextRegular(
                      data: 'Golden Retriever · Mobile ',
                      size: 12,
                      color: blackConst.withOpacity(0.4),
                    ),
                  ],
                ),
                const Spacer(),
                SvgPicture.asset(
                  MyIcons.qrCode,
                  width: getProportionateScreenWidth(22),
                  color: blackConst.withOpacity(0.4),
                )
              ],
            ),
          ),

          // SCORE SECTION
          Container(
            height: getProportionateScreenHeight(79.0),
            padding: EdgeInsets.symmetric(
                horizontal: getProportionateScreenWidth(50.0),
                vertical: getProportionateScreenHeight(16.0)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Column(
                  children: [
                    const Text("98628",
                        style: TextStyle(
                            fontWeight: FontWeight.w600, fontSize: 20.0)),
                    SizedBox(height: getProportionateScreenHeight(4.0)),
                    MyTextRegular(
                        data: 'Praise',
                        size: 13,
                        color: blackConst.withOpacity(0.4)),
                  ],
                ),
                SizedBox(width: getProportionateScreenWidth(51.5)),
                Column(
                  children: [
                    const Text("369",
                        style: TextStyle(
                            fontWeight: FontWeight.w600, fontSize: 20.0)),
                    SizedBox(height: getProportionateScreenHeight(4.0)),
                    MyTextRegular(
                        data: 'Dynamic',
                        size: 13,
                        color: blackConst.withOpacity(0.4)),
                  ],
                ),
                SizedBox(width: getProportionateScreenWidth(51.5)),
                Column(
                  children: [
                    const Text("6869",
                        style: TextStyle(
                            fontWeight: FontWeight.w600, fontSize: 20.0)),
                    SizedBox(height: getProportionateScreenHeight(4.0)),
                    MyTextRegular(
                        data: 'Share',
                        size: 13,
                        color: blackConst.withOpacity(0.4)),
                  ],
                )
              ],
            ),
          ),

          // PROPERTIES SECTION
          buildPropertyListtile(
              context, 0, MyIcons.vector, 'Followers', '6848'),
          buildPropertyListtile(context, 1, MyIcons.focus, 'Following', '6848'),
          buildPropertyListtile(
              context, 2, MyIcons.collections, 'Collection', '6848'),
          buildPropertyListtile(context, 3, MyIcons.order, 'Other', '6848'),
          buildPropertyListtile(context, 4, MyIcons.dark, 'Dark Mode', '6848'),
          buildPropertyListtile(context, 5, MyIcons.more, 'About', ''),
        ],
      ),
    );
  }

  Widget buildPropertyListtile(BuildContext context, int index,
      String leadingIcon, String title, String trailingText) {
    return InkWell(
      onTap: () {
        index != 5
            ? Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => UserPage(),
                ),
              )
            : Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => SettingsPage(),
                ),
              );
      },
      child: Container(
        height: getProportionateScreenHeight(52.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SvgPicture.asset(
              leadingIcon,
              width: getProportionateScreenWidth(24),
            ),
            SizedBox(width: getProportionateScreenWidth(7.0)),
            MyTextRegular(data: title, size: 16),
            const Spacer(),
            if (index != 4)
              MyTextRegular(
                  data: trailingText,
                  size: 13,
                  color: blackConst.withOpacity(0.25)),
            if (index != 4)
              IconButton(
                onPressed: () {},
                icon: SvgPicture.asset(
                  MyIcons.right,
                  width: getProportionateScreenWidth(24),
                  color: blackConst.withOpacity(0.25),
                ),
              ),
            if (index == 4)
              Switch(
                value: Provider.of<PersonalPageProvider>(context).isDark,
                onChanged: (v) =>
                    context.read<PersonalPageProvider>().changeSelect(v),
                inactiveTrackColor: greyConst,
                activeColor: blackConst.withOpacity(0.4),
              )
          ],
        ),
        padding: EdgeInsets.symmetric(
          horizontal: getProportionateScreenWidth(18.0),
        ),
      ),
    );
  }

//   Future<Map> getUserData() async {
//     SharedPreferences pref = await SharedPreferences.getInstance();
//     Map userData = jsonDecode(pref.getString('profile').toString());
//     print(pref.getString('profile').toString());
//     return userData;
//   }
}
