import 'package:flutter/material.dart';
import 'package:habbit_tracker_flutter/providers/star_provider.dart';

class Stars extends StatefulWidget {
  const Stars({super.key, required this.starPVD});
  final StarPVD starPVD;
  @override
  State<Stars> createState() => _StarsState();
}

class _StarsState extends State<Stars> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 130,
      height: 50,
      decoration: BoxDecoration(
          // border: Border.all(color: Colors.black26, width: 0.9),
          borderRadius: BorderRadius.circular(20),
          color: Colors.blueGrey[50],
          boxShadow: const [
            BoxShadow(
              color: Colors.grey,
              offset: Offset(2, 2),
              blurRadius: 10,
              spreadRadius: 3,
            ),
            BoxShadow(
              color: Colors.white60,
              offset: Offset(-2, -2),
              blurRadius: 10,
              spreadRadius: 3,
            )
          ]),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "${widget.starPVD.starpvd}",
            style: const TextStyle(
              fontSize: 18,
              color: Colors.black54,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(
            width: 10,
          ),
          Icon(
            Icons.star,
            size: 35,
            color: Colors.yellow[800],
          )
        ],
      ),
    );
  }
}
