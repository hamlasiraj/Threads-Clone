import 'package:flutter/material.dart';

import '../../../Core/Constant/appimage.dart';

class TopBar extends StatelessWidget {
  final void Function()? onMenuTap;
  final void Function()? onInstaTap;
  const TopBar({super.key, this.onMenuTap, this.onInstaTap});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        Row(children: const [
          Icon(Icons.language),
        ]),
        Row(
          children: [
            InkWell(
              onTap: onInstaTap,
              child: Image.asset(
                "${AppImage.imgRoot}/insta.png",
                height: 20,
                width: 20,
              ),
            ),
            const SizedBox(width: 10),
            InkWell(
              onTap: onMenuTap,
              child: Image.asset(
                "${AppImage.imgRoot}/menu.png",
                height: 20,
                width: 20,
              ),
            )
          ],
        )
      ]),
    );
  }
}
