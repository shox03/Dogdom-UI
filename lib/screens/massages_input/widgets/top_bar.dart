import 'package:dogdom_ui/constants/size_confi.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class TopBarMassageInput extends StatelessWidget {
  const TopBarMassageInput({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    SizeConfig().init(context);
    return Padding(
      padding: EdgeInsets.only(
          right: getProportionateScreenWidth(18.0),
          left: getProportionateScreenWidth(10.0)),
      child: Row(
        children: [
          IconButton(
              onPressed: () {}, icon: Icon(Icons.arrow_back_ios_rounded)),
          CircleAvatar(
            // backgroundColor: Colors.black,
            backgroundImage: AssetImage("assets/massagesImg/4.png"),
            backgroundColor: Colors.transparent,
            radius: 15,
          ),
          SizedBox(width: getProportionateScreenWidth(10.0)),
          const Text(
            "Clementine",
            style: TextStyle(
              fontSize: 17,
              fontWeight: FontWeight.w500,
            ),
          ),
          Spacer(),
          const Icon(
            Icons.phone_outlined,
            size: 29.0,
          ),
          SizedBox(width: getProportionateScreenWidth(20.0)),
          RotatedBox(
              quarterTurns: 1,
              child: SvgPicture.asset(
                "assets/icons/More_1.svg",
              )),
        ],
      ),
    );
  }
}
