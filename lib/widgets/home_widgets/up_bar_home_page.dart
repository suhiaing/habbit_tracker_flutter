import 'package:flutter/material.dart';
import 'package:habbit_tracker_flutter/providers/star_provider.dart';
import 'package:habbit_tracker_flutter/widgets/home_widgets/stars_widget.dart';

class UpBarHomePage extends StatelessWidget {
  const UpBarHomePage({super.key, required this.starPVD});
  final StarPVD starPVD;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        const Text(
          textAlign: TextAlign.right,
          "  Your Consistency, Your habbe",
          style: TextStyle(
            fontSize: 35,
            fontWeight: FontWeight.bold,
          ),
        ),
        const Expanded(child: SizedBox()),
        Stars(
          starPVD: starPVD,
        ),
        const SizedBox(
          width: 20,
        ),
      ],
    );
  }
}
