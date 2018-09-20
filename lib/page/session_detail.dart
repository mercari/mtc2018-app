import 'package:flutter/material.dart';
import 'package:mtc2018_app/model/session.dart';
import 'package:mtc2018_app/model/speaker.dart';
import "package:intl/intl.dart";
import 'package:mtc2018_app/widget/social_user_button.dart';
import '../colors.dart';

class SessionDetailPage extends StatelessWidget {
  final Session session;

  const SessionDetailPage({
    Key key,
    this.session,
  }) : super(key: key);

  Widget buildBody() {
    return Container(
        margin: EdgeInsets.only(top: 20.0),
        child: ListView(children: <Widget>[
          Container(
              padding: const EdgeInsets.only(left: 20.0, right: 20.0),
              child: buildSummary()),
          Container(
              margin: const EdgeInsets.only(top: 30.0),
              padding: const EdgeInsets.only(left: 20.0, right: 20.0),
              color: Colors.white,
              child: buildContent(session.outline, session.speakers))
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
        child: Container(
            color: kMtcBackgroundGrey,
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
              top: const BorderSide(width: 1.0, color: kMtcSecondaryRed),
              left: const BorderSide(width: 1.0, color: kMtcSecondaryRed),
              bottom: const BorderSide(width: 1.0, color: kMtcSecondaryRed),
              right: const BorderSide(width: 1.0, color: kMtcSecondaryRed),
            )),
        child: Text(tag, style: TextStyle(color: kMtcSecondaryRed)));
  }

  Widget buildContent(String outline, List<Speaker> speakers) {
    return Container(
        padding: EdgeInsets.symmetric(vertical: 32.0, horizontal: 0.0),
        child: Column(children: [
          Container(
              padding: EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 24.0),
              child: Text(outline,
                  style: TextStyle(fontSize: 14.0, color: kMtcPrimaryGrey))),
          buildSpeakersInformation(speakers)
        ]));
  }

  Widget buildSpeakersInformation(List<Speaker> speakers) {
    List<Widget> containers = speakers.map((speaker) {
      return buildSpeakerInformation(speaker);
    }).toList();
    return Container(
        decoration: BoxDecoration(
          color: kMtcAboutSectionBackgroundGrey,
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: Column(children: containers));
  }

  Widget buildSpeakerInformation(Speaker speaker) {
    return Container(
        padding: EdgeInsets.all(24.0),
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                  margin: const EdgeInsets.only(bottom: 10.0),
                  child: buildSessionSpeakerInformation(speaker)),
              Container(
                  margin: const EdgeInsets.only(bottom: 20.0),
                  child: Text(speaker.profile,
                      style:
                          TextStyle(color: kMtcPrimaryGrey, fontSize: 12.0))),
              buildLinkButtons(speaker)
            ]));
  }

  Widget buildLinkButtons(Speaker speaker) {
    var twitterId = speaker.twitterId;
    var githubId = speaker.githubId;
    var twitterLinkButton = SocialUserButton(
        title: "@$twitterId",
        type: SocialType.twitter,
        url: "https://twitter.com/$twitterId");
    var githubLinkButton = SocialUserButton(
        title: "$githubId",
        type: SocialType.github,
        url: "https://github.com/$githubId");

    return Container(
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [twitterLinkButton, githubLinkButton]));
  }

  Widget buildSessionSpeakerInformation(Speaker speaker) {
    return Container(
        child: ListTile(
      contentPadding: const EdgeInsets.all(0.0),
      leading: CircleAvatar(
        backgroundImage: new NetworkImage(speaker.iconUrl),
        radius: 25.0,
      ),
      title: Text(speaker.name,
          style:
              TextStyle(fontWeight: FontWeight.bold, color: kMtcPrimaryGrey)),
      subtitle:
          Text(speaker.position, style: TextStyle(color: kMtcPrimaryGrey)),
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text(session.title)), body: buildBody());
  }
}
