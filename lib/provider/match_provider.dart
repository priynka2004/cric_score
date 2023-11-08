import 'package:cric_score/model/match_api_response.dart';
import 'package:cric_score/service/match_api_service.dart';
import 'package:flutter/foundation.dart';

class MatchProvider extends ChangeNotifier{
 MatchApiResponse?  matchInfoList;

 Future fetchMatch()async{
  matchInfoList = await MatchApiService.getMatchInformation();
  if (kDebugMode) {
    print(matchInfoList);
  }
  notifyListeners();
 }
}