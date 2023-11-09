import 'dart:convert';
import 'package:cric_score/shared/api_endpoints.dart';
import 'package:cric_score/shared/strings_const.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:cric_score/model/match_api_response.dart';

class MatchApiService {
  static Future<MatchApiResponse> getMatchInformation() async {
    http.Response response = await http.get(
      Uri.parse(ApiEndPoint.baseUrl()),
    );
    if (response.statusCode == 200) {
      if (kDebugMode) {
        print(response.body);
      }

      final result = jsonDecode(response.body);
return MatchApiResponse.fromJson(result);

    } else {
      throw StringConst.apiErrorMsg;
    }
  }
}






