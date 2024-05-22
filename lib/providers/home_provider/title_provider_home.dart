import 'package:habbit_tracker_flutter/data/constants.dart';
import 'package:habbit_tracker_flutter/providers/pvd.dart';

class TitleHomePVD extends PVD {
  void rename(String newName, int index) {
    constants[index]["title"] = newName;
    ntWData();
  }
}
