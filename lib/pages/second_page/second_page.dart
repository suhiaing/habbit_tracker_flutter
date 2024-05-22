import 'package:flutter/material.dart';
import 'package:habbit_tracker_flutter/providers/second_page_provider.dart';

class Second extends StatelessWidget {
  const Second({super.key, required this.plan, required this.secondPVD});
  final Map plan;
  final SecondPVD secondPVD;

  @override
  Widget build(BuildContext context) {
    final scrollController = ScrollController();
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () => Navigator.pop(context),
          ),
          toolbarHeight: 220,
          title: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text(
                    plan["title"],
                    style: const TextStyle(fontSize: 30),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  Text(plan["duration"],
                      style: const TextStyle(fontSize: 20, color: Colors.grey)),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  Text(
                    plan["moti"],
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
        body: LayoutBuilder(builder: (context, constraints) {
          return Padding(
            padding: const EdgeInsets.all(2.0),
            child: Container(
              color: const Color.fromARGB(255, 234, 232, 232),
              child: Scrollbar(
                thumbVisibility: true,
                trackVisibility: true,
                thickness: 5,
                controller: scrollController,
                child: SizedBox(
                  height: 1000,
                  child: ListView.builder(
                      controller: scrollController,
                      itemCount: plan["habbits"][0]["data"].length,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, itemCount) {
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
                                  "Day\n  ${(itemCount + 1).toString()}",
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
                                    Container(
                                      width: 100,
                                      height: 50,
                                      decoration: BoxDecoration(
                                          color: Colors.lightGreen.shade400,
                                          borderRadius:
                                              BorderRadius.circular(10)),
                                      child: Center(
                                        child: Text(
                                          plan["habbits"][0]["data"][itemCount]
                                              ["date"],
                                          style: const TextStyle(
                                              fontSize: 17,
                                              color: Colors.white),
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                        child: ListView.separated(
                                      itemCount: plan["habbits"].length,
                                      separatorBuilder:
                                          (BuildContext context, int index) =>
                                              const SizedBox(
                                        height: 10,
                                      ),
                                      itemBuilder:
                                          (BuildContext context, int index) {
                                        return Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Text(plan["habbits"][index]
                                                  ["habbitName"]),
                                            ],
                                          ),
                                        );
                                      },
                                    )),
                                  ],
                                ),
                              ),
                            )
                          ],
                        );
                      }),
                ),
              ),
            ),
          );
        }),
      ),
    );
  }
}
