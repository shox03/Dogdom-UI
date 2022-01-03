import 'package:dogdom_ui/providers/bottom_navbar_provider.dart';
import 'package:dogdom_ui/providers/circle_tab_bar_provider.dart';
import 'package:dogdom_ui/providers/homepage_provider.dart';
import 'package:dogdom_ui/providers/release_provider.dart';
import 'package:dogdom_ui/providers/search_field_provider.dart';
import 'package:dogdom_ui/screens/mainpage/main_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => SearchFieldProvider()),
        ChangeNotifierProvider(create: (context) => HomePageProvider()),
        ChangeNotifierProvider(create: (context) => ReleaseProvider()),
        ChangeNotifierProvider(create: (context) => BottomNavBarProvider()),
        ChangeNotifierProvider(create: (context) => CircleTabProvider()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MainPage(),
    );
  }
}
