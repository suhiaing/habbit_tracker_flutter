// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:habbit_tracker_flutter/providers/special_checkbox_provider.dart';
import 'package:provider/provider.dart';

class SpecialCheckbox extends StatelessWidget {
  bool done;
  String date;
  final int indexOfConstants;
  final int indexOfData;
  SpecialCheckbox(
      {super.key,
      required this.done,
      required this.date,
      required this.indexOfConstants,
      required this.indexOfData});

  @override
  Widget build(BuildContext context) {
    return Consumer<SpecialCheckBoxPVD>(
        builder: (context, specialCheckBoxPVD, _) {
      return GestureDetector(
        onTap: () {
          specialCheckBoxPVD.onChangedSCP(
              date, indexOfConstants, indexOfData, context);
        },
        child: SizedBox(
          width: 40,
          height: 40,
          child: done == true
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
