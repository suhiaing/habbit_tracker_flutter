import 'package:flutter/material.dart';
import 'package:habbit_tracker_flutter/constants.dart';
import 'package:habbit_tracker_flutter/data/write_data.dart';

class TitleHomePVD extends ChangeNotifier {
  void rename(String newName, int index) {
    constants[index]["title"] = newName;
    notifyListeners();
    writeData(constants);
  }
}
