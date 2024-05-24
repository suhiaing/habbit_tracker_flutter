import 'package:flutter/material.dart';
import 'package:habbit_tracker_flutter/pages/home_page/home_with_starpvd.dart';
import 'package:habbit_tracker_flutter/providers/home_provider/home_provider.dart';
import 'package:habbit_tracker_flutter/providers/home_provider/percentage_indicator_provider.dart';
import 'package:habbit_tracker_flutter/providers/home_provider/title_provider_home.dart';
import 'package:habbit_tracker_flutter/providers/star_provider.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: ((context) => StarPVD())),
        ChangeNotifierProvider(create: (context) => HomePVD()),
        ChangeNotifierProvider(create: (context) => PCTpvd()),
        ChangeNotifierProvider(create: (((context) => TitleHomePVD()))),
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
      theme: ThemeData.light(useMaterial3: true),
      home: const Scaffold(
        body: HomeWithStarPVD(),
      ),
    );
  }
}
