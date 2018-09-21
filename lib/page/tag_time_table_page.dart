import 'package:flutter/material.dart';
import 'package:mtc2018_app/page/session_detail.dart';
import 'package:mtc2018_app/page/speaker_detail.dart';
import 'package:mtc2018_app/graphql/session.dart';
import 'package:mtc2018_app/graphql/speaker.dart';
import '../widget/session_card.dart';

class TagTimeTablePage extends StatelessWidget {
  final String tagName;
  final List<Session> sessions;

  const TagTimeTablePage({Key key, this.tagName, this.sessions})
      : super(key: key);

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

  void _onTagPressed(BuildContext context, String tagName) {
    Navigator.push(
        context,
        MaterialPageRoute(
            settings: RouteSettings(name: '/tag_time_table'),
            builder: (context) {
              return TagTimeTablePage(tagName: tagName, sessions: sessions);
            }));
  }

  Widget buildBody(BuildContext context) {
    var _sessions = sessions.where((s) => s.tags.contains(tagName));
    return Container(
        margin: const EdgeInsets.all(16.0),
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
          title: Text(tagName),
          centerTitle: false,
        ),
        body: buildBody(context));
  }
}
