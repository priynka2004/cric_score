import 'package:cric_score/model/match_api_response.dart';
import 'package:cric_score/model/match_info_model.dart';
import 'package:cric_score/service/match_api_service.dart';
import 'package:cric_score/shared/strings_const.dart';
import 'package:cric_score/ui/match_detail_screen.dart';
import 'package:flutter/material.dart';

class MatchInfoScreen extends StatefulWidget {
  const MatchInfoScreen({super.key});

  @override
  State<MatchInfoScreen> createState() => _MatchInfoScreenState();
}

class _MatchInfoScreenState extends State<MatchInfoScreen> {
  late MatchApiService matchApiService;
  MatchApiResponse? matchApiResponse;

  getMatchInformation() async {
    matchApiResponse = await MatchApiService.getMatchInformation();
    setState(() {});
  }

  @override
  void initState() {
    getMatchInformation();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              StringConst. appText ,
              style: TextStyle(color: Colors.white),
            ),
            SizedBox(
              height: 16,
            ),
            Row(
              children: [
                Text(
                  StringConst. appText ,
                  style: TextStyle(color: Colors.white, fontSize: 15),
                ),
                SizedBox(
                  width: 130,
                ),
                Text(
                  StringConst.appText2,
                  style: TextStyle(color: Colors.white, fontSize: 15),
                ),
              ],
            )
          ],
        ),
        backgroundColor: Colors.teal,
        toolbarHeight: 100,
      ),
      body: ListView.builder(
        itemCount: matchApiResponse?.matchInfoList?.length ?? 0,
        itemBuilder: (BuildContext context, int index) {
          MatchInfo matchInfo = matchApiResponse!.matchInfoList![index];
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: GestureDetector(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return MatchDetailScreen(
                    matchInfo: matchInfo,
                    information: matchApiResponse!.info,
                  );
                }));
              },
              child: Card(
                child: ListTile(
                  title: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(matchApiResponse!.matchInfoList![0].date.toString()),
                      Text(matchApiResponse!.matchInfoList![0].name.toString()),
                      const Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Icon(Icons.notifications_active_outlined),
                        ],
                      ),
                      Row(
                        children: [
                          Image.network(matchInfo.teamInfo![0].img.toString(),
                              height: 50),
                          const SizedBox(
                            width: 5,
                          ),
                          Text(matchInfo.teamInfo![0].shortname.toString()),
                          const SizedBox(
                            width: 5,
                          ),
                          //Text('${matchInfo.score![0].r}-${matchInfo.score![0].w}-${matchInfo.score![0].o}'),
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: [
                          Image.network(matchInfo.teamInfo![1].img.toString(),height: 50,),
                          const SizedBox(
                            width: 5,
                          ),
                          Text(matchInfo.teamInfo![1].shortname.toString()),
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text(matchInfo.status.toString()),
                          const SizedBox(
                            height: 10,
                          ),
                          const Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Text(
                               StringConst.text
                              ),
                              SizedBox(
                                width: 15,
                              ),
                              Text(
                               StringConst.text2,
                              ),
                            ],
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
