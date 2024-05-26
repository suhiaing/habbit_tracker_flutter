import 'package:flutter/material.dart';
import 'package:habbit_tracker_flutter/data/constants.dart';
import 'package:habbit_tracker_flutter/data/read_file.dart';
import 'package:habbit_tracker_flutter/data/write_data.dart';
import 'package:habbit_tracker_flutter/pages/home_page/add_form.dart';
import 'package:habbit_tracker_flutter/pages/second_page/second_page.dart';
import 'package:habbit_tracker_flutter/providers/home_provider/home_provider.dart';
import 'package:habbit_tracker_flutter/providers/home_provider/title_provider_home.dart';
import 'package:habbit_tracker_flutter/widgets/home_widgets/title_home.dart';
import 'package:habbit_tracker_flutter/widgets/home_widgets/up_bar_home_page.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:provider/provider.dart';

class HabbitTracker extends StatefulWidget {
  const HabbitTracker({super.key});

  @override
  State<HabbitTracker> createState() => _HabbitTrackerState();
}

class _HabbitTrackerState extends State<HabbitTracker> {
  late Future<List<dynamic>> constantF;
  @override
  void initState() {
    super.initState();
    constantF = readFile();
  }

  int itemCountByConstraints(BoxConstraints constraints) {
    if (constraints.maxWidth < 900) {
      return 1;
    } else if (constraints.maxWidth < 1270) {
      return 2;
    } else if (constraints.maxWidth < 1710) {
      return 3;
    }
    return 4;
  }

  @override
  Widget build(BuildContext context) {
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

    return Consumer<HomePVD>(builder: (context, homePVD, _) {
      return Scaffold(
          body: FutureBuilder(
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
                      childAspectRatio: constraints.maxWidth < 900 ? 2 : 1.2,
                    );
                    double calculateSuccessRate(int index) {
                      List dateCount = constants[index]["habbits"];

                      int successRateRaw = 0;
                      int count = 0;
                      for (int i = 0; i < dateCount.length; i++) {
                        for (int j = 0; j < dateCount[i]["data"].length; j++) {
                          count += 1;

                          if (dateCount[i]["data"][j]["done"] == true) {
                            successRateRaw += 1;
                          }
                        }
                      }

                      double successRate = (successRateRaw / count) * 100;

                      // if (successRate == 100.00 &&
                      //     constants[index]["hundredPercentage"] == false) {
                      //   widget.starPVD.getHundredPercentage();
                      //   constants[index]["hundredPercentage"] = true;
                      // } 100 ဖြစ်သွားရင် star တိုးပေမဲ့ true ပြန်လျှော့လိုက်ရင် star ပြန်လျှော့လို့မရ

                      constants[index]["successRate"] = successRate;
                      writeData(constants);

                      return successRate;
                    }

                    if (constraints.maxWidth < 730) {
                      return const Center(
                        child: Text("Maximize or Increase the screensize pls"),
                      );
                    }
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            const UpBarHomePage(),
                            IconButton(
                                onPressed: () {
                                  setState(() {
                                    constantF = readFile();
                                  });
                                },
                                icon: const Icon(Icons.refresh)),
                          ],
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        Expanded(
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
                                  onLongPress: () {},
                                  child: Container(
                                    decoration: boxDecorationHome,
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                      children: [
                                        CircularPercentIndicator(
                                          radius: 85,
                                          lineWidth: 15,
                                          percent:
                                              (calculateSuccessRate(index) /
                                                  100),
                                          progressColor: successRateColor(
                                              calculateSuccessRate(index)),
                                          backgroundColor: successRateColor(
                                                  calculateSuccessRate(index))
                                              .withOpacity(0.25),
                                          center: Text(
                                            "${calculateSuccessRate(index).toStringAsFixed(1)}%",
                                            style:
                                                const TextStyle(fontSize: 20),
                                          ),
                                          circularStrokeCap:
                                              CircularStrokeCap.round,
                                        ),
                                        Consumer<TitleHomePVD>(builder:
                                            ((context, titleHomePVD, _) {
                                          String titleForTitleHomePVd =
                                              constants[index]["title"];

                                          return Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              TitleHome(
                                                title: titleForTitleHomePVd,
                                                index: index,
                                                titleHomePVD: titleHomePVD,
                                              ),
                                              IconButton(
                                                  onPressed: () {
                                                    showDialog(
                                                        context: context,
                                                        builder: ((context) {
                                                          return AlertDialog(
                                                            title: Text(
                                                                "Do you want to delete ${plans["title"]} ?"),
                                                            actions: [
                                                              TextButton(
                                                                onPressed: () {
                                                                  homePVD
                                                                      .removePlan(
                                                                          index);
                                                                  Navigator.pop(
                                                                      context);
                                                                },
                                                                child:
                                                                    const Text(
                                                                  "Yes",
                                                                  style: TextStyle(
                                                                      color: Colors
                                                                          .red),
                                                                ),
                                                              ),
                                                              TextButton(
                                                                onPressed: () {
                                                                  Navigator.pop(
                                                                      context);
                                                                },
                                                                child:
                                                                    const Text(
                                                                  "No",
                                                                  style: TextStyle(
                                                                      color: Colors
                                                                          .blue),
                                                                ),
                                                              ),
                                                            ],
                                                          );
                                                        }));
                                                  },
                                                  icon: const Icon(
                                                    Icons.delete,
                                                    color: Colors.red,
                                                  ))
                                            ],
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
                        ),
                      ],
                    );
                  }),
                );
              }),
          floatingActionButton: FloatingActionButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return AddPlanForm(
                    homePVD: homePVD,
                  );
                }));
              },
              tooltip: 'Add a plan',
              child: const Icon(Icons.add)));
    });
  }
}
