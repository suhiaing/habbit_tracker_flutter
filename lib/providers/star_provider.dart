import 'package:flutter/material.dart';
import 'package:habbit_tracker_flutter/providers/pvd.dart';
import 'package:habbit_tracker_flutter/stars.dart';

class StarPVD extends PVD {
  void createNewPlan() {
    stars -= 20;
    ntWStars();
  }

  void deletePlan() {
    stars -= 50;
    ntWStars();
  }

  void getHundredPercentageBonus() {
    stars += 10;
    ntWStars();
  }

  void increaseOnePercentage() {
    stars += 1;
    ntWStars();
  }
}
