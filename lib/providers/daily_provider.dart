import 'package:habbit_tracker_flutter/data/daily_data.dart';
import 'package:habbit_tracker_flutter/providers/pvd.dart';

class DailyProvider extends PVD {
  void addNewhabbit(Map newHabbit) {
    dailyData.add(newHabbit);
    ntWDailyData();
  }

  void removeHabbit(int index) {
    dailyData.remove(dailyData[index]);
    ntWDailyData();
  }

  void onChangeDailyHabbit(int index) {
    if (dailyData[index]["done"] == true) {
      dailyData[index]["done"] = false;
    } else {
      dailyData[index]["done"] = true;
    }

    ntWDailyData();
  }
}
