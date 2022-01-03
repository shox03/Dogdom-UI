import 'package:dogdom_ui/constants/size_confi.dart';
import 'package:dogdom_ui/screens/massages/modul/massages_modul.dart';
import 'package:dogdom_ui/screens/notice%20center/modul/notice_list_text.dart';
import 'package:dogdom_ui/screens/notice%20center/widgets/notice_bar.dart';
import 'package:dogdom_ui/screens/notice%20center/widgets/notice_topbar.dart';
import 'package:flutter/material.dart';

class NoticePage extends StatelessWidget {
  const NoticePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    SizeConfig().init(context);
    return SafeArea(
      child: Scaffold(
        body: CustomScrollView(
          slivers: [
            SliverList(
              delegate: SliverChildListDelegate(
                [
                  Column(
                    children: [
                      Stack(
                        children: [
                          Column(
                            children: [
                              buildNoticeTopBar(),
                              SizedBox(
                                  height: getProportionateScreenHeight(40.0))
                            ],
                          ),
                          Positioned(
                            left: getProportionateScreenWidth(18.0),
                            bottom: 0,
                            child: Container(
                              height: getProportionateScreenHeight(102.0),
                              width: getProportionateScreenWidth(338.0),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(16.0),
                                color: Colors.white,
                              ),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: const [
                                  NoticeBar(
                                    imgOfIcons:
                                        "assets/icon-.icon-Message-Messages-icon-Message-Praise.svg",
                                    nameOfIcons: "Price",
                                  ),
                                  NoticeBar(
                                    imgOfIcons:
                                        "assets/icon-.icon-Message-Messages-icon-Message-Messages.svg",
                                    nameOfIcons: "Price",
                                  ),
                                  NoticeBar(
                                    imgOfIcons:
                                        "assets/icon-.icon-Message-Messages-icon-Message-Comments.svg",
                                    nameOfIcons: "Comments",
                                  ),
                                  NoticeBar(
                                    imgOfIcons:
                                        "assets/icon-.icon-Message-Messages-icon-Message-Help.svg",
                                    nameOfIcons: "Help",
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: getProportionateScreenHeight(10.0)),
                      SizedBox(
                        height: height * 0.63,
                        width: width,
                        child: ListView.builder(
                          itemCount: 3,
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: EdgeInsets.only(
                                top: getProportionateScreenHeight(16.0),
                              ),
                              child: ListTile(
                                selectedColor: Colors.red,
                                leading: index == 0
                                    ? CircleAvatar(
                                        backgroundImage: AssetImage(
                                            MassagesImg.imgs[2].toString()),
                                        radius: 23,
                                      )
                                    : const CircleAvatar(
                                        backgroundColor: Colors.transparent,
                                        radius: 23,
                                      ),
                                title: Text(
                                  NoticeListTitle.title[index],
                                  style: const TextStyle(
                                      fontSize: 16.0,
                                      fontWeight: FontWeight.w500),
                                ),
                                trailing: Text(
                                  NoticeListTime.time[index],
                                  style: const TextStyle(
                                      fontSize: 11.0,
                                      fontWeight: FontWeight.w400),
                                ),
                                subtitle: Text(
                                  NoticeListSubtitle.subtitle[index],
                                  style: const TextStyle(
                                      fontSize: 13.0,
                                      fontWeight: FontWeight.w400),
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
