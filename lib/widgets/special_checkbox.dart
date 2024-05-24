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
  SpecialCheckbox({
    super.key,
    required this.done,
    required this.date,
    required this.indexOfConstant,
    required this.indexOfData,
    required this.indexOfDone,
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
      child: SizedBox(
        width: 40,
        height: 40,
        child: widget.done == true
            ? const Icon(
                Icons.check,
                color: Colors.green,
                size: 35,
              )
            : const Icon(Icons.clear, color: Colors.red, size: 35),
      ),
    );
  }
}
