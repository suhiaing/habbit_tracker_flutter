import 'package:flutter/material.dart';
import 'package:habbit_tracker_flutter/data/constants.dart';
import 'package:habbit_tracker_flutter/providers/pvd.dart';
import 'package:intl/intl.dart';

class SpecialCheckBoxPVD extends PVD {
  bool getDoneSCB(
      {required int indexOfConstant,
      required int indexOfData,
      required int indexOfDone}) {
    return constants[indexOfConstant]["habbits"][indexOfData]["data"]
        [indexOfDone]["done"];
  }

  String todayDate() {
    DateTime date = DateTime.now();
    DateFormat formatter = DateFormat('d MMM');
    String formattedDate = formatter.format(date);
    return formattedDate;
  }

  void onChangedSCPtemp(
      String currentDate, int indexOfConstants, int indexOfData) {
    String today = todayDate();
    if (today == currentDate) {
      constants[indexOfConstants]["data"][indexOfData]["done"] !=
          constants[indexOfConstants]["data"][indexOfData]["done"];
      ntWData();
    }
  }

  void onChangedSCP(
      {required String currentDate,
      required int indexOfConstants,
      required int indexOfData,
      required int indexOfDone,
      required BuildContext context}) {
    String today = todayDate();
    if (today == currentDate) {
      print(constants[indexOfConstants]["habbits"]);
      print("hi");
      constants[indexOfConstants]["habbits"][indexOfData]["data"][indexOfDone]
              ["done"] !=
          constants[indexOfConstants]["habbits"][indexOfData]["data"]
              [indexOfDone]["done"];
      print(constants[indexOfConstants]["habbits"][indexOfData]["data"]
          [indexOfDone]["done"]);
      ntWData();
    } else {
      showSnackbar(context);
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
