import "package:flutter_web/material.dart";
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
  List<ScrollController> _scrollCtList = [];
  @override
  void initState() {
    super.initState();
    _init();
  }

  void _init() async {
    final sessionList = await widget.repository.getSessionList();
    if (this.mounted) {
      setState(() {
        _sessionList = sessionList;
        _scrollCtList = new List.generate(sessionList.length,
            (i) => new ScrollController(initialScrollOffset: 0.0));
      });
    }
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
              appBar: AppBar(
                  iconTheme: IconThemeData(color: Colors.white),
                  flexibleSpace: SafeArea(
                    child: TabBar(
                      tabs: [Tab(text: "TRACK A"), Tab(text: "TRACK B")],
                      labelColor: kMtcSecondaryRed,
                      indicatorColor: kMtcSecondaryRed,
                      indicatorWeight: 4.0,
                      unselectedLabelColor: Colors.white,
                      labelStyle: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  )),
              body: TabBarView(
                children: [
                  RefreshIndicator(
                      onRefresh: _handleRefresh,
                      child: new NotificationListener(
                          child: ListView(
                              controller: _scrollCtList.length >= 1
                                  ? _scrollCtList[0]
                                  : null,
                              padding: EdgeInsets.all(8.0),
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
                          onNotification: (notification) {
                            _handleScrollCtl(0, notification);
                          })),
                  RefreshIndicator(
                      onRefresh: _handleRefresh,
                      child: new NotificationListener(
                          child: ListView(
                              controller: _scrollCtList.length >= 2
                                  ? _scrollCtList[1]
                                  : null,
                              padding: EdgeInsets.all(8.0),
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
                          onNotification: (notification) {
                            _handleScrollCtl(1, notification);
                          })),
                ],
              ),
            )));
  }

  void _handleScrollCtl(int index, notification) {
    if (this.mounted && notification is ScrollNotification) {
      setState(() {
        _scrollCtList[index] = new ScrollController(
            initialScrollOffset: notification.metrics.pixels);
      });
    }
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
              return SessionDetailPage(
                repository: widget.repository,
                sessionId: session.id,
              );
            }));
  }

  void _onTagPressed(BuildContext context, String tagName) {
    Navigator.push(
        context,
        MaterialPageRoute(
            settings: RouteSettings(name: "/tag_time_table"),
            builder: (context) {
              return TagTimeTablePage(
                  repository: widget.repository,
                  tagName: tagName,
                  sessionList: _sessionList);
            }));
  }

  Future<Null> _handleRefresh() async {
    final sessionList = await widget.repository.refreshSessionList();
    if (this.mounted) {
      setState(() {
        _sessionList = sessionList;
      });
    }
  }
}
