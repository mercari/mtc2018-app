import "package:flutter/material.dart";
import "package:mtc2018_app/page/session_detail.dart";
import "package:mtc2018_app/page/speaker_detail.dart";
import "package:mtc2018_app/page/tag_time_table_page.dart";
import "package:mtc2018_app/model/session.dart";
import "package:mtc2018_app/model/speaker.dart";
import "package:mtc2018_app/colors.dart";
import "package:mtc2018_app/widget/session_card.dart";
import "package:mtc2018_app/repository/repository.dart";
import "dart:async";

class TimeTablePage extends StatefulWidget {
  final Repository repository;

  const TimeTablePage({Key key, this.repository}) : super(key: key);

  @override
  _TimeTablePageState createState() => _TimeTablePageState();
}

class _TimeTablePageState extends State<TimeTablePage> {
  List<Session> _sessionList = [];

  @override
  void initState() {
    super.initState();
    _loadSessionList();
  }

  @override
  Widget build(BuildContext context) {
    if (_sessionList.length == 0) {
      return Center(
        child: CircularProgressIndicator(),
      );
    }

    var trackASessions = _sessionList.where((s) => s.place == "TrackA");
    var trackBSessions = _sessionList.where((s) => s.place == "TrackB");

    return Container(
        child: DefaultTabController(
            length: 2,
            child: Scaffold(
              appBar: TabBar(
                tabs: [Tab(text: "TRACK A"), Tab(text: "TRACK B")],
                labelColor: kMtcSecondaryRed,
                indicatorColor: kMtcSecondaryRed,
              ),
              body: TabBarView(
                children: [
                  RefreshIndicator(
                      onRefresh: _handleRefresh,
                      child: ListView(
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
                          }).toList())),
                  RefreshIndicator(
                      onRefresh: _handleRefresh,
                      child: ListView(
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
                          }).toList())),
                ],
              ),
            )));
  }

  void _loadSessionList() async {
    final sessionList = await widget.repository.getSessionList();
    setState(() {
      _sessionList = sessionList;
    });
  }

  void _onSpeakerPressed(BuildContext context, Speaker speaker) {
    Navigator.push(
        context,
        MaterialPageRoute(
            settings: RouteSettings(name: "/speaker_detail"),
            builder: (context) {
              return SpeakerDetailPage(speaker: speaker);
            }));
  }

  void _onCardPressed(BuildContext context, Session session) {
    Navigator.push(
        context,
        MaterialPageRoute(
            settings: RouteSettings(name: "/session_detail"),
            builder: (context) {
              return SessionDetailPage(session: session);
            }));
  }

  void _onTagPressed(BuildContext context, String tagName) {
    Navigator.push(
        context,
        MaterialPageRoute(
            settings: RouteSettings(name: "/tag_time_table"),
            builder: (context) {
              return TagTimeTablePage(
                  tagName: tagName, sessionList: _sessionList);
            }));
  }

  Future<Null> _handleRefresh() async {
    final sessionList = await widget.repository.refreshSessionList();
    setState(() {
      _sessionList = sessionList;
    });
  }
}
