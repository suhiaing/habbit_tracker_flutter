import 'package:flutter/material.dart';
import 'package:habbit_tracker_flutter/data/read_file.dart';
import 'package:habbit_tracker_flutter/pages/home_page/home.dart';

class HomeWithStarPVD extends StatefulWidget {
  const HomeWithStarPVD({super.key});

  @override
  State<HomeWithStarPVD> createState() => _HomeWithStarPVDState();
}

class _HomeWithStarPVDState extends State<HomeWithStarPVD> {
  late Future<int> starR;
  @override
  void initState() {
    starR = readStar();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return const Home();
  }
}
