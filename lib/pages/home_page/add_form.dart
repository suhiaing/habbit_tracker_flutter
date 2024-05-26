import 'package:flutter/material.dart';

class AddPlanForm extends StatefulWidget {
  const AddPlanForm({
    super.key,
  });
  @override
  State<AddPlanForm> createState() => _AddPlanFormState();
}

class _AddPlanFormState extends State<AddPlanForm> {
  final newNameController = TextEditingController();
  final habbitNameController = TextEditingController();

  String _dateValue = "7";

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
                height: 800,
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
                    height: 700,
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Expanded(
                              child: TextField(
                                controller: newNameController,
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
                                      _dateValue = newValue!;
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
                                  value: _dateValue,
                                ),
                              ),
                            )
                          ],
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
