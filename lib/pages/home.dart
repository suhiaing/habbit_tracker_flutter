import 'package:flutter/material.dart';
import 'package:habbit_tracker_flutter/constants.dart';
import 'package:habbit_tracker_flutter/data/read_file.dart';
import 'package:habbit_tracker_flutter/widgets/title_home.dart';
import 'package:habbit_tracker_flutter/widgets/up_bar_home_page.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late Future<List<dynamic>> constantF;
  @override
  void initState() {
    super.initState();
    constantF = readFile();
  }

  Color successRateColor(double successRate) {
    if (successRate >= 70) {
      return Colors.green;
    } else if (successRate >= 40) {
      return Colors.orange.shade700;
    } else if (successRate >= 0) {
      return Colors.red.shade700;
    }

    return Colors.black;
  }

  int itemCountByConstraints(BoxConstraints constraints) {
    if (constraints.maxWidth < 750) {
      return 1;
    } else if (constraints.maxWidth < 1100) {
      return 2;
    } else if (constraints.maxWidth < 1450) {
      return 3;
    }
    return 4;
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: constantF,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          constants = snapshot.data!;
          return LayoutBuilder(
            builder: ((context, constraints) {
              return Padding(
                padding: const EdgeInsets.only(left: 30, right: 30, top: 30),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const UpBarHomePage(),
                    const SizedBox(
                      height: 30,
                    ),
                    Expanded(
                      child: GridView.builder(
                          itemCount: constants.length,
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: itemCountByConstraints(constraints),
                            mainAxisSpacing: 50.0,
                            crossAxisSpacing: 70,
                            childAspectRatio:
                                constraints.maxWidth < 750 ? 2 : 1.2,
                          ),
                          itemBuilder: (context, index) {
                            Map plans = constants[index];
                            String title = plans["title"];
                            String duration = plans["duration"];
                            double successRate = plans["success_rate"];

                            return GestureDetector(
                              child: Container(
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(30),
                                    boxShadow: const [
                                      BoxShadow(
                                        color: Colors.grey,
                                        offset: Offset(4, 4),
                                        blurRadius: 15,
                                        spreadRadius: 5,
                                      ),
                                      BoxShadow(
                                        color: Colors.white70,
                                        offset: Offset(-4, -4),
                                        blurRadius: 15,
                                        spreadRadius: 5,
                                      )
                                    ]),
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    CircularPercentIndicator(
                                      radius: 85,
                                      lineWidth: 16,
                                      percent: (successRate / 100),
                                      progressColor:
                                          successRateColor(successRate),
                                      backgroundColor:
                                          successRateColor(successRate)
                                              .withOpacity(0.25),
                                      center: Text(
                                        "${successRate.toString()}%",
                                        style: const TextStyle(fontSize: 28),
                                      ),
                                      circularStrokeCap:
                                          CircularStrokeCap.round,
                                    ),
                                    TitleHome(
                                      title: title,
                                      index: index,
                                    ),
                                    Text(
                                      duration,
                                      style: TextStyle(
                                          fontSize: 18,
                                          color: Colors.blueGrey.shade300),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          }),
                    ),
                  ],
                ),
              );
            }),
          );
        });
  }
}
