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
          //itemCount: matchApiResponse?.matchInfoList?.length ?? 0,
          itemCount: provider.matchApiResponse?.matchInfoList?.length ?? 0,
          itemBuilder: (BuildContext context, int index) {
            // MatchInfo matchInfo = matchApiResponse!.matchInfoList![index];
            var matchInfo = provider.matchApiResponse?.matchInfoList?[index];
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
                        // Text(matchApiResponse!.matchInfoList![0].date
                        //     .toString()),
                        // Text(matchApiResponse!.matchInfoList![0].name
                        //     .toString()),
                        //
                        Text(provider.matchApiResponse!.matchInfoList!.first.date
                            .toString()),
                        Text(provider.matchApiResponse!.matchInfoList!.first.name
                            .toString()),
                        const Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Icon(Icons.notifications_active_outlined),
                          ],
                        ),
                        Row(
                          children: [
                            Image.network(
                                matchInfo!.teamInfo![0].img.toString(),
                                height: 50),
                            const SizedBox(
                              width: 10,
                            ),
                            Text(matchInfo.teamInfo![0].shortname.toString()),
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
                              matchInfo.teamInfo![1].img.toString(),
                              height: 50,
                            ),
                            const SizedBox(
                              width: 5,
                            ),
                            Text(matchInfo.teamInfo![1].shortname.toString()),
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

// import 'package:cric_score/model/match_api_response.dart';
// import 'package:cric_score/provider/match_provider.dart';
// import 'package:cric_score/service/match_api_service.dart';
// import 'package:cric_score/shared/colors_const.dart';
// import 'package:cric_score/shared/strings_const.dart';
// import 'package:cric_score/ui/match_detail_screen.dart';
// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
//
// class MatchInfoScreen extends StatefulWidget {
//   const MatchInfoScreen({super.key});
//
//   @override
//   State<MatchInfoScreen> createState() => _MatchInfoScreenState();
// }
//
// class _MatchInfoScreenState extends State<MatchInfoScreen> {
//   late MatchApiService matchApiService;
//   MatchApiResponse? matchApiResponse;
//   MatchProvider matchProvider = MatchProvider();
//
//   @override
//   void initState() {
//     matchProvider = Provider.of<MatchProvider>(context,listen: false);
//     fetchMatch();
//     super.initState();
//   }
//
//   Future<void> fetchMatch() async {
//    await matchProvider.fetchMatch();
//   }
//
//   // getMatchInformation() async {
//   //   currentMatches = await MatchApiService.getMatchInformation();
//   //   // currentMatchesList = await MatchApiService.getMatchInformation();
//   //   // print(currentMatchesList.length);
//   //   setState(() {});
//   // }
//   //
//   // @override
//   // void initState() {
//   //   getMatchInformation();
//   //   super.initState();
//   // }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Text(
//               StringConst.appName,
//               style: TextStyle(color: ColorsConst.primaryColors1),
//             ),
//             SizedBox(
//               height: 16,
//             ),
//             Row(
//               children: [
//                 Text(
//                   StringConst.appText,
//                   style: TextStyle(
//                       color: ColorsConst.primaryColors2, fontSize: 15),
//                 ),
//                 SizedBox(
//                   width: 130,
//                 ),
//                 Text(
//                   StringConst.appText2,
//                   style: TextStyle(
//                       color: ColorsConst.primaryColors3, fontSize: 15),
//                 ),
//               ],
//             )
//           ],
//         ),
//         backgroundColor: ColorsConst.primaryColors,
//         toolbarHeight: 100,
//       ),
//       // body: ListView.builder(
//       //   itemCount: currentMatches?.matchInfoList?.length ?? 0,
//       //   itemBuilder: (BuildContext context, int index) {
//       //     MatchInfo matchInfo = currentMatches!.matchInfoList![index];
//       //     return Padding(
//       //       padding: const EdgeInsets.all(8.0),
//       //       child: GestureDetector(
//       //         onTap: () {
//       //           Navigator.push(context, MaterialPageRoute(builder: (context) {
//       //             return MatchDetailScreen(
//       //               matchInfoList: matchInfo,
//       //               information: currentMatches!.info,
//       //             );
//       //           }));
//       //          // Navigator.pushNamed(context,RoutesConst.matchDetailScreen);
//       //         },
//       body: Consumer<MatchProvider>(builder: (
//         child,
//         provider,
//         context,
//       ) {
//         return ListView.builder(
//           itemCount: provider.matchInfoList?.matchInfoList?.length ?? 0, //matchApiResponse?.matchInfoList?.length ?? 0,
//           itemBuilder: (BuildContext context, int index) {
//             var matchInfo = provider.matchInfoList!.matchInfoList![index];//matchApiResponse!.matchInfoList![index];
//             return Padding(
//               padding: const EdgeInsets.all(8.0),
//               child: GestureDetector(
//                 onTap: () {
//                   Navigator.push(context,
//                       MaterialPageRoute(builder: (context) {
//                     return ChangeNotifierProvider<MatchProvider>.value(
//                       value: provider,
//                       child:  MatchDetailScreen(
//                   matchInfo: matchInfo,
//                   information: matchApiResponse?.info,
//                       ),
//                     );
//                     // MatchDetailScreen(
//                     //   matchInfoList: matchInfo,
//                     //   information: matchApiResponse!.info,
//                     // );
//                   }));
//                 //   Navigator.pushNamed(context,RoutesConst.matchDetailScreen);
//                 },
//                 child: Card(
//                   child: ListTile(
//                     title: Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         Text(
//                             provider.matchInfoList!.matchInfoList!.first.date.toString()
//                         ),
//                         Text(provider.matchInfoList!.matchInfoList!.first.name.toString()),
//                         const Row(
//                           mainAxisAlignment: MainAxisAlignment.end,
//                           children: [
//                             Icon(Icons.notifications_active_outlined),
//                           ],
//                         ),
//                         SingleChildScrollView(
//                           scrollDirection: Axis.horizontal,
//                           child: Row(
//                             children: [
//                               Image.network(
//                                   //provider.matchInfoList!.te!.first.date.toString()
//                                   matchInfo.teamInfo![0].img.toString()
//                               ),
//                               const SizedBox(
//                                 width: 5,
//                               ),
//                               Text(matchInfo.teamInfo![0].shortname
//                                   .toString()),
//                             ],
//                           ),
//                         ),
//                         const SizedBox(
//                           height: 10,
//                         ),
//                         Row(
//                           children: [
//                             Image.network(
//                                 matchInfo.teamInfo![1].img.toString()),
//                             const SizedBox(
//                               width: 5,
//                             ),
//                             Text(matchInfo.teamInfo![1].shortname.toString()),
//                           ],
//                         ),
//                         const Column(
//                           mainAxisAlignment: MainAxisAlignment.end,
//                           crossAxisAlignment: CrossAxisAlignment.end,
//                           children: [
//                             Row(
//                               mainAxisAlignment: MainAxisAlignment.end,
//                               children: [
//                                 Text(
//                                   StringConst.text,
//                                 ),
//                                 SizedBox(
//                                   width: 15,
//                                 ),
//                                 Text(
//                                   StringConst.text2,
//                                 ),
//                               ],
//                             ),
//                           ],
//                         )
//                       ],
//                     ),
//                   ),
//                 ),
//               ),
//             );
//           },
//         );
//       }),
//     );
//   }
// }
