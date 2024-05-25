import 'package:habbit_tracker_flutter/data/constants.dart';
import 'package:habbit_tracker_flutter/providers/pvd.dart';

class HomePVD extends PVD {
  void removePlan(int index) {
    Map planTORemove = constants[index];
    constants.remove(planTORemove);
    ntWData();
  }

  void addPlan(Map planToAdd) {
    constants.add(planToAdd);
  }
}
