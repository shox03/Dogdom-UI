import 'package:dogdom_ui/providers/release_provider.dart';
import 'package:dogdom_ui/screens/mainpage/main_page.dart';
import 'package:dogdom_ui/screens/massages_input/massages_input_page.dart';
import 'package:dogdom_ui/screens/release_page/release_1.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ReleaseProvider()),
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
      home: Release1(),
    );
  }
}
