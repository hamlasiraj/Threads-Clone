import 'package:flutter/material.dart';
import '../../../Core/Constant/appcolors.dart';

class ActivityBarBox extends StatelessWidget {
  final String boxName;
  final void Function() onTap;
  final TextStyle? style;
  final Color? color;
  const ActivityBarBox(
      {super.key,
      required this.boxName,
      required this.onTap,
      required this.style,
      this.color});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(0),
        width: 100,
        decoration: BoxDecoration(
            color: color,
            border: Border.all(color: AppColor.smallText),
            borderRadius: BorderRadius.circular(05)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              boxName,
              style: style,
            ),
          ],
        ),
      ),
    );
  }
}
