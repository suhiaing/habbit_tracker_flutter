import 'package:habbit_tracker_flutter/data/constants.dart';
import 'package:habbit_tracker_flutter/providers/pvd.dart';

class PCTpvd extends PVD {
  double calculateSuccessRate(int index) {
    List dateCount = constants[index]["habbits"];

    int successRateRaw = 0;
    int count = 0;
    for (int i = 0; i < dateCount.length; i++) {
      for (int j = 0; j < dateCount[i]["data"].length; j++) {
        count += 1;

        if (dateCount[i]["data"][j]["done"] == true) {
          successRateRaw += 1;
        }
      }
    }

    double successRate = (successRateRaw / count) * 100;
    constants[index]["successRate"] = successRate;

    return successRate;
  }
}
