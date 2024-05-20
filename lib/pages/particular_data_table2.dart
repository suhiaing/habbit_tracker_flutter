import 'package:flutter/material.dart';
import 'package:habbit_tracker_flutter/constants.dart';
import 'package:habbit_tracker_flutter/widgets/special_checkbox.dart';

class ParticularDataTable extends StatelessWidget {
  const ParticularDataTable({
    super.key,
    required this.habbitCount,
    required this.firstDate,
  });

  final int habbitCount;
  final List firstDate;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      // Make the table scrollable vertically
      child: Flex(
        // Distribute space equally among columns
        direction: Axis.horizontal,
        children: [
          Expanded(
            child: DataTable(
              headingRowHeight: 90,
              dataRowMaxHeight: 70,
              columns: List.generate(
                habbitCount,
                (index) {
                  int currentIndexMinusOne = index - 1;
                  String currentDate = '';
                  if (index == 0) {
                    currentDate = "Habbits";
                  } else {
                    currentDate = firstDate[currentIndexMinusOne]["date"];
                  }

                  return DataColumn(
                    label: Expanded(
                      child: Text(
                        currentDate,
                        style:
                            const TextStyle(fontSize: 22.0), // Adjust font size
                      ),
                    ),
                  );
                },
              ),
              rows: List.generate(constants.length, (index) {
                Map<String, dynamic> currentData = constants[index];
                String habbitName = currentData["habbitName"];

                return DataRow(
                  cells: <DataCell>[
                    DataCell(Text(
                      habbitName,
                      style:
                          const TextStyle(fontSize: 20.0), // Adjust font size
                    )),
                    for (int i = 0; i < currentData["data"].length; i++)
                      DataCell(SpecialCheckbox(
                        done: currentData["data"][i]["done"],
                        date: currentData["data"][i]["date"],
                        indexOfConstant: index,
                        indexOfData: i,
                      )),
                  ],
                );
              }),
            ),
          ),
        ],
      ),
    );
  }
}
