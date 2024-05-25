import 'package:flutter/material.dart';
import 'package:habbit_tracker_flutter/data/constants.dart';
import 'package:habbit_tracker_flutter/data/daily_data.dart';
import 'package:habbit_tracker_flutter/data/write_data.dart';

class PVD extends ChangeNotifier {
  void ntWData() {
    notifyListeners();
    writeData(constants);
  }

  void ntWDailyData() {
    notifyListeners();
    writeDailyData(dailyData);
  }
}
