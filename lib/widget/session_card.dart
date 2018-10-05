import "package:flutter/material.dart";
import "package:intl/intl.dart";
import "package:mtc2018_app/colors.dart";
import 'package:mtc2018_app/localize.dart';
import "package:mtc2018_app/model/session.dart";
import "package:mtc2018_app/model/speaker.dart";

typedef void CardPressedCallback();
typedef void SpeakerPressedCallback(Speaker speaker);
typedef void TagPressedCallback(String tag);

class SessionCard extends StatelessWidget {
  final Session session;
  final CardPressedCallback onCardPressed;
  final SpeakerPressedCallback onSpeakerPressed;
  final TagPressedCallback onTagPressed;

  const SessionCard(
      {Key key,
      this.session,
      this.onCardPressed,
      this.onSpeakerPressed,
      this.onTagPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
        color: Colors.white,
        child: FlatButton(
            onPressed: onCardPressed,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                    padding: const EdgeInsets.only(
                        top: 24.0, left: 8.0, right: 8.0, bottom: 8.0),
                    child: buildSessionTimeRange(
                        session.startTime, session.endTime)),
                Container(
                    padding: const EdgeInsets.only(left: 8.0, right: 8.0),
                    child: buildSessionTitle(session
                        .localizedTitle(getCurrentLanguageCode(context)))),
                Container(
                    padding: const EdgeInsets.only(left: 8.0, right: 8.0),
                    child: buildSessionText(session
                        .localizedOutline(getCurrentLanguageCode(context)))),
                Container(
                    padding: const EdgeInsets.only(
                        left: 8.0, right: 8.0, bottom: 24.0),
                    child: buildSessionTags(session.tags)),
                Container(
                    padding: const EdgeInsets.only(bottom: 24.0),
                    child: buildSessionSpeakersInformation(
                        context, session.speakers))
              ],
            )));
  }

  Widget buildSessionTimeRange(String startTime, String endTime) {
    var start = DateTime.parse(startTime).toLocal();
    var end = DateTime.parse(endTime).toLocal();
    var formatter = DateFormat("HH:mm");

    var startTimeString = formatter.format(start);
    var endTimeString = formatter.format(end);
    var timeRangeString = "$startTimeString ~ $endTimeString";
    return Text(timeRangeString,
        style: TextStyle(
            fontWeight: FontWeight.bold, fontSize: 14.0, color: Colors.black));
  }

  Widget buildSessionTitle(String title) {
    return Container(
        child: Text(title,
            style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18.0,
                color: Colors.black)));
  }

  Widget buildSessionTags(List<String> tags) {
    List<Container> containers = tags.map((tag) {
      return buildSessionTag(tag);
    }).toList();
    return Container(child: Wrap(children: containers));
  }

  Container buildSessionTag(String tag) {
    return Container(
        margin: EdgeInsets.fromLTRB(0.0, 0.0, 4.0, 8.0),
        child: GestureDetector(
            onTap: () {
              onTagPressed(tag);
            },
            child: Container(
                padding: EdgeInsets.fromLTRB(8.0, 4.0, 12.0, 8.0),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100.0),
                    border: const Border(
                      top:
                          const BorderSide(width: 1.0, color: kMtcSecondaryRed),
                      left:
                          const BorderSide(width: 1.0, color: kMtcSecondaryRed),
                      bottom:
                          const BorderSide(width: 1.0, color: kMtcSecondaryRed),
                      right:
                          const BorderSide(width: 1.0, color: kMtcSecondaryRed),
                    )),
                child: Text(" # $tag",
                    style: TextStyle(color: kMtcSecondaryRed)))));
  }

  Widget buildSessionText(String text) {
    return Container(
        margin: const EdgeInsets.only(top: 8.0, bottom: 24.0),
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
    Locale currentLocale = Localizations.localeOf(context);
    var name =
        currentLocale.languageCode == "ja" ? speaker.nameJa : speaker.name;
    var position = currentLocale.languageCode == "ja"
        ? speaker.positionJa
        : speaker.position;

    return FlatButton(
        onPressed: () {
          onSpeakerPressed(speaker);
        },
        child: Container(
            decoration: BoxDecoration(
                border: Border(
                    top: BorderSide(width: 1.0, color: Color(0xFFDDDDDD)))),
            child: ListTile(
              contentPadding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
              leading: CircleAvatar(
                backgroundImage: new NetworkImage(speaker.iconUrl),
                radius: 25.0,
              ),
              title: Text(name,
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                      fontSize: 14.0)),
              subtitle: Text(position,
                  style: TextStyle(color: Colors.black, fontSize: 12.0)),
            )));
  }
}
