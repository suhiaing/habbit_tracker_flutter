import 'package:flutter/material.dart';
import 'package:habbit_tracker_flutter/data/constants.dart';
import 'package:habbit_tracker_flutter/data/write_data.dart';

class PVD extends ChangeNotifier {
  void ntWData() {
    notifyListeners();
    writeData(constants);
  }

  void ntWStars(int stars) {
    notifyListeners();
    wirteStar(stars);
  }
}
