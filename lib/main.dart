import 'package:flutter/material.dart';
import 'package:habbit_tracker_flutter/pages/home_page/home_with_starpvd.dart';
import 'package:habbit_tracker_flutter/providers/home_provider/home_provider.dart';
import 'package:habbit_tracker_flutter/providers/home_provider/title_provider_home.dart';
import 'package:habbit_tracker_flutter/providers/second_page_provider.dart';
import 'package:habbit_tracker_flutter/providers/special_checkbox_provider.dart';
import 'package:habbit_tracker_flutter/providers/star_provider.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: ((context) => StarPVD())),
        ChangeNotifierProvider(create: (create) => HomePVD()),
        ChangeNotifierProvider(create: (((context) => TitleHomePVD()))),
        ChangeNotifierProvider(create: (((context) => SecondPVD()))),
        ChangeNotifierProvider(create: ((context) => SpecialCheckBoxPVD()))
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorSchemeSeed: Colors.yellow,
        fontFamily: "NotoSans",
      ),
      home: const Scaffold(
        body: HomeWithStarPVD(),
      ),
    );
  }
}
