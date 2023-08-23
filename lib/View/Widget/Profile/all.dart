import 'package:flutter/material.dart';

class All extends StatelessWidget {
  const All({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
        child: ListView(shrinkWrap: true, children: [
      Center(
          child: Text(
        "Nothing to see here yet.",
        style: Theme.of(context).textTheme.bodyLarge,
      ))
    ]));
  }
}
