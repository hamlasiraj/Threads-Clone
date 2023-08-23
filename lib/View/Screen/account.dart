import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get.dart';
import 'package:threads/Core/Constant/appcolors.dart';
import 'package:threads/Core/Constant/appimage.dart';
import 'package:threads/View/Widget/Profile/topbar.dart';
import 'package:threads/View/Widget/custtombutton.dart';
import 'package:threads/View/Widget/Profile/allprofiledata.dart';
import 'package:threads/View/Widget/Profile/mythreadbox.dart';
import '../../Controller/accountcontroller.dart';
import '../../Data/Model/thread.dart';

class MyAccount extends StatefulWidget {
  const MyAccount({super.key});

  @override
  State<MyAccount> createState() => _MyAccountState();
}

class _MyAccountState extends State<MyAccount> with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    TabController _tabBarController = TabController(length: 2, vsync: this);
    double w = MediaQuery.of(context).size.width;
    Get.put(AccountController());
    return SafeArea(
      child: GetBuilder<AccountController>(
        builder: (controller) => Scaffold(
            body: ListView(
          shrinkWrap: true,
          children: [
            TopBar(
              onMenuTap: () {
                controller.toMenu();
              },
              onInstaTap: () {
                controller.toInsta();
              },
            ),
            const MyProfileDataBox(),
            Padding(
                padding: const EdgeInsets.only(bottom: 7),
                child: TabBar(
                    labelColor: AppColor.titleText,
                    unselectedLabelColor: AppColor.smallText,
                    indicatorColor: AppColor.titleText,
                    indicatorWeight: 1,
                    labelPadding: const EdgeInsets.only(bottom: 5),
                    labelStyle: Theme.of(context).textTheme.headlineMedium,
                    controller: _tabBarController,
                    tabs: const [Text("Threads"), Text("Replies")])),
            SizedBox(
              width: double.maxFinite,
              height: double.maxFinite,
              child: TabBarView(
                  controller: _tabBarController,
                  children: [MyThreadBox(), Text("bay")]),
            ),
          ],
        )),
      ),
    );
  }
}
