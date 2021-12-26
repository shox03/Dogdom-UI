import 'package:dogdom_ui/constants/size_confi.dart';
import 'package:dogdom_ui/massages/modul/massages_modul.dart';
import 'package:flutter/material.dart';

class TopCards extends StatelessWidget {
  const TopCards({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    SizeConfig().init(context);
    return SizedBox(
      height: getProportionateScreenHeight(76),
      width: width,
      child: ListView.builder(
        physics: BouncingScrollPhysics(),
        itemCount: 7,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return Padding(
            padding: index == 0
                ? EdgeInsets.only(
                    right: getProportionateScreenWidth(30.0),
                    left: getProportionateScreenWidth(30.0))
                : EdgeInsets.only(
                    right: getProportionateScreenWidth(30.0),
                  ),
            child: SizedBox(
              height: getProportionateScreenHeight(76),
              width: getProportionateScreenWidth(50.0),
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.only(
                        bottom: getProportionateScreenHeight(8.0)),
                    child: CircleAvatar(
                      backgroundColor: Colors.transparent,
                      radius: 25,
                      child: Image(
                        image: AssetImage(MassagesImg.imgs[index]),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  const Text(
                    "Marvin",
                    style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 13.0,
                        color: Color.fromRGBO(0, 0, 0, 0.55)),
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
