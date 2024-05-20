// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:habbit_tracker_flutter/providers/special_checkbox_provider.dart';
import 'package:provider/provider.dart';

class SpecialCheckbox extends StatefulWidget {
  bool done;
  String date;
  int indexOfConstant;
  int indexOfData;
  SpecialCheckbox(
      {required this.done,
      required this.date,
      required this.indexOfConstant,
      required this.indexOfData,
      super.key});

  @override
  State<SpecialCheckbox> createState() => _SpecialCheckboxState();
}

class _SpecialCheckboxState extends State<SpecialCheckbox> {
  @override
  Widget build(BuildContext context) {
    return Consumer<SpecialCheckBoxPVD>(
        builder: (context, specialCheckBoxPVD, _) {
      return GestureDetector(
        onTap: () {
          setState(() {
            String today = specialCheckBoxPVD.todayDate();
            if (today == widget.date) {
              widget.done = !widget.done;
            } else {
              specialCheckBoxPVD.showSnackbar(context);
            }
          });
          specialCheckBoxPVD.onChangedSCP(
              widget.date, widget.indexOfConstant, widget.indexOfData);
        },
        child: SizedBox(
          width: 40,
          height: 40,
          child: widget.done == true
              ? const Icon(
                  Icons.check,
                  color: Colors.green,
                  size: 40,
                )
              : const Icon(Icons.clear, color: Colors.red, size: 40),
        ),
      );
    });
  }
}
