import 'package:flutter/material.dart';
import 'package:mtc2018_app/page/session_detail.dart';
import 'package:mtc2018_app/page/speaker_detail.dart';
import 'package:mtc2018_app/model/session.dart';
import 'package:mtc2018_app/model/speaker.dart';
import '../widget/session_card.dart';
import 'dart:convert';
import 'package:flutter/services.dart' show rootBundle;

class TagTimeTablePage extends StatefulWidget {
  final String tagName;

  const TagTimeTablePage({Key key, this.tagName}) : super(key: key);

  @override
  _TagTimeTablePageState createState() => _TagTimeTablePageState();
}

class _TagTimeTablePageState extends State<TagTimeTablePage> {
  List<Session> _sessions = [];

  @override
  void initState() {
    super.initState();
    _loadSessions();
  }

  void _loadSessions() async {
    String jsonString = await rootBundle.loadString("data/contents.json");
    var contents = json.decode(jsonString);
    var sessions = (contents["sessions"] as List)
        .map((session) => Session.fromJson(session))
        .where((session) => session.tags.contains(widget.tagName))
        .toList();
    setState(() {
      _sessions = sessions;
    });
  }

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
              return TagTimeTablePage(tagName: tagName);
            }));
  }

  Widget buildBody(BuildContext context) {
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
        appBar: AppBar(title: Text(widget.tagName)), body: buildBody(context));
  }
}
