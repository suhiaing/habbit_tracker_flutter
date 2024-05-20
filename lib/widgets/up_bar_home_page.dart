import 'package:flutter/material.dart';
import 'package:habbit_tracker_flutter/widgets/stars_widget.dart';

class UpBarHomePage extends StatelessWidget {
  const UpBarHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Text(
          textAlign: TextAlign.right,
          "  Your Consistency, Your habbe",
          style: TextStyle(
            fontSize: 38,
            fontWeight: FontWeight.bold,
          ),
        ),
        Expanded(child: SizedBox()),
        Stars(),
        SizedBox(
          width: 20,
        ),
      ],
    );
  }
}
