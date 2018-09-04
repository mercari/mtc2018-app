import 'package:flutter/material.dart';
import 'package:mtc2018_app/model/session.dart';
import 'package:mtc2018_app/model/speaker.dart';
import "package:intl/intl.dart";
import 'package:mtc2018_app/widget/link_button.dart';

class SessionDetailPage extends StatelessWidget {
  final Session session;

  const SessionDetailPage({
    Key key,
    this.session,
  }) : super(key: key);

  Widget buildBody() {
    return Container(
        margin: EdgeInsets.only(top: 20.0, bottom: 20.0),
        child: ListView(children: <Widget>[
          Container(
              margin: const EdgeInsets.only(bottom: 10.0),
              padding: const EdgeInsets.only(left: 20.0, right: 20.0),
              child: buildSummary()),
          Container(
              margin: const EdgeInsets.only(top: 30.0, bottom: 30.0),
              padding: const EdgeInsets.only(left: 20.0, right: 20.0),
              child: buildContent()),
          Card(
              child: Container(
                  margin: const EdgeInsets.only(bottom: 10.0),
                  padding: const EdgeInsets.only(
                      left: 20.0, right: 20.0, bottom: 12.0, top: 12.0),
                  child: buildSpeakersInformation(session.speakers)))
        ]));
  }

  Widget buildSummary() {
    var formatter = DateFormat("HH:mm");
    var start = DateTime.parse(session.startTime).toLocal();
    var end = DateTime.parse(session.endTime).toLocal();

    var startTimeString = formatter.format(start);
    var endTimeString = formatter.format(end);
    var timeRangeString = "$startTimeString ~ $endTimeString";

    return Material(
        type: MaterialType.canvas,
        shadowColor: Colors.white,
        child: Container(
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
                margin: const EdgeInsets.only(bottom: 5.0),
                child: Text(timeRangeString,
                    style: const TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 14.0))),
            Container(
                margin: const EdgeInsets.only(bottom: 10.0),
                child: Text(session.title,
                    style: const TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 22.0))),
            Container(
                margin: const EdgeInsets.only(bottom: 10.0),
                child: buildSessionTags(session.tags)),
          ],
        )));
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
              top: const BorderSide(width: 1.0, color: Colors.white),
              left: const BorderSide(width: 1.0, color: Colors.white),
              bottom: const BorderSide(width: 1.0, color: Colors.white),
              right: const BorderSide(width: 1.0, color: Colors.white),
            )),
        child: Text(tag, style: TextStyle(color: Colors.white)));
  }

  Widget buildContent() {
    return Text(session.outline, style: TextStyle(fontSize: 16.0));
  }

  Widget buildSpeakersInformation(List<Speaker> speakers) {
    List<Widget> containers = speakers.map((speaker) {
      return buildSpeakerInformation(speaker);
    }).toList();
    return Container(
        padding: const EdgeInsets.all(0.0),
        child: Column(children: containers));
  }

  Widget buildSpeakerInformation(Speaker speaker) {
    return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
              margin: const EdgeInsets.only(bottom: 10.0),
              child: buildSessionSpeakerInformation(speaker)),
          Container(
              margin: const EdgeInsets.only(bottom: 20.0),
              child: Text(speaker.profile)),
          buildLinkButtons(speaker)
        ]);
  }

  Widget buildLinkButtons(Speaker speaker) {
    var twitterId = speaker.twitterId;
    var githubId = speaker.githubId;
    //TODO: Use icons
    var twitterLinkButton = LinkButton(
        title: "twitter @$twitterId", url: "https://twitter.com/$twitterId");
    var githubLinkButton = LinkButton(
        title: "github $githubId", url: "https://github.com/$githubId");

    return Container(
        padding: const EdgeInsets.all(0.0),
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [twitterLinkButton, githubLinkButton]));
  }

  Widget buildSessionSpeakerInformation(Speaker speaker) {
    return Container(
        child: ListTile(
      contentPadding: const EdgeInsets.all(0.0),
      // leading: const Icon(Icons.android, color: Colors.white, size: 40.0),
      title: Text(speaker.name,
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white)),
      subtitle: Text(speaker.position, style: TextStyle(color: Colors.white)),
      // trailing: IconButton(icon: const Icon(Icons.favorite_border), color: Colors.black, onPressed: () { AlertDialog(title: Text('Go to the session!'), content: Text('Hey!')); }),
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text(session.title)), body: buildBody());
  }
}
