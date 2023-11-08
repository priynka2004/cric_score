import 'package:cric_score/model/information_model.dart';
import 'package:cric_score/model/match_api_response.dart';
import 'package:cric_score/model/match_info_model.dart';
import 'package:cric_score/ui/match_detail_screen.dart';



MatchApiResponse? currentMatches;
MatchInfo? matchInfo;
final routesMap={
  RoutesConst.matchDetailScreen:(context){
    return MatchDetailScreen( matchInfo: MatchInfo(),
      information: Information());
  }
};
class RoutesConst{
  static const String matchDetailScreen='MatchDetailScreen';
}
