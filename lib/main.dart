import 'package:flutter/material.dart';
import 'package:habbit_tracker_flutter/data/constants.dart';
import 'package:habbit_tracker_flutter/pages/home_page/home_with_starpvd.dart';
import 'package:habbit_tracker_flutter/pages/second_page/second_page.dart';
import 'package:habbit_tracker_flutter/providers/home_provider/home_provider.dart';
import 'package:habbit_tracker_flutter/providers/home_provider/title_provider_home.dart';
import 'package:habbit_tracker_flutter/providers/special_checkbox_provider.dart';
import 'package:habbit_tracker_flutter/providers/star_provider.dart';
import 'package:provider/provider.dart';

List constantT = [
  {
    "title": "Daily Habbits",
    "duration": "14 May to 20 May",
    "moti": "Consistency is Key",
    "success_rate": 88.54,
    "habbits": [
      {
        "date": "14 May",
        "data": [
          {"habbitName": "Wake up early", "done": true},
          {"habbitName": "Drink 2L of water", "done": true},
          {"habbitName": "Sleep before 11 P.M", "done": true},
          {"habbitName": "Code", "done": true},
          {"habbitName": "Walk about 30 mins", "done": true},
          {"habbitName": "Not scroll more than 1 hr", "done": true},
          {"habbitName": "Be consistent", "done": true},
          {"habbitName": "Focus on my life goals", "done": true},
          {"habbitName": "Never stop learning", "done": true},
          {"habbitName": "Keep dreaming and work hard", "done": true},
          {"habbitName": "Take care myself", "done": true},
        ]
      },
      {
        "date": "15 May",
        "data": [
          {"habbitName": "Wake up early", "done": true},
          {"habbitName": "Drink 2L of water", "done": true},
          {"habbitName": "Sleep before 11 P.M", "done": true},
          {"habbitName": "Code", "done": true},
          {"habbitName": "Walk about 30 mins", "done": true},
          {"habbitName": "Not scroll more than 1 hr", "done": true},
          {"habbitName": "Be consistent", "done": true},
          {"habbitName": "Focus on my life goals", "done": true},
          {"habbitName": "Never stop learning", "done": true},
          {"habbitName": "Keep dreaming and work hard", "done": true},
          {"habbitName": "Take care myself", "done": true},
        ]
      },
      {
        "date": "16 May",
        "data": [
          {"habbitName": "Wake up early", "done": true},
          {"habbitName": "Drink 2L of water", "done": true},
          {"habbitName": "Sleep before 11 P.M", "done": true},
          {"habbitName": "Code", "done": true},
          {"habbitName": "Walk about 30 mins", "done": true},
          {"habbitName": "Not scroll more than 1 hr", "done": true},
          {"habbitName": "Be consistent", "done": true},
          {"habbitName": "Focus on my life goals", "done": true},
          {"habbitName": "Never stop learning", "done": true},
          {"habbitName": "Keep dreaming and work hard", "done": true},
          {"habbitName": "Take care myself", "done": true},
        ]
      },
      {
        "date": "17 May",
        "data": [
          {"habbitName": "Wake up early", "done": true},
          {"habbitName": "Drink 2L of water", "done": true},
          {"habbitName": "Sleep before 11 P.M", "done": true},
          {"habbitName": "Code", "done": true},
          {"habbitName": "Walk about 30 mins", "done": true},
          {"habbitName": "Not scroll more than 1 hr", "done": true},
          {"habbitName": "Be consistent", "done": true},
          {"habbitName": "Focus on my life goals", "done": true},
          {"habbitName": "Never stop learning", "done": true},
          {"habbitName": "Keep dreaming and work hard", "done": true},
          {"habbitName": "Take care myself", "done": true},
        ]
      },
      {
        "date": "18 May",
        "data": [
          {"habbitName": "Wake up early", "done": true},
          {"habbitName": "Drink 2L of water", "done": true},
          {"habbitName": "Sleep before 11 P.M", "done": true},
          {"habbitName": "Code", "done": true},
          {"habbitName": "Walk about 30 mins", "done": true},
          {"habbitName": "Not scroll more than 1 hr", "done": true},
          {"habbitName": "Be consistent", "done": true},
          {"habbitName": "Focus on my life goals", "done": true},
          {"habbitName": "Never stop learning", "done": true},
          {"habbitName": "Keep dreaming and work hard", "done": true},
          {"habbitName": "Take care myself", "done": true},
        ]
      },
      {
        "date": "19 May",
        "data": [
          {"habbitName": "Wake up early", "done": true},
          {"habbitName": "Drink 2L of water", "done": true},
          {"habbitName": "Sleep before 11 P.M", "done": true},
          {"habbitName": "Code", "done": true},
          {"habbitName": "Walk about 30 mins", "done": true},
          {"habbitName": "Not scroll more than 1 hr", "done": true},
          {"habbitName": "Be consistent", "done": true},
          {"habbitName": "Focus on my life goals", "done": true},
          {"habbitName": "Never stop learning", "done": true},
          {"habbitName": "Keep dreaming and work hard", "done": true},
          {"habbitName": "Take care myself", "done": true},
        ]
      },
      {
        "date": "20 May",
        "data": [
          {"habbitName": "Wake up early", "done": true},
          {"habbitName": "Drink 2L of water", "done": true},
          {"habbitName": "Sleep before 11 P.M", "done": true},
          {"habbitName": "Code", "done": true},
          {"habbitName": "Walk about 30 mins", "done": true},
          {"habbitName": "Not scroll more than 1 hr", "done": true},
          {"habbitName": "Be consistent", "done": true},
          {"habbitName": "Focus on my life goals", "done": true},
          {"habbitName": "Never stop learning", "done": true},
          {"habbitName": "Keep dreaming and work hard", "done": true},
          {"habbitName": "Take care myself", "done": true},
        ]
      }
    ]
  },
  {
    "title": "Self-Improment Planner",
    "duration": "23 May to 27 May",
    "moti": "take time",
    "success_rate": 88.54,
    "habbits": [
      {
        "date": "23 May",
        "data": [
          {"habbitName": "Code everyday", "done": false},
          {"habbitName": "Read 1 article of FH mz", "done": true},
          {"habbitName": "Listen to 1 Eng Conversation", "done": true},
          {"habbitName": "Read flutter offical docs", "done": false},
          {"habbitName": "Write diary in Eng and Introspect", "done": true}
        ]
      },
      {
        "date": "24 May",
        "data": [
          {"habbitName": "Code everyday", "done": false},
          {"habbitName": "Read 1 article of FH mz", "done": true},
          {"habbitName": "Listen to 1 Eng Conversation", "done": true},
          {"habbitName": "Read flutter offical docs", "done": false},
          {"habbitName": "Write diary in Eng and Introspect", "done": true}
        ]
      },
      {
        "date": "25 May",
        "data": [
          {"habbitName": "Code everyday", "done": false},
          {"habbitName": "Read 1 article of FH mz", "done": false},
          {"habbitName": "Listen to 1 Eng Conversation", "done": true},
          {"habbitName": "Read flutter offical docs", "done": false},
          {"habbitName": "Write diary in Eng and Introspect", "done": false}
        ]
      },
      {
        "date": "26 May",
        "data": [
          {"habbitName": "Code everyday", "done": false},
          {"habbitName": "Read 1 article of FH mz", "done": true},
          {"habbitName": "Listen to 1 Eng Conversation", "done": false},
          {"habbitName": "Read flutter offical docs", "done": true},
          {"habbitName": "Write diary in Eng and Introspect", "done": true}
        ]
      },
      {
        "date": "27 May",
        "data": [
          {"habbitName": "Code everyday", "done": true},
          {"habbitName": "Read 1 article of FH mz", "done": true},
          {"habbitName": "Listen to 1 Eng Conversation", "done": true},
          {"habbitName": "Read flutter offical docs", "done": true},
          {"habbitName": "Write diary in Eng and Introspect", "done": true}
        ]
      }
    ]
  }
];
void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: ((context) => StarPVD())),
        ChangeNotifierProvider(create: (create) => HomePVD()),
        ChangeNotifierProvider(create: (((context) => TitleHomePVD()))),
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
      home: Scaffold(
        body: Second(plan: constantT[0]),
      ),
    );
  }
}
