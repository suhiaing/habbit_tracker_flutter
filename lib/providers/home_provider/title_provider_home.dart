import 'package:habbit_tracker_flutter/constants.dart';
import 'package:habbit_tracker_flutter/providers/pvd.dart';

class HomePVD extends PVD {
  void rename(String newName, int index) {
    constants[index]["title"] = newName;
    ntWData();
  }

  void deletePlan(Map plan) {
    constants.remove(plan);
    ntWData();
  }
}
