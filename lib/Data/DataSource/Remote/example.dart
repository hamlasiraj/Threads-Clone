import 'package:threads/data/model/Thread.dart';
import '../../senddata/postsexample.dart';

class ThreadRemoteDatasource {
  List<Thread> getThread() {
    return listTheard()
        .map((jsonObject) => Thread.formJson(jsonObject))
        .toList();
  }
}
