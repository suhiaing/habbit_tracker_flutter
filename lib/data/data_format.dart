import 'package:intl/intl.dart';

class DATAFORMAT {
  final String habbitname;
  final List dateData = [];

  DATAFORMAT({required this.habbitname});

  void dateGiver() {
    Map individualdateData = {};
    for (int i = 0; i < 7; i++) {
      DateTime date = DateTime.now().add(Duration(days: i));
      DateFormat formatter = DateFormat('d MMM');
      String formattedDate = formatter.format(date);
      individualdateData = {"date": formattedDate, "done": false};

      dateData.add(individualdateData);
    }
  }

  Map dataFormat() {
    dateGiver();
    return {"habbitName": habbitname, "data": dateData};
  }
}

  //constants.add(DATAFORMAT(habbitname: "Hello").dataFormat());

