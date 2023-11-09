import 'package:cric_score/model/match_api_response.dart';
import 'package:cric_score/service/match_api_service.dart';
import 'package:flutter/foundation.dart';

class MatchProvider extends ChangeNotifier{
 MatchApiResponse?  matchApiResponse;

 bool isLoading = true;

 Future fetchMatch()async{
  isLoading = true;
  notifyListeners();
  matchApiResponse = await MatchApiService.getMatchInformation();
  if (kDebugMode) {
    print(matchApiResponse);
    notifyListeners();
    isLoading = false;
  }
  notifyListeners();
 }
}