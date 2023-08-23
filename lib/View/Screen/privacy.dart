import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:threads/Controller/privacycontroller.dart';
import 'package:threads/Core/Constant/appcolors.dart';
import 'package:threads/Core/Constant/appimage.dart';
import 'package:threads/View/Widget/privacylisttile.dart';

class Privacy extends StatelessWidget {
  const Privacy({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(PrivacyController());
    return GetBuilder<PrivacyController>(
      builder: (controller) => Scaffold(
          appBar: AppBar(
            elevation: 0.5,
            centerTitle: true,
            title: const Text("Privacy"),
            titleTextStyle: Theme.of(context).textTheme.titleSmall,
            automaticallyImplyLeading: false,
            leadingWidth: 70,
            leading: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 5),
              child: InkWell(
                onTap: () {
                  controller.backPage();
                },
                child: Row(
                  children: [
                    Icon(
                      Icons.arrow_back_ios,
                      color: AppColor.titleText,
                      size: 18,
                    ),
                    Text("Back",
                        style: Theme.of(context).textTheme.headlineSmall),
                  ],
                ),
              ),
            ),
          ),
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Icon(
                        Icons.lock_outline,
                        color: AppColor.titleText,
                      ),
                      const SizedBox(width: 10),
                      Text(
                        "Private profile",
                        style: Theme.of(context).textTheme.headlineMedium,
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Switch(
                        activeColor: AppColor.titleText,
                        value: controller.isActive,
                        onChanged: (newState) {
                          controller.changeSwitch(newState);
                        },
                      )
                    ],
                  )
                ],
              ),
              const SizedBox(height: 5),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Image.asset("${AppImage.imgRoot}/mention.png",
                          height: 24, width: 24),
                      const SizedBox(width: 10),
                      Text(
                        "Mentions",
                        style: Theme.of(context).textTheme.headlineMedium,
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Text(
                        "Everyone",
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                      const SizedBox(width: 5),
                      Icon(
                        Icons.arrow_forward_ios_outlined,
                        color: AppColor.smallText,
                        size: 15,
                      )
                    ],
                  )
                ],
              ),
              const SizedBox(height: 8),
              const CustomListTile(
                  icon1: Icons.notification_important_outlined,
                  name: "Muted",
                  icon2: Icons.arrow_forward_ios_rounded,
                  size2: 15),
              const SizedBox(height: 5),
              const CustomListTile(
                  icon1: Icons.remove_red_eye_outlined,
                  name: "Hidden words",
                  icon2: Icons.arrow_forward_ios_rounded,
                  size2: 15),
              const SizedBox(height: 5),
              const CustomListTile(
                  icon1: Icons.people_outline,
                  name: "Profile you follow",
                  icon2: Icons.arrow_forward_ios_rounded,
                  size2: 15),
              const Divider(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Other privacy settings",
                    style: Theme.of(context).textTheme.headlineMedium,
                  ),
                  Icon(
                    Icons.open_in_new,
                    color: AppColor.smallText,
                    size: 18,
                  )
                ],
              ),
              const SizedBox(height: 5),
              Text(
                "Some settings, such as restrict, apply to both Threads and Instagram and can managed on Instagram.",
                style: Theme.of(context).textTheme.bodyMedium,
              ),
              const SizedBox(height: 5),
              const CustomListTile(
                icon1: Icons.block,
                name: "Blocked profiles",
                icon2: Icons.open_in_new,
                size2: 18,
              ),
              const SizedBox(height: 5),
              const CustomListTile(
                icon1: Icons.heart_broken_outlined,
                name: "Hide likes",
                icon2: Icons.open_in_new,
                size2: 18,
              )
            ]),
          )),
    );
  }
}
