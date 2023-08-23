import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../Controller/activitycontroller.dart';
import '../Widget/Activity/activitybar.dart';

class Activity extends StatelessWidget {
  const Activity({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(ActivityController());
    return GetBuilder<ActivityController>(
      builder: (controller) => SafeArea(
        child: Scaffold(
          body: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Padding(
              padding: const EdgeInsets.all(10),
              child: Text(
                "Activity",
                style: Theme.of(context).textTheme.headlineLarge,
              ),
            ),
            const ActivityBar(),
            Expanded(child: controller.barPage[controller.index])
          ]),
        ),
      ),
    );
  }
}
