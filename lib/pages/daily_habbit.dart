import 'package:flutter/material.dart';
import 'package:habbit_tracker_flutter/data/daily_data.dart';
import 'package:habbit_tracker_flutter/data/read_file.dart';
import 'package:habbit_tracker_flutter/providers/daily_provider.dart';
import 'package:provider/provider.dart';

class DailyHabbit extends StatefulWidget {
  const DailyHabbit({super.key});

  @override
  State<DailyHabbit> createState() => _DailyHabbitState();
}

class _DailyHabbitState extends State<DailyHabbit> {
  late Future<List<dynamic>> dailyDataA;
  @override
  void initState() {
    dailyDataA = readDaily();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Widget giveIcon(bool done) {
      return Container(
        width: 30,
        height: 30,
        decoration: BoxDecoration(
          color: done == true ? Colors.green : Colors.red,
          borderRadius: BorderRadius.circular(30),
        ),
        child: Icon(
            color: Colors.white,
            size: 25,
            done == true ? Icons.check : Icons.clear),
      );
    }

    return Consumer<DailyProvider>(builder: (context, dailyPVD, _) {
      return Scaffold(
        appBar: AppBar(
          title: const Text("Daily Healthy Habbits"),
        ),
        body: FutureBuilder(
          future: dailyDataA,
          builder: ((context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }

            dailyData = snapshot.data!;
            return ListView.builder(
              itemCount: dailyData.length,
              itemBuilder: ((context, index) {
                return Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Row(
                    children: [
                      Expanded(
                          child: Text(
                        dailyData[index]["name"],
                        overflow: TextOverflow.ellipsis,
                      )),
                      GestureDetector(
                        onTap: () {
                          dailyPVD.onChangeDailyHabbit(index);
                        },
                        child: SizedBox(
                            width: 40,
                            height: 40,
                            child: giveIcon(dailyData[index]["done"])),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      IconButton(
                        onPressed: () {
                          dailyPVD.removeHabbit(index);
                        },
                        icon: const Icon(
                          Icons.delete,
                          color: Colors.red,
                        ),
                      ),
                    ],
                  ),
                );
              }),
            );
          }),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            showDialog(
                context: context,
                builder: (context) {
                  final newNameController = TextEditingController();
                  return AlertDialog(
                    title: const Text("Add new habbit"),
                    content: TextField(
                      controller: newNameController,
                      decoration: InputDecoration(
                        hintText: 'Enter',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                      ),
                    ),
                    actions: [
                      TextButton(
                          onPressed: () {
                            if (newNameController.text != "") {
                              dailyPVD.addNewhabbit({
                                "name": newNameController.text,
                                "done": false
                              });
                            }
                            Navigator.pop(context);
                          },
                          child: const Text("Okay")),
                      TextButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: const Text(
                            "No",
                            style: TextStyle(color: Colors.red),
                          )),
                    ],
                  );
                });
          },
          tooltip: "Add a daily habbit",
          child: const Icon(Icons.add),
        ),
      );
    });
  }
}
