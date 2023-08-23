import 'package:threads/Data/Model/suggestedaccount.dart';
import 'package:threads/Data/senddata/suggestaccex.dart';

class SuggestedAccountRemoteDatasource {
  List<SuggestedAccount> getSuggestedAccount() {
    return listSuggestedAcc()
        .map((jsonObject) => SuggestedAccount.formJson(jsonObject))
        .toList();
  }
}
