import 'package:flutter/material.dart';
import 'package:habbit_tracker_flutter/data/read_file.dart';
import 'package:habbit_tracker_flutter/pages/home.dart';
import 'package:habbit_tracker_flutter/providers/star_provider.dart';
import 'package:habbit_tracker_flutter/stars.dart';
import 'package:habbit_tracker_flutter/widgets/stars_widget.dart';
import 'package:provider/provider.dart';

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
    return FutureBuilder(
      future: starR,
      builder: ((context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const CircularProgressIndicator();
        }
        stars = snapshot.data!;
        return Consumer<StarPVD>(builder: (context, starPVD, _) {
          return const Home();
        });
      }),
    );
  }
}
