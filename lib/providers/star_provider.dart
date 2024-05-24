import 'package:habbit_tracker_flutter/providers/pvd.dart';
import 'package:habbit_tracker_flutter/data/stars.dart';

class StarPVD extends PVD {
  int starpvd = stars;
  void createNewPlan() {
    starpvd -= 20;

    ntWStars(starpvd);
  }

  void deletePlan() {
    starpvd -= 50;
    ntWStars(starpvd);
  }

  void getHundredPercentage() {
    starpvd += 100;
    ntWStars(starpvd);
  }
}
