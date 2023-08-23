import 'package:flutter/cupertino.dart';

class NaviIcon extends StatelessWidget {
  final String icon;
  final void Function()? onTap;
  const NaviIcon({super.key, required this.icon, this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: onTap,
        child: Image.asset(
          icon,
          height: 25,
          width: 25,
          fit: BoxFit.contain,
        ));
  }
}
