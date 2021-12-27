import 'package:dogdom_ui/constants/colors.dart';
import 'package:dogdom_ui/constants/icons.dart';
import 'package:dogdom_ui/providers/bottom_navbar_provider.dart';
import 'package:dogdom_ui/screens/massages/massages_page.dart';
import 'package:dogdom_ui/screens/massages_input/massages_input_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_svg/flutter_svg.dart';

class MyBottomNavBar extends StatelessWidget {
  const MyBottomNavBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var _contexWatch = context.watch<BottomNavBarProvider>();
    int _index = _contexWatch.currentIndex;
    return BottomNavigationBar(
      backgroundColor: whiteConst,
      elevation: 0,
      type: BottomNavigationBarType.fixed,
      currentIndex: _index,
      selectedItemColor: redConst,
      onTap: (value) =>
          context.read<BottomNavBarProvider>().changeBottomIndex(value),
      items: [
        buildBottomNavBarItem(_index, 0, MyIcons.homeFill, MyIcons.home),
        buildBottomNavBarItem(_index, 1, MyIcons.circleFill, MyIcons.circle),
        buildBottomNavBarItem(_index, 2, MyIcons.release, MyIcons.release),
        buildBottomNavBarItem(_index, 3, MyIcons.messageFill, MyIcons.message),
        buildBottomNavBarItem(_index, 4, MyIcons.userFill, MyIcons.user),
      ],
    );
  }

  BottomNavigationBarItem buildBottomNavBarItem(int _index, int _itemNumber,
      String _selectedIcon, String _unselectedIcon) {
    return BottomNavigationBarItem(
        icon: SvgPicture.asset(
          _index == _itemNumber ? _selectedIcon : _unselectedIcon,
          color: _index == _itemNumber ? redConst : blackConst,
        ),
        label: '');
  }
}
