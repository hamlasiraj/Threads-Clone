import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../View/Widget/Profile/all.dart';

class ActivityController extends GetxController {
  int index = 0;
  List<Widget> barPage = const [All(), All(), All(), All()];
  updateBar(int newIndex) {
    index = newIndex;
    update();
  }
}
