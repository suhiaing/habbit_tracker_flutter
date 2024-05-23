import 'package:flutter/material.dart';
import 'package:habbit_tracker_flutter/providers/special_checkbox_provider.dart';
import 'package:habbit_tracker_flutter/widgets/special_checkbox.dart';
import 'package:provider/provider.dart';

class Second extends StatelessWidget {
  const Second({super.key, required this.plan, required this.indexOfConstant});
  final Map plan;
  final int indexOfConstant;

  @override
  Widget build(BuildContext context) {
    final scrollController = ScrollController();

    String title = plan["title"];
    String duration = plan["duration"];
    String moti = plan["moti"];
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          toolbarHeight: 220,
          title: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: const Icon(Icons.arrow_back_ios),
                  ),
                  Text(
                    title,
                    style: const TextStyle(fontSize: 30),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  Text(duration,
                      style: const TextStyle(fontSize: 20, color: Colors.grey)),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  const SizedBox(
                    width: 40,
                  ),
                  SizedBox(
                    child: Text(
                      moti,
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 50,
                          color: Colors.lightGreen.shade600),
                    ),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  IconButton(
                      onPressed: () {}, icon: const Icon(Icons.edit_outlined))
                ],
              ),
              Container(
                color: Colors.white,
                height: 95,
              )
            ],
          ),
        ),
        body: LayoutBuilder(
          builder: (context, constraints) {
            return Padding(
              padding: const EdgeInsets.all(2.0),
              child: Container(
                color: Colors.white,
                child: Scrollbar(
                  thumbVisibility: true,
                  trackVisibility: true,
                  thickness: 5,
                  controller: scrollController,
                  child: SizedBox(
                    height: 1000,
                    child: ListView.builder(
                      //itemCount = 7 for index 1
                      controller: scrollController,
                      itemCount: plan["habbits"].length,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index2) {
                        List data = plan["habbits"][index2]["data"];
                        String date = plan["habbits"][index2]["date"];
                        return Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Container(
                              height: 150,
                              width: 300,
                              decoration: const BoxDecoration(
                                color: Colors.white,
                                boxShadow: [
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
                                ],
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(150),
                                  topRight: Radius.circular(150),
                                ),
                              ),
                              child: Center(
                                child: Text(
                                  "Day\n  ${(index2 + 1).toString()}",
                                  style: const TextStyle(
                                    color: Colors.black,
                                    fontSize: 30,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                            Expanded(
                              child: Container(
                                width: 380,
                                decoration: BoxDecoration(
                                  border: Border(
                                    left: BorderSide(
                                        width: 1.0,
                                        color: Colors.grey.shade500),
                                    right: BorderSide(
                                        width: 1.0, color: Colors.grey.shade50),
                                  ),
                                  color: Colors.white,
                                ),
                                child: Column(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(10.0),
                                      child: Container(
                                        width: 100,
                                        height: 50,
                                        decoration: BoxDecoration(
                                            color: Colors.lightGreen.shade400,
                                            borderRadius:
                                                BorderRadius.circular(10)),
                                        child: Center(
                                          child: Text(
                                            //bla bla
                                            date,
                                            style: const TextStyle(
                                                fontSize: 17,
                                                color: Colors.white),
                                          ),
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      child: ListView.separated(
                                        separatorBuilder: (context, index3) =>
                                            const SizedBox(
                                          height: 10,
                                        ),
                                        itemCount: data.length,
                                        itemBuilder: ((context, index3) {
                                          return Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              SizedBox(
                                                width: 250,
                                                child: Text(
                                                  data[index3]["habbitName"],
                                                  style: const TextStyle(
                                                    fontSize: 16,
                                                  ),
                                                ),
                                              ),
                                              Consumer<SpecialCheckBoxPVD>(
                                                  builder: (contex,
                                                      specialCheckboxPVD, _) {
                                                bool done =
                                                    data[index3]["done"];
                                                int indexSCB = index3;

                                                return SpecialCheckbox(
                                                  done: done,
                                                  date: date,
                                                  indexOfConstant:
                                                      indexOfConstant,
                                                  indexOfData: index2,
                                                  indexOfDone: indexSCB,
                                                  specialCheckBoxPVD:
                                                      specialCheckboxPVD,
                                                );
                                              }),
                                            ],
                                          );
                                        }),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            )
                          ],
                        );
                      },
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
