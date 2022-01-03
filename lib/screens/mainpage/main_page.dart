import 'package:dogdom_ui/constants/icons.dart';
import 'package:dogdom_ui/constants/size_confi.dart';
import 'package:dogdom_ui/screens/circle/circle_page.dart';
import 'package:dogdom_ui/screens/home/home_page.dart';
import 'package:dogdom_ui/screens/massages/massages_page.dart';
import 'package:dogdom_ui/screens/massages_input/massages_input_page.dart';
import 'package:dogdom_ui/screens/notice%20center/notice_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _currentTabIndex = 0;

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    final _kTabPages = <Widget>[
      const NoticePage(),
      const HomeSelectPage(),
      const Massages(),
      const CirclePage(),
      const MassagesInput(),
    ];
    final _kBottmonNavBarItems = <BottomNavigationBarItem>[
      BottomNavigationBarItem(
        label: "",
        icon: SvgPicture.asset(
          MyIcons.home,
          color: _currentTabIndex == 0
              ? Color.fromRGBO(250, 102, 80, 1)
              : Colors.black,
        ),
      ),
      BottomNavigationBarItem(
        label: "",
        icon: SvgPicture.asset(
          MyIcons.circle,
          color: _currentTabIndex == 1
              ? Color.fromRGBO(250, 102, 80, 1)
              : Colors.black,
        ),
      ),
      BottomNavigationBarItem(
        label: "",
        icon: SvgPicture.asset(
          MyIcons.release,
          color: _currentTabIndex == 2
              ? Color.fromRGBO(250, 102, 80, 1)
              : Colors.black,
        ),
      ),
      BottomNavigationBarItem(
          label: "",
          icon: SvgPicture.asset(
            MyIcons.message,
            color: _currentTabIndex == 3
                ? Color.fromRGBO(250, 102, 80, 1)
                : Colors.black,
          )),
      BottomNavigationBarItem(
        label: "",
        icon: SvgPicture.asset(
          MyIcons.user,
          color: _currentTabIndex == 4
              ? Color.fromRGBO(250, 102, 80, 1)
              : Colors.black,
        ),
      ),
    ];
    assert(_kTabPages.length == _kBottmonNavBarItems.length);
    final bottomNavBar = BottomNavigationBar(
      unselectedItemColor: Colors.black,
      selectedItemColor: Color.fromRGBO(250, 102, 80, 1),
      items: _kBottmonNavBarItems,
      currentIndex: _currentTabIndex,
      onTap: (int index) {
        setState(() {
          _currentTabIndex = index;
        });
      },
    );
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Column(
          children: [
            Expanded(child: _kTabPages[_currentTabIndex]),
            ClipRRect(
              child: SizedBox(
                height: getProportionateScreenHeight(84.0),
                child: bottomNavBar,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
