import 'package:get/get.dart';

class PrivacyController extends GetxController {
  bool isActive = false;

  backPage() {
    Get.back();
  }

  changeSwitch(newState) {
    isActive = newState;
    update();
  }
}
