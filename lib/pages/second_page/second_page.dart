import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:habbit_tracker_flutter/widgets/special_checkbox.dart';
import 'package:provider/provider.dart';

class Second extends StatelessWidget {
  const Second({
    super.key,
    required this.plan,
  });
  final Map plan;

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
                  Text(
                    moti,
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 50,
                        color: Colors.lightGreen.shade600),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  IconButton(
                      onPressed: () {}, icon: const Icon(Icons.edit_outlined))
                ],
              ),
              const SizedBox(
                height: 90,
              )
            ],
          ),
        ),
        body: LayoutBuilder(
          builder: (context, constraints) {
            return Padding(
              padding: const EdgeInsets.all(2.0),
              child: Container(
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
                      itemBuilder: (context, index) {
                        List data = plan["habbits"][index]["data"];
                        String date = plan["habbits"][index]["date"];
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
                                  "Day\n  ${(index + 1).toString()}",
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
                                        separatorBuilder: (context, index2) =>
                                            const SizedBox(
                                          height: 10,
                                        ),
                                        itemCount: data.length,
                                        itemBuilder: ((context, index2) {
                                          bool done = data[index2]["done"];
                                          return Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              SizedBox(
                                                width: 250,
                                                child: Text(
                                                  data[index2]["habbitName"],
                                                ),
                                              ),
                                              SpecialCheckbox(
                                                done: done,
                                                date: date,
                                                indexOfConstants: index,
                                                indexOfData: index2,
                                              ),
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
