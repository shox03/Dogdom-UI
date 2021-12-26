import 'package:dogdom_ui/constants/size_confi.dart';
import 'package:dogdom_ui/massages/modul/massages_modul.dart';
import 'package:flutter/material.dart';

class Bodycards extends StatelessWidget {
  const Bodycards({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List todoList = [];

    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    SizeConfig().init(context);
    return SizedBox(
      height: getProportionateScreenHeight(569.0),
      width: width,
      child: ListView.builder(
        physics: BouncingScrollPhysics(),
        itemCount: 11,
        scrollDirection: Axis.vertical,
        itemBuilder: (context, index) => Dismissible(
          background: Container(
            alignment: Alignment.center,
            color: Color.fromRGBO(250, 102, 80, 1),
            child: Text(
              "Delete",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 15.0,
                  fontWeight: FontWeight.normal),
            ),
          ),
          key: Key(todoList.toString()),
          child: SizedBox(
            height: getProportionateScreenHeight(70.0),
            width: width,
            child: ListTile(
              leading: SizedBox(
                height: getProportionateScreenHeight(70.0),
                width: getProportionateScreenWidth(60.0),
                child: Row(
                  children: [
                    index == 0 || index == 2
                        ? const CircleAvatar(
                            radius: 3.0,
                            backgroundColor: Color(0xFFFA6650),
                          )
                        : const CircleAvatar(
                            radius: 3.0,
                            backgroundColor: Colors.white,
                          ),
                    const SizedBox(width: 6.0),
                    CircleAvatar(
                      radius: 25.0,
                      backgroundColor: Colors.transparent,
                      backgroundImage: AssetImage(MassagesImg.imgs[index]),
                    )
                  ],
                ),
              ),
              title: const Text(
                "Black Marvin",
                style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.w500),
              ),
              subtitle: const Text(
                "There's somebody out there somebodyyyyyyyy",
                overflow: TextOverflow.ellipsis,
              ),
              trailing: const Text(
                "01:30",
                style: TextStyle(
                    color: Color.fromRGBO(0, 0, 0, 0.25),
                    fontSize: 11,
                    fontWeight: FontWeight.w400),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
