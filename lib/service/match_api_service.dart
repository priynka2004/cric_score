import 'dart:convert';
import 'package:cric_score/shared/api_endpoints.dart';
import 'package:cric_score/shared/strings_const.dart';
import 'package:http/http.dart' as http;
import 'package:cric_score/model/match_api_response.dart';

class MatchApiService {
  //static List<CurrentMatches> userInformationList = [];
  static Future<MatchApiResponse> getMatchInformation() async {
    http.Response response = await http.get(
      Uri.parse(ApiEndPoint.baseUrl()),
    );
    if (response.statusCode == 200) {
      print(response.body);

      final result = jsonDecode(response.body);

      // CurrentMatches currentMatches = CurrentMatches.fromJson(result);
      //
      // userInformationList.add(currentMatches);
      //
      // print(userInformationList.length);
return MatchApiResponse.fromJson(result);

     // return userInformationList;
    } else {
      throw StringConst.apiErrorMsg;
    }
  }
}






