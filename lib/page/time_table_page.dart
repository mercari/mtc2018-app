import 'package:flutter/material.dart';
import 'package:mtc2018_app/page/session_detail.dart';
import 'package:mtc2018_app/page/speaker_detail.dart';
import 'package:mtc2018_app/page/tag_time_table_page.dart';
import 'package:mtc2018_app/model/session.dart';
import 'package:mtc2018_app/model/speaker.dart';
import 'dart:convert';
import '../colors.dart';
import '../widget/session_card.dart';

class TimeTablePage extends StatelessWidget {
  _onSpeakerPressed(BuildContext context, Speaker speaker) {
    Navigator.push(
        context,
        MaterialPageRoute(
            settings: RouteSettings(name: '/speaker_detail'),
            builder: (context) {
              return SpeakerDetailPage(speaker: speaker);
            }));
  }

  _onCardPressed(BuildContext context, Session session) {
    Navigator.push(
        context,
        MaterialPageRoute(
            settings: RouteSettings(name: '/session_detail'),
            builder: (context) {
              return SessionDetailPage(session: session);
            }));
  }

  _onTagPressed(BuildContext context, String tagName) {
    Navigator.push(
        context,
        MaterialPageRoute(
            settings: RouteSettings(name: '/tag_time_table'),
            builder: (context) {
              return TagTimeTablePage(sessions: [], tagName: tagName);
            }));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        child: DefaultTabController(
            length: 2,
            child: FutureBuilder(
                future: DefaultAssetBundle.of(context)
                    .loadString("data/contents.json"),
                builder: (context, snapshot) {
                  var contents = json.decode(snapshot.data.toString());
                  if (contents == null) {
                    return Text(""); // TODO: Show loading
                  }
                  var sessions = (contents["sessions"] as List)
                      .map((session) => Session.fromJson(session));
                  var trackASessions =
                      sessions.where((s) => s.place == "TrackA");
                  var trackBSessions =
                      sessions.where((s) => s.place == "TrackB");
                  return Scaffold(
                    appBar: TabBar(
                      tabs: [Tab(text: "TRACK A"), Tab(text: "TRACK B")],
                      labelColor: kMtcSecondaryRed,
                      indicatorColor: kMtcSecondaryRed,
                    ),
                    body: TabBarView(
                      children: [
                        ListView(
                            padding: EdgeInsets.all(16.0),
                            children: trackASessions.map((session) {
                              return SessionCard(
                                session: session,
                                onCardPressed: () {
                                  _onCardPressed(context, session);
                                },
                                onSpeakerPressed: (speaker) {
                                  _onSpeakerPressed(context, speaker);
                                },
                                onTagPressed: (tag) {
                                  _onTagPressed(context, tag);
                                },
                              );
                            }).toList()),
                        ListView(
                            padding: EdgeInsets.all(16.0),
                            children: trackBSessions.map((session) {
                              return SessionCard(
                                  session: session,
                                  onCardPressed: () {
                                    _onCardPressed(context, session);
                                  },
                                  onSpeakerPressed: (speaker) {
                                    _onSpeakerPressed(context, speaker);
                                  },
                                  onTagPressed: (tag) {
                                    _onTagPressed(context, tag);
                                  });
                            }).toList()),
                      ],
                    ),
                  );
                })));
  }
}
