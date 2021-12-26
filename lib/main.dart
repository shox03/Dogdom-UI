import 'package:dogdom_ui/login_page/login_page.dart';
import 'package:dogdom_ui/massages/massages_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Massages(),
    );
  }
}
