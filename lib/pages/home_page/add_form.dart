import 'package:flutter/material.dart';
import 'package:habbit_tracker_flutter/providers/home_provider/home_provider.dart';
import 'package:intl/intl.dart';

class AddPlanForm extends StatefulWidget {
  final HomePVD homePVD;
  const AddPlanForm({
    required this.homePVD,
    super.key,
  });
  @override
  State<AddPlanForm> createState() => _AddPlanFormState();
}

class _AddPlanFormState extends State<AddPlanForm> {
  final titleController = TextEditingController();
  final habbitNameController = TextEditingController();
  final motiController = TextEditingController();
  String dateValue = "7";

  final List<String> _itemValue = ["5", "7", "10", "15", "20", "30"];
  List<String> habbitName = [];
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.green, // Change the app's color scheme to blue
        ),
      ),
      home: Scaffold(
        body: Center(
          child: Column(
            children: [
              const Text(
                "Add New Plan",
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                width: 600,
                height: 400,
                decoration: BoxDecoration(
                    color: Colors.black12,
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
                    ]),
                child: Center(
                  child: SizedBox(
                    width: 500,
                    height: 350,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Expanded(
                              child: TextField(
                                controller: titleController,
                                decoration: const InputDecoration(
                                    hintText: "Enter the name of new plan",
                                    hintStyle: TextStyle(color: Colors.black)),
                              ),
                            ),
                            const SizedBox(
                              width: 20,
                            ),
                            Container(
                              color: Colors.transparent,
                              child: Center(
                                child: DropdownButton<String>(
                                  underline: Container(
                                    height: 0,
                                  ),
                                  onChanged: (String? newValue) {
                                    setState(() {
                                      dateValue = newValue!;
                                    });
                                  },
                                  items: List.generate(
                                    _itemValue.length,
                                    (index) => DropdownMenuItem(
                                      value: _itemValue[index],
                                      child: Text(
                                        "${_itemValue[index]} Days",
                                      ),
                                    ),
                                  ),
                                  value: dateValue,
                                ),
                              ),
                            )
                          ],
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        SizedBox(
                          width: 500,
                          height: 50,
                          child: TextField(
                            controller: motiController,
                            decoration: const InputDecoration(
                                hintText:
                                    "the phrase that can motivate you. (3 words to 5 words recommend)",
                                hintStyle: TextStyle(color: Colors.black)),
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Expanded(
                          child: ListView.separated(
                              itemCount: habbitName.length,
                              separatorBuilder: (context, index) =>
                                  const SizedBox(
                                    height: 10,
                                  ),
                              itemBuilder: (context, index) {
                                return Container(
                                  height: 60,
                                  decoration: BoxDecoration(
                                      border: Border.all(
                                          color: Colors.black, width: 1.3),
                                      color: Colors.transparent,
                                      borderRadius: BorderRadius.circular(10)),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      SizedBox(
                                        width: 400,
                                        child: Text(
                                          habbitName[index],
                                          style: const TextStyle(
                                            color: Colors.black,
                                            fontSize: 20,
                                          ),
                                        ),
                                      ),
                                      IconButton(
                                          onPressed: () {
                                            setState(() {
                                              habbitName
                                                  .remove(habbitName[index]);
                                            });
                                          },
                                          icon: const Icon(
                                            Icons.delete,
                                            color: Colors.red,
                                          ))
                                    ],
                                  ),
                                );
                              }),
                        ),
                        Row(
                          children: [
                            Expanded(
                              child: TextField(
                                controller: habbitNameController,
                                decoration: InputDecoration(
                                  hintText: 'Enter new habbit',
                                  hintStyle:
                                      const TextStyle(color: Colors.black),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10.0),
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(
                              width: 20,
                            ),
                            TextButton(
                              onPressed: () {
                                setState(() {
                                  if (habbitNameController.text != "") {
                                    habbitName.add(habbitNameController.text);
                                  }
                                  habbitNameController.text = "";
                                });
                              },
                              child: const Text(
                                "Add",
                                style: TextStyle(fontSize: 18),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 50,
              ),
              SizedBox(
                width: 500,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: 130,
                      height: 55,
                      color: const Color.fromARGB(255, 38, 170, 43),
                      child: TextButton(
                          onPressed: () {
                            widget.homePVD.addPlan(dataFormatting(
                                title: titleController.text,
                                habbitNames: habbitName,
                                duration: int.parse(dateValue),
                                moti: motiController.text));
                            Navigator.pop(context);
                          },
                          child: const Row(
                            children: [
                              Icon(
                                Icons.check,
                                color: Colors.white,
                                size: 22,
                              ),
                              Text(
                                "  Okay",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 18),
                              ),
                            ],
                          )),
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    Container(
                      width: 130,
                      height: 55,
                      color: Colors.red,
                      child: TextButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: const Row(
                            children: [
                              Icon(
                                Icons.clear,
                                color: Colors.white,
                                size: 22,
                              ),
                              Text(
                                "  Cancel",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 18),
                              ),
                            ],
                          )),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

Map dataFormatting({
  required String title,
  required List habbitNames,
  required int duration,
  required String moti,
}) {
  //singular data_es
  List<String> dateList = [];
  String durationInText = "";

  //date
  for (int i = 0; i < duration; i++) {
    DateTime date = DateTime.now().add(Duration(days: i));
    DateFormat formatter = DateFormat('d MMM');
    String formattedDate = formatter.format(date);
    dateList.add(formattedDate);
  }

  int lastIndexOfdateList = dateList.length - 1;
  String firstDay = dateList[0];
  String secondDay = dateList[lastIndexOfdateList];
  durationInText = (firstDay) + (" ") + ("to") + (" ") + (secondDay);

  Map plans = {
    "title": title,
    "duration": durationInText,
    "moti": moti,
    "successRate": 0.00,
    "habbits": List.generate(duration, (i) {
      return {
        "date": dateList[i],
        "data": List.generate(
          habbitNames.length,
          (j) {
            return {
              "habbitName": habbitNames[j],
              "done": false,
              "note": "note"
            };
          },
        ),
      };
    }),
  };

  return plans;
}
