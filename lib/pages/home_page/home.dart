import 'package:flutter/material.dart';
import 'package:habbit_tracker_flutter/pages/daily_habbit.dart';
import 'package:habbit_tracker_flutter/pages/home_page/habbit_tracker.dart';

class Home extends StatefulWidget {
  const Home({super.key, this.navigatorKey});
  final GlobalKey<NavigatorState>? navigatorKey;

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _bnbCurrentIndex = 0;
  List<Widget> body = const [
    HabbitTracker(),
    DailyHabbit(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: body[_bnbCurrentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _bnbCurrentIndex,
        onTap: (int newIndex) {
          setState(() {
            _bnbCurrentIndex = newIndex;
          });
        },
        items: const [
          BottomNavigationBarItem(
              label: "Habbit Tracker",
              icon: Icon(Icons.calendar_view_month_sharp)),
          BottomNavigationBarItem(
              label: "Daily Healthy Habbits", icon: Icon(Icons.check_box))
        ],
      ),
    );
  }
}
