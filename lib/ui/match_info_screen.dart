import 'package:cric_score/model/match_api_response.dart';
import 'package:cric_score/provider/match_provider.dart';
import 'package:cric_score/service/match_api_service.dart';
import 'package:cric_score/shared/strings_const.dart';
import 'package:cric_score/ui/match_detail_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MatchInfoScreen extends StatefulWidget {
  const MatchInfoScreen({super.key});

  @override
  State<MatchInfoScreen> createState() => _MatchInfoScreenState();
}

class _MatchInfoScreenState extends State<MatchInfoScreen> {
  late MatchApiService matchApiService;
  MatchApiResponse? matchApiResponse;
  late MatchProvider matchProvider;

  @override
  void initState() {
    matchProvider = Provider.of<MatchProvider>(context, listen: false);
    getMatchInformation();
    fetchMatch();
    super.initState();
  }

  Future<void> fetchMatch() async {
    await matchProvider.fetchMatch();
  }

  getMatchInformation() async {
    matchApiResponse = await MatchApiService.getMatchInformation();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              StringConst.appText,
              style: TextStyle(color: Colors.white),
            ),
            SizedBox(
              height: 16,
            ),
            Row(
              children: [
                Text(
                  StringConst.appText,
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
      body: Consumer<MatchProvider>(builder: (
        child,
        provider,
        context,
      ) {
        if (provider.isLoading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        return ListView.builder(
          itemCount: provider.matchApiResponse?.matchInfoList?.length ?? 0,
          itemBuilder: (BuildContext context, int index) {
            var matchInfo = provider.matchApiResponse?.matchInfoList?[index];
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return MatchDetailScreen(
                      matchInfo: matchInfo,
                      information: matchApiResponse?.info,
                    );
                  }));
                },
                child: Card(
                  child: ListTile(
                    title: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Text(matchApiResponse!.matchInfoList![0].date
                        //     .toString()),
                        // Text(matchApiResponse!.matchInfoList![0].name
                        //     .toString()),
                        //
                        Text(provider
                            .matchApiResponse!.matchInfoList!.first.date
                            .toString()),
                        Text(provider
                            .matchApiResponse!.matchInfoList!.first.name
                            .toString()),
                        const Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Icon(Icons.notifications_active_outlined),
                          ],
                        ),
                        Row(
                          children: [
                            Image.network(matchInfo!.teamInfo?[0].img ?? '',
                                height: 50),
                            const SizedBox(
                              width: 10,
                            ),
                            Text(matchInfo.teamInfo?[0].shortname ?? ''),
                            const SizedBox(
                              width: 5,
                            ),
                            // Text(
                            //      '${matchInfo.score![0].r}-${matchInfo.score![0].w}-${matchInfo.score![0].o}'),
                          ],
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Row(
                          children: [
                            Image.network(
                              matchInfo.teamInfo?[1].img ?? '',
                              height: 50,
                            ),
                            const SizedBox(
                              width: 5,
                            ),
                            Text(matchInfo.teamInfo?[1].shortname ?? ''),
                            const SizedBox(
                              width: 10,
                            ),
                            // Text(
                            //     '${matchInfo.score![1].r}-${matchInfo.score![1].w}-${matchInfo.score![1].o}'),
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
                                Text(StringConst.text),
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
        );
      }),
    );
  }
}
