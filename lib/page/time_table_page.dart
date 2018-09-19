import 'package:flutter/material.dart';
import 'package:mtc2018_app/page/session_detail.dart';
import 'package:mtc2018_app/page/speaker_detail.dart';
import 'package:mtc2018_app/model/session.dart';
import 'package:mtc2018_app/model/speaker.dart';
import 'dart:convert';
import "package:intl/intl.dart";
import '../colors.dart';

class TimeTablePage extends StatelessWidget {
  final DateFormat formatter = DateFormat("HH:mm");

  Widget buildSessionCard(BuildContext context, Session session) {
    return Card(
        color: Colors.white,
        child: FlatButton(
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      settings: RouteSettings(name: '/session_detail'),
                      builder: (context) {
                        return SessionDetailPage(session: session);
                      }));
            },
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                    padding: const EdgeInsets.only(
                        top: 20.0, left: 20.0, right: 20.0, bottom: 10.0),
                    child: buildSessionTimeRange(
                        session.startTime, session.endTime)),
                Container(
                    padding: const EdgeInsets.only(left: 20.0, right: 20.0),
                    child: buildSessionTitle(session.title)),
                Container(
                    padding: const EdgeInsets.only(
                        left: 20.0, right: 20.0, bottom: 10.0),
                    child: buildSessionText(session.outline)),
                Container(
                    padding: const EdgeInsets.only(
                        left: 20.0, right: 20.0, bottom: 20.0),
                    child: buildSessionTags(session.tags)),
                Container(
                    padding: const EdgeInsets.only(bottom: 20.0),
                    child: buildSessionSpeakersInformation(
                        context, session.speakers))
              ],
            )));
  }

  Widget buildSessionTimeRange(String startTime, String endTime) {
    var start = DateTime.parse(startTime).toLocal();
    var end = DateTime.parse(endTime).toLocal();

    var startTimeString = formatter.format(start);
    var endTimeString = formatter.format(end);
    var timeRangeString = "$startTimeString ~ $endTimeString";
    return Container(
        margin: const EdgeInsets.only(bottom: 5.0),
        child: Text(timeRangeString,
            style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 14.0,
                color: Colors.black)));
  }

  Widget buildSessionTitle(String title) {
    return Container(
        margin: const EdgeInsets.only(bottom: 10.0),
        child: Text(title,
            style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 25.0,
                color: Colors.black)));
  }

  Widget buildSessionTags(List<String> tags) {
    List<Container> containers = tags.map((tag) {
      return buildSessionTag(tag);
    }).toList();
    return Container(child: Row(children: containers));
  }

  Container buildSessionTag(String tag) {
    return Container(
        margin: const EdgeInsets.all(2.0),
        padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 3.0),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.0),
            border: const Border(
              top: const BorderSide(width: 1.0, color: kMtcSecondaryRed),
              left: const BorderSide(width: 1.0, color: kMtcSecondaryRed),
              bottom: const BorderSide(width: 1.0, color: kMtcSecondaryRed),
              right: const BorderSide(width: 1.0, color: kMtcSecondaryRed),
            )),
        child: Text(tag, style: TextStyle(color: kMtcSecondaryRed)));
  }

  Widget buildSessionText(String text) {
    return Container(
        margin: const EdgeInsets.only(top: 20.0, bottom: 20.0),
        child: Text(text, style: TextStyle(color: Colors.black)));
  }

  Widget buildSessionSpeakersInformation(
      BuildContext context, List<Speaker> speakers) {
    List<Widget> containers = speakers.map((speaker) {
      return buildSessionSpeakerInformation(context, speaker);
    }).toList();
    return Container(child: Column(children: containers));
  }

  Widget buildSessionSpeakerInformation(BuildContext context, Speaker speaker) {
    return FlatButton(
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  settings: RouteSettings(name: '/speaker_detail'),
                  builder: (context) {
                    return SpeakerDetailPage(speaker: speaker);
                  }));
        },
        child: Container(
            decoration: BoxDecoration(
                border: Border(top: BorderSide(width: 1.0)),
                color: Color(0xDDDDDD)),
            child: ListTile(
              contentPadding: const EdgeInsets.all(0.0),
              leading: CircleAvatar(
                backgroundImage: new NetworkImage(speaker.iconUrl),
                radius: 25.0,
              ),
              title: Text(speaker.name,
                  style: TextStyle(
                      fontWeight: FontWeight.bold, color: Colors.black)),
              subtitle:
                  Text(speaker.position, style: TextStyle(color: Colors.black)),
              // trailing: IconButton(
              //     icon: const Icon(Icons.favorite_border),
              //     color: Colors.black,
              //     onPressed: () {
              //       AlertDialog(
              //           title: Text('Go to the session!'),
              //           content: Text('Hey!'));
              //     }),
            )));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.all(0.0),
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
                            children: trackASessions.map((session) {
                          return buildSessionCard(context, session);
                        }).toList()),
                        ListView(
                            children: trackBSessions.map((session) {
                          return buildSessionCard(context, session);
                        }).toList()),
                      ],
                    ),
                  );
                })));
  }
}
