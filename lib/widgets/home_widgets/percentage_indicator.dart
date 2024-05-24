import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

// ignore: must_be_immutable
class PercentageIndicator extends StatelessWidget {
  PercentageIndicator({
    super.key,
    required this.index,
  });
  int index;

  get constants => null;

  @override
  Widget build(BuildContext context) {
    Color successRateColor(double successRate) {
      if (successRate >= 70) {
        return Colors.green;
      } else if (successRate >= 40) {
        return Colors.orange.shade700;
      } else if (successRate >= 0) {
        return Colors.red.shade700;
      }

      return Colors.black;
    }

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

    return CircularPercentIndicator(
      radius: 85,
      lineWidth: 15,
      percent: (calculateSuccessRate(index) / 100),
      progressColor: successRateColor(calculateSuccessRate(index)),
      backgroundColor:
          successRateColor(calculateSuccessRate(index)).withOpacity(0.25),
      center: Text(
        "${calculateSuccessRate(index).toStringAsFixed(1)}%",
        style: const TextStyle(fontSize: 20),
      ),
      circularStrokeCap: CircularStrokeCap.round,
    );
  }
}
