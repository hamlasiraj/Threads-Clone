import 'package:flutter/material.dart';

class PositionedStick extends StatelessWidget {
  const PositionedStick({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 400,
        width: 2,
        decoration: BoxDecoration(
          color: Colors.grey.shade300,
          borderRadius: BorderRadius.circular(1),
        ));
  }
}
