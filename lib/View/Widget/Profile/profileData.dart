import 'package:flutter/material.dart';
import '../../../Core/Constant/appimage.dart';

class ProfileData extends StatelessWidget {
  const ProfileData({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "sirox.dev",
                style: Theme.of(context).textTheme.headlineLarge,
              ),
              const SizedBox(
                height: 50,
                width: 50,
                child: CircleAvatar(
                  backgroundImage: AssetImage("${AppImage.imgRoot}/p3.jpg"),
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Sirox",
                style: Theme.of(context).textTheme.headlineSmall,
              ),
              const SizedBox(height: 15),
              Text(
                "Software Developer\nAndoid & iOS Developer",
                style: Theme.of(context).textTheme.headlineSmall,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 15),
                child: Row(children: [
                  const SizedBox(
                    height: 16,
                    width: 16,
                    child: CircleAvatar(
                      backgroundImage: AssetImage("${AppImage.imgRoot}/p2.png"),
                    ),
                  ),
                  const SizedBox(width: 7),
                  Text(
                    "1 follower ",
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                ]),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
