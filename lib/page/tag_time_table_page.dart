import 'package:flutter/material.dart';
import 'package:mtc2018_app/page/session_detail.dart';
import 'package:mtc2018_app/page/speaker_detail.dart';
import 'package:mtc2018_app/model/session.dart';
import 'package:mtc2018_app/model/speaker.dart';
import '../widget/session_card.dart';

class TagTimeTablePage extends StatelessWidget {
  final List<Session> sessions;
  final String categoryName;

  const TagTimeTablePage({Key key, this.sessions, this.categoryName})
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

  Widget buildBody(BuildContext context) {
    return Container(
        margin: const EdgeInsets.all(16.0),
        child: ListView(
            children: sessions.map((session) {
          return SessionCard(
            session: session,
            onCardPressed: () {
              _onCardPressed(context, session);
            },
            onSpeakerPressed: (speaker) {
              _onSpeakerPressed(context, speaker);
            },
          );
        }).toList()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text(categoryName)), body: buildBody(context));
  }
}
