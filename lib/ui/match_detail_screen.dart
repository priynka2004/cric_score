import 'package:cric_score/model/score_information_model.dart';
import 'package:cric_score/model/match_info_model.dart';
import 'package:cric_score/shared/strings_const.dart';
import 'package:flutter/material.dart';

class MatchDetailScreen extends StatefulWidget {
  const MatchDetailScreen(
      {super.key, required this.information, required this.matchInfo});

  final ScoreInformation? information;
  final MatchInfo matchInfo;

  @override
  State<MatchDetailScreen> createState() => _MatchDetailScreenState();
}

class _MatchDetailScreenState extends State<MatchDetailScreen> {
  MatchInfo? matchInfoLisi;
  ScoreInformation? matchInformation;

  @override
  void initState(){
    matchInfoLisi = widget.matchInfo;
    matchInformation = widget.information;
    super.initState();
  }

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            Text(widget.matchInfo.teamInfo![0].shortname.toString()),
            const SizedBox(width: 7,),
            Text(widget.matchInfo.teamInfo![1].shortname.toString()),
          ],
        ),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                StringConst.text3,
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
              ),
              const Divider(),
              const SizedBox(
                height: 16,
              ),
              SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.symmetric(),
                  child: Row(
                    children: [
                      const Text(StringConst.text4),
                      const Spacer(),
                      Text(widget.matchInfo.matchType.toString()),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 8,
              ),
              Row(
                children: [
                  const Text(StringConst.text5),
                  const Spacer(),
                  Text(widget.matchInfo.date.toString()),
                ],
              ),
              const SizedBox(
                height: 8,
              ),
              Row(
                children: [
                  const Text(StringConst.text6),
                  const Spacer(),
                  Text(widget.matchInfo.dateTimeGMT.toString()),
                ],
              ),
              const SizedBox(
                height: 8,
              ),
              Row(
                children: [
                  const Text(StringConst.text7),
                  const Spacer(),
                  Flexible(child: Text(widget.matchInfo.venue.toString())),
                ],
              ),
              const SizedBox(
                height: 8,
              ),
              Column(
                children: [
                  Row(
                    children: [
                      const Text(StringConst.text8),
                      const Spacer(),
                      Text(widget.information!.hitsToday.toString()
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Row(
                    children: [
                      const Text(StringConst.text9),
                      const Spacer(),
                      Text(widget.information!.queryTime.toString()),
                    ],
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Row(
                    children: [
                      const Text(StringConst.text10),
                      const Spacer(),
                      Text(widget.information!.hitsLimit.toString()),
                    ],
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Row(
                    children: [
                      const Text(StringConst.text11),
                      const Spacer(),
                      Text(widget.information!.cache.toString()),
                    ],
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Row(
                    children: [
                      const Text(StringConst.text12),
                      const Spacer(),
                      Text(widget.information!.credits.toString()),
                    ],
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Row(
                    children: [
                      const Text(StringConst.text13),
                      const Spacer(),
                      Text(widget.information!.hitsToday.toString()),
                    ],
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Row(
                    children: [
                      const Text(StringConst.text14),
                      const Spacer(),
                      Text(widget.information!.server.toString()),
                    ],
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Row(
                    children: [
                      const Text(StringConst.text15),
                      const Spacer(),
                      Text(widget.information!.totalRows.toString()),
                    ],
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

