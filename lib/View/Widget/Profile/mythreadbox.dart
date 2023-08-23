import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:threads/Controller/accountcontroller.dart';

import '../../../Core/Constant/appimage.dart';

class MyThreadBox extends GetView<AccountController> {
  const MyThreadBox({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      child: Column(children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 30,
              width: 30,
              child: CircleAvatar(
                backgroundImage: AssetImage("${AppImage.imgRoot}/p3.jpg"),
              ),
            ),
            const SizedBox(width: 10),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 2),
                  child: Text(
                    "sirox.dev",
                    style: Theme.of(context).textTheme.headlineMedium,
                  ),
                ),
                const SizedBox(width: 05),
                Padding(
                  padding: const EdgeInsets.only(bottom: 5),
                  child: Text(
                    "first Thread",
                    style: Theme.of(context).textTheme.headlineSmall,
                  ),
                ),
                Container(
                  height: 280,
                  width: 280,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.amber,
                      image: const DecorationImage(
                        image: AssetImage('${AppImage.imgRoot}/p3.jpg'),
                        fit: BoxFit.cover,
                      )),
                ),
              ],
            )
          ],
        )
      ]),
    );
  }
}
