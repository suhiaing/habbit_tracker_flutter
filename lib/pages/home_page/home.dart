import 'package:flutter/material.dart';
import 'package:habbit_tracker_flutter/data/constants.dart';
import 'package:habbit_tracker_flutter/data/read_file.dart';
import 'package:habbit_tracker_flutter/pages/second_page/second_page.dart';
import 'package:habbit_tracker_flutter/providers/home_provider/home_provider.dart';
import 'package:habbit_tracker_flutter/providers/home_provider/title_provider_home.dart';
import 'package:habbit_tracker_flutter/providers/star_provider.dart';
import 'package:habbit_tracker_flutter/widgets/home_widgets/percentage_indicator.dart';
import 'package:habbit_tracker_flutter/widgets/home_widgets/title_home.dart';
import 'package:habbit_tracker_flutter/widgets/home_widgets/up_bar_home_page.dart';
import 'package:provider/provider.dart';

class Home extends StatefulWidget {
  const Home({super.key, required this.starPVD, this.navigatorKey});
  final StarPVD starPVD;
  final GlobalKey<NavigatorState>? navigatorKey;

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

  int itemCountByConstraints(BoxConstraints constraints) {
    if (constraints.maxWidth < 800) {
      return 1;
    } else if (constraints.maxWidth < 1210) {
      return 2;
    } else if (constraints.maxWidth < 1610) {
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
              var boxDecorationHome = BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.grey,
                      offset: Offset(4, 4),
                      blurRadius: 15,
                      spreadRadius: 5,
                    ),
                    BoxShadow(
                      color: Colors.white,
                      offset: Offset(-4, -4),
                      blurRadius: 15,
                      spreadRadius: 5,
                    )
                  ]);

              var sliverGridDelegateWithFixedCrossAxisCountHome =
                  SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: itemCountByConstraints(constraints),
                mainAxisSpacing: 50.0,
                crossAxisSpacing: 70,
                childAspectRatio: constraints.maxWidth < 800 ? 2 : 1.2,
              );
              if (constraints.maxWidth < 700) {
                return const Center(
                  child: Text("Maximize or Increase the screensize pls"),
                );
              }
              return Padding(
                padding: const EdgeInsets.only(left: 30, right: 30, top: 30),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    UpBarHomePage(
                      starPVD: widget.starPVD,
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    Consumer<HomePVD>(builder: (context, homePVD, _) {
                      return Expanded(
                        child: GridView.builder(
                            itemCount: constants.length,
                            gridDelegate:
                                sliverGridDelegateWithFixedCrossAxisCountHome,
                            itemBuilder: (context, index) {
                              Map plans = constants[index];
                              String duration = plans["duration"];

                              return GestureDetector(
                                onTap: () {
                                  Navigator.push(context,
                                      MaterialPageRoute(builder: (context) {
                                    return Second(
                                      plan: plans,
                                      indexOfConstant: index,
                                    );
                                  }));
                                },
                                onLongPress: () {
                                  showDialog(
                                      context: context,
                                      builder: ((context) {
                                        return AlertDialog(
                                          title: Text(
                                              "Do you want to delete ${plans["title"]} ?"),
                                          actions: [
                                            TextButton(
                                              onPressed: () {
                                                homePVD.removePlan(index);
                                                widget.starPVD.deletePlan();
                                                Navigator.pop(context);
                                              },
                                              child: const Text(
                                                "Yes",
                                                style: TextStyle(
                                                    color: Colors.red),
                                              ),
                                            ),
                                            TextButton(
                                              onPressed: () {
                                                Navigator.pop(context);
                                              },
                                              child: const Text(
                                                "No",
                                                style: TextStyle(
                                                    color: Colors.blue),
                                              ),
                                            ),
                                          ],
                                        );
                                      }));
                                },
                                child: Container(
                                  decoration: boxDecorationHome,
                                  child: Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: [
                                      PercentageIndicator(
                                        index: index,
                                      ),
                                      Consumer<TitleHomePVD>(
                                          builder: ((context, titleHomePVD, _) {
                                        String titleForTitleHomePVd =
                                            constants[index]["title"];

                                        return TitleHome(
                                          title: titleForTitleHomePVd,
                                          index: index,
                                          titleHomePVD: titleHomePVD,
                                        );
                                      })),
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
                      );
                    }),
                  ],
                ),
              );
            }),
          );
        });
  }
}
