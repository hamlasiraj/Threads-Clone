import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:threads/Controller/accountcontroller.dart';
import 'package:threads/Controller/navigatorbarcontroller.dart';
import 'package:threads/Controller/writecontroller.dart';
import 'package:threads/Core/Constant/appimage.dart';
import 'package:threads/View/Widget/naviIcon.dart';

class Navi extends StatelessWidget {
  const Navi({super.key});

  @override
  Widget build(BuildContext context) {
    AccountController accountCtr = Get.put(AccountController());
    WriteController writeCtr = Get.put(WriteController());
    Get.put(NaviController());
    return GetBuilder<NaviController>(
      builder: (controller) => Scaffold(
        bottomNavigationBar: BottomAppBar(
          color: Colors.grey.shade100,
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 12),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                NaviIcon(
                  onTap: () {
                    controller.updateNavi(0);
                  },
                  icon: controller.index == 0
                      ? AppImage.feedtrue
                      : AppImage.feedfalse,
                ),
                NaviIcon(
                  onTap: () {
                    controller.updateNavi(1);
                  },
                  icon: controller.index == 1
                      ? AppImage.exploretrue
                      : AppImage.explorefalse,
                ),
                NaviIcon(
                  onTap: () {
                    writeCtr.newThred(context);
                  },
                  icon: AppImage.writefalse,
                ),
                NaviIcon(
                  onTap: () {
                    controller.updateNavi(2);
                  },
                  icon: controller.index == 2
                      ? AppImage.hearttrue
                      : AppImage.heartfalse,
                ),
                NaviIcon(
                  onTap: () {
                    controller.updateNavi(3);
                    accountCtr.getProfilePosts();
                  },
                  icon: controller.index == 3
                      ? AppImage.accounttrue
                      : AppImage.accountfalse,
                ),
              ],
            ),
          ),
        ),
        body: controller.page[controller.index],
      ),
    );
  }
}
