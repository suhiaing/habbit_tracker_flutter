import 'package:flutter/material.dart';

class UpBarHomePage extends StatelessWidget {
  const UpBarHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Text(
      textAlign: TextAlign.right,
      "  Your Consistency, Your habbe",
      style: TextStyle(
        fontSize: 40,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}
