import 'package:flutter/material.dart';
import 'package:habbit_tracker_flutter/pages/home_page/home.dart';
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
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.green, // Change the app's color scheme to blue
        ),
      ),
      home: const Home(),
    );
  }
}
