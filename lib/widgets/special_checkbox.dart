import 'package:flutter/material.dart';
import 'package:habbit_tracker_flutter/data/constants.dart';
import 'package:habbit_tracker_flutter/data/write_data.dart';
import 'package:intl/intl.dart';

// ignore: must_be_immutable
class SpecialCheckbox extends StatefulWidget {
  bool done;
  final String date;
  final int indexOfConstant;
  final int indexOfData;
  final int indexOfDone;
  String note;
  SpecialCheckbox({
    super.key,
    required this.done,
    required this.date,
    required this.indexOfConstant,
    required this.indexOfData,
    required this.indexOfDone,
    required this.note,
  });

  @override
  State<SpecialCheckbox> createState() => _SpecialCheckboxState();
}

class _SpecialCheckboxState extends State<SpecialCheckbox> {
  void showMySnackbar(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Just care about today!'),
        duration: Duration(milliseconds: 1000),
      ),
    );
  }

  String todayDate() {
    DateTime date = DateTime.now();
    DateFormat formatter = DateFormat('d MMM');
    String formattedDate = formatter.format(date);
    return formattedDate;
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () async {
          String today = todayDate();
          if (widget.date == today) {
            setState(() {
              widget.done = !widget.done;
            });
            constants[widget.indexOfConstant]["habbits"][widget.indexOfData]
                ["data"][widget.indexOfDone]["done"] = widget.done;
            writeData(constants);
          } else {
            showMySnackbar(context);
          }
        },
        onLongPress: () {
          final noteController = TextEditingController();
          showDialog(
              context: context,
              builder: (context) {
                return AlertDialog(
                  title: const Text("add a short note"),
                  content: SizedBox(
                    height: 100,
                    child: Column(
                      children: [
                        Text(widget.note),
                        const SizedBox(
                          height: 10,
                        ),
                        SizedBox(
                          height: 50,
                          child: TextField(
                            controller: noteController,
                            decoration: InputDecoration(
                              hintText: 'Enter new note',
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  actions: [
                    TextButton(
                        onPressed: () {
                          setState(() {
                            widget.note = noteController.text;
                            constants[widget.indexOfConstant]["habbits"]
                                        [widget.indexOfData]["data"]
                                    [widget.indexOfDone]["note"] =
                                noteController.text;
                          });

                          writeData(constants);
                          Navigator.pop(context);
                        },
                        child: const Text("Okay")),
                    TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: const Text(
                        "Cancel",
                        style: TextStyle(color: Colors.red),
                      ),
                    ),
                  ],
                );
              });
        },
        child: Container(
          width: 35,
          height: 35,
          decoration: BoxDecoration(
            color: widget.done == true ? Colors.green : Colors.red,
            borderRadius: BorderRadius.circular(30),
          ),
          child: Icon(
              color: Colors.white,
              size: 25,
              widget.done == true ? Icons.check : Icons.clear),
        ));
  }
}
