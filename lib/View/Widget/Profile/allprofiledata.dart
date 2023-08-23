import 'package:flutter/material.dart';
import 'package:threads/View/Widget/Profile/profileData.dart';
import 'package:threads/View/Widget/Profile/topbar.dart';

import '../../../Core/Constant/appcolors.dart';
import '../custtombutton.dart';

class MyProfileDataBox extends StatefulWidget {
  const MyProfileDataBox({super.key});

  @override
  State<MyProfileDataBox> createState() => _MyProfileDataBoxState();
}

class _MyProfileDataBoxState extends State<MyProfileDataBox>
    with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    TabController _tabBarController = TabController(length: 2, vsync: this);
    return Column(
      children: [
        const ProfileData(),
        Padding(
          padding: const EdgeInsets.only(right: 10, left: 10, bottom: 14),
          child: Row(children: [
            Expanded(
                child: CusttomButton(onPressed: () {}, hint: "Edit profile")),
            const SizedBox(width: 8),
            Expanded(
                child: CusttomButton(onPressed: () {}, hint: "Share profile"))
          ]),
        ),
      ],
    );
  }
}
