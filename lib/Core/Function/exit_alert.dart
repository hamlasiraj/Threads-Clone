import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

Future<bool> exitAlert() {
  Get.defaultDialog(
      title: "Alert",
      middleText: "Do you want to exit the app?",
      actions: [
        ElevatedButton(
            onPressed: () {
              exit(0);
            },
            child: Text("Yes")),
        ElevatedButton(
            onPressed: () {
              Get.back();
            },
            child: Text("No"))
      ]);
  return Future.value(false);
}
