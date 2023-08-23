import 'package:flutter/material.dart';

import '../../Core/Constant/appcolors.dart';

class CustomListTile extends StatelessWidget {
  final IconData? icon1;
  final String name;
  final IconData? icon2;
  final double? size2;
  const CustomListTile(
      {super.key, this.icon1, required this.name, this.icon2, this.size2});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Icon(
                icon1,
                color: AppColor.titleText,
              ),
              const SizedBox(width: 10),
              Text(
                name,
                style: Theme.of(context).textTheme.headlineMedium,
              ),
            ],
          ),
          Row(
            children: [
              Icon(
                icon2,
                color: AppColor.smallText,
                size: size2,
              )
            ],
          )
        ],
      ),
    );
  }
}
