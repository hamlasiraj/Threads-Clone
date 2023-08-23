import 'package:get/get.dart';
import '../View/Screen/account.dart';
import '../View/Screen/activity.dart';
import '../View/Screen/feed.dart';
import '../View/Screen/search.dart';

class NaviController extends GetxController {
  int index = 0;
  List page = [
    Feed(),
    Search(),
    Activity(),
    MyAccount(),
  ];
  updateNavi(int newIndex) {
    index = newIndex;
    update();
  }
}
