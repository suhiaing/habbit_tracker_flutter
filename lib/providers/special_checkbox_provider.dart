import 'package:flutter/material.dart';
import 'package:habbit_tracker_flutter/constants.dart';
import 'package:habbit_tracker_flutter/providers/main_provider.dart';
import 'package:intl/intl.dart';

class SpecialCheckBoxPVD extends MainPVDS {
  List scbConstants = constants;

  String todayDate() {
    DateTime date = DateTime.now();
    DateFormat formatter = DateFormat('d MMM');
    String formattedDate = formatter.format(date);
    return formattedDate;
  }

  void onChangedSCP(String currentDate, int indexOfConstants, int indexOfData) {
    String today = todayDate();
    if (today == currentDate) {
      constants[indexOfConstants]["data"][indexOfData]["done"] =
          !constants[indexOfConstants]["data"][indexOfData]["done"];
      nl();
      refreshData(constants);
    }
  }

  void showSnackbar(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Just care about today!'),
        duration: Duration(milliseconds: 1000),
      ),
    );
  }
}
