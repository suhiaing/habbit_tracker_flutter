import 'package:flutter/material.dart';
import 'package:habbit_tracker_flutter/constants.dart';
import 'package:habbit_tracker_flutter/data/write_data.dart';
import 'package:habbit_tracker_flutter/stars.dart';

class PVD extends ChangeNotifier {
  void ntWData() {
    notifyListeners();
    writeData(constants);
  }

  void ntWStars() {
    notifyListeners();
    wirteStar(stars);
  }
}
