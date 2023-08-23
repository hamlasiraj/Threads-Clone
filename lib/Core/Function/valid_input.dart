import 'package:get/get.dart';

validInput(String val, int min, int max, String type) {
  if (type == "username") {
    if (!GetUtils.isUsername(val)) {
      return "21".tr;
    }
  }

  if (type == "email") {
    if (!GetUtils.isEmail(val)) {
      return "22".tr;
    }
  }
  if (val.length < min) {
    return "23".tr + " $min";
  }
  if (val.length > max) {
    return "24".tr + " $min";
  }
  if (val.isEmpty) {
    return "can't be empty";
  }
}
