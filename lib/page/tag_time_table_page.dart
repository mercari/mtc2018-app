import "package:flutter_web/material.dart";
import "package:mtc2018_app/page/session_detail.dart";
import "package:mtc2018_app/page/speaker_detail.dart";
import "package:mtc2018_app/model/session.dart";
import "package:mtc2018_app/model/speaker.dart";
import "package:mtc2018_app/widget/session_card.dart";
import "package:mtc2018_app/repository/repository.dart";

class TagTimeTablePage extends StatelessWidget {
  final String tagName;
  final List<Session> sessionList;
  final Repository repository;

  const TagTimeTablePage(
      {Key key, this.tagName, this.sessionList, this.repository})
      : super(key: key);

  _onSpeakerPressed(BuildContext context, Speaker speaker) {
    Navigator.push(
        context,
        MaterialPageRoute(
            settings: RouteSettings(name: "/speaker_detail"),
            builder: (context) {
              return SpeakerDetailPage(speaker: speaker);
            }));
  }

  _onCardPressed(BuildContext context, Session session) {
    Navigator.push(
        context,
        MaterialPageRoute(
            settings: RouteSettings(name: "/session_detail"),
            builder: (context) {
              return SessionDetailPage(
                repository: repository,
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
                  repository: repository,
                  tagName: tagName,
                  sessionList: sessionList);
            }));
  }

  Widget buildBody(BuildContext context) {
    var _sessions = sessionList.where((s) => s.tags.contains(tagName));
    return Container(
        margin: const EdgeInsets.all(8.0),
        child: ListView(
            children: _sessions.map((session) {
          return SessionCard(
            session: session,
            onCardPressed: () {
              _onCardPressed(context, session);
            },
            onSpeakerPressed: (speaker) {
              _onSpeakerPressed(context, speaker);
            },
            onTagPressed: (tagName) {
              _onTagPressed(context, tagName);
            },
          );
        }).toList()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          iconTheme: IconThemeData(color: Colors.white),
          title: Text(tagName),
          centerTitle: false,
        ),
        body: buildBody(context));
  }
}
