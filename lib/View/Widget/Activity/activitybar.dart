import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:threads/Controller/activitycontroller.dart';
import '../../../Core/Constant/appcolors.dart';
import 'activitybarbox.dart';

class ActivityBar extends StatelessWidget {
  const ActivityBar({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(ActivityController());
    return GetBuilder<ActivityController>(
      builder: (controller) => SizedBox(
        height: 32,
        child: ListView(
            physics: const BouncingScrollPhysics(),
            scrollDirection: Axis.horizontal,
            shrinkWrap: true,
            children: [
              ActivityBarBox(
                  onTap: () {
                    controller.updateBar(0);
                  },
                  color: controller.index != 0
                      ? AppColor.background
                      : AppColor.titleText,
                  style: controller.index != 0
                      ? Theme.of(context).textTheme.headlineMedium
                      : TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: AppColor.background),
                  boxName: "All"),
              const SizedBox(width: 5),
              ActivityBarBox(
                  onTap: () {
                    controller.updateBar(1);
                  },
                  color: controller.index != 1
                      ? AppColor.background
                      : AppColor.titleText,
                  style: controller.index != 1
                      ? Theme.of(context).textTheme.headlineMedium
                      : TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: AppColor.background),
                  boxName: "Replies"),
              const SizedBox(width: 5),
              ActivityBarBox(
                  onTap: () {
                    controller.updateBar(2);
                  },
                  color: controller.index != 2
                      ? AppColor.background
                      : AppColor.titleText,
                  style: controller.index != 2
                      ? Theme.of(context).textTheme.headlineMedium
                      : TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: AppColor.background),
                  boxName: "Mentions"),
              const SizedBox(width: 5),
              ActivityBarBox(
                  onTap: () {
                    controller.updateBar(3);
                  },
                  color: controller.index != 3
                      ? AppColor.background
                      : AppColor.titleText,
                  style: controller.index != 3
                      ? Theme.of(context).textTheme.headlineMedium
                      : TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: AppColor.background),
                  boxName: "Verified"),
              const SizedBox(width: 20),
            ]),
      ),
    );
  }
}
