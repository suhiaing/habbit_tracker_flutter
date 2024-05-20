import 'package:habbit_tracker_flutter/constants.dart';
import 'package:habbit_tracker_flutter/providers/pvd.dart';

class TitleHomePVD extends PVD {
  void rename(String newName, int index) {
    constants[index]["title"] = newName;
    ntWData();
  }
}
