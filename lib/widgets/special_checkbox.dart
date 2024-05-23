import 'package:flutter/material.dart';
import 'package:habbit_tracker_flutter/providers/special_checkbox_provider.dart';

class SpecialCheckbox extends StatelessWidget {
  final bool done;
  final String date;
  final int indexOfConstant;
  final int indexOfData;
  final int indexOfDone;
  final SpecialCheckBoxPVD specialCheckBoxPVD;
  const SpecialCheckbox(
      {super.key,
      required this.done,
      required this.date,
      required this.indexOfConstant,
      required this.indexOfData,
      required this.indexOfDone,
      required this.specialCheckBoxPVD});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        specialCheckBoxPVD.onChangedSCP(
            context: context,
            currentDate: date,
            indexOfConstants: indexOfConstant,
            indexOfData: indexOfData,
            indexOfDone: indexOfDone);
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
  }
}
