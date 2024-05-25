import 'package:flutter/material.dart';
import 'package:habbit_tracker_flutter/widgets/special_checkbox.dart';

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
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.green, // Change the app's color scheme to blue
        ),
      ),
      home: Scaffold(
        appBar: AppBar(
          toolbarHeight: 30,
          title: Row(
            children: [
              IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: const Icon(Icons.arrow_back_ios),
              ),
              Text(
                title,
                style: const TextStyle(fontSize: 20),
              ),
              const SizedBox(
                width: 20,
              ),
              Text(duration,
                  style: const TextStyle(fontSize: 15, color: Colors.grey)),
            ],
          ),
        ),
        body: Container(
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
                  var motiWidget = Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: SizedBox(
                      width: 370,
                      height: 100,
                      child: Text(
                        overflow: TextOverflow.ellipsis,
                        moti,
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 30,
                            color: Colors.lightGreen.shade600),
                      ),
                    ),
                  );
                  List<Widget> motiAndSpace = List.generate(
                      plan["habbits"].length,
                      ((index) => const SizedBox(
                            width: 380,
                            height: 120,
                          )));

                  motiAndSpace[0] = motiWidget;
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      motiAndSpace[index2],
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
                                  width: 1.0, color: Colors.grey.shade500),
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
                                      borderRadius: BorderRadius.circular(10)),
                                  child: Center(
                                    child: Text(
                                      //bla bla
                                      date,
                                      style: const TextStyle(
                                          fontSize: 17, color: Colors.white),
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
                                    bool done = data[index3]["done"];
                                    String note = data[index3]["note"];
                                    return Padding(
                                      padding: const EdgeInsets.all(10.0),
                                      child: Row(
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
                                          SpecialCheckbox(
                                            done: done,
                                            date: date,
                                            note: note,
                                            indexOfConstant: indexOfConstant,
                                            indexOfData: index2,
                                            indexOfDone: index3,
                                          )
                                        ],
                                      ),
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
      ),
    );
  }
}
