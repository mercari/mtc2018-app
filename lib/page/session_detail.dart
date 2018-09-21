import 'package:flutter/material.dart';
import 'package:mtc2018_app/graphql/session.dart';
import 'package:mtc2018_app/graphql/speaker.dart';
import "package:intl/intl.dart";
import 'package:mtc2018_app/widget/social_user_button.dart';
import 'package:mtc2018_app/colors.dart';

class SessionDetailPage extends StatelessWidget {
  final Session session;

  const SessionDetailPage({
    Key key,
    this.session,
  }) : super(key: key);

  Widget buildBody(BuildContext context) {
    Locale currentLocale = Localizations.localeOf(context);
    var outline = currentLocale.languageCode == "ja"
        ? session.outlineJa
        : session.outline;

    return Container(
        margin: EdgeInsets.only(top: 20.0),
        child: ListView(children: <Widget>[
          Container(
              padding: const EdgeInsets.only(left: 20.0, right: 20.0),
              child: buildSummary(context)),
          Container(
              margin: const EdgeInsets.only(top: 30.0),
              padding: const EdgeInsets.only(left: 20.0, right: 20.0),
              color: Colors.white,
              child: buildContent(context, outline, session.speakers))
        ]));
  }

  Widget buildSummary(BuildContext context) {
    var formatter = DateFormat("HH:mm");
    var start = DateTime.parse(session.startTime).toLocal();
    var end = DateTime.parse(session.endTime).toLocal();

    var startTimeString = formatter.format(start);
    var endTimeString = formatter.format(end);
    var timeRangeString = "$startTimeString ~ $endTimeString";

    Locale currentLocale = Localizations.localeOf(context);
    var title =
        currentLocale.languageCode == "ja" ? session.titleJa : session.title;

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
                    child: Text(title,
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
            borderRadius: BorderRadius.circular(100.0),
            border: const Border(
              top: const BorderSide(width: 1.0, color: kMtcSecondaryRed),
              left: const BorderSide(width: 1.0, color: kMtcSecondaryRed),
              bottom: const BorderSide(width: 1.0, color: kMtcSecondaryRed),
              right: const BorderSide(width: 1.0, color: kMtcSecondaryRed),
            )),
        child: Text(tag, style: TextStyle(color: kMtcSecondaryRed)));
  }

  Widget buildContent(
      BuildContext context, String outline, List<Speaker> speakers) {
    return Container(
        padding: EdgeInsets.symmetric(vertical: 32.0, horizontal: 0.0),
        child: Column(children: [
          Container(
              padding: EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 24.0),
              child: Text(outline,
                  style: TextStyle(fontSize: 14.0, color: kMtcPrimaryGrey))),
          buildSpeakersInformation(context, speakers)
        ]));
  }

  Widget buildSpeakersInformation(
      BuildContext context, List<Speaker> speakers) {
    List<Widget> containers = speakers.map((speaker) {
      return buildSpeakerInformation(context, speaker);
    }).toList();
    return Container(
        decoration: BoxDecoration(
          color: kMtcAboutSectionBackgroundGrey,
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: Column(children: containers));
  }

  Widget buildSpeakerInformation(BuildContext context, Speaker speaker) {
    Locale currentLocale = Localizations.localeOf(context);
    var profile = currentLocale.languageCode == "ja"
        ? speaker.profileJa
        : speaker.profile;
    var name =
        currentLocale.languageCode == "ja" ? speaker.nameJa : speaker.name;
    var position = currentLocale.languageCode == "ja"
        ? speaker.positionJa
        : speaker.position;
    return Container(
        padding: EdgeInsets.all(24.0),
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                  margin: const EdgeInsets.only(bottom: 10.0),
                  child: Container(
                      child: ListTile(
                    contentPadding: const EdgeInsets.all(0.0),
                    leading: CircleAvatar(
                      backgroundImage: new NetworkImage(speaker.iconUrl),
                      radius: 25.0,
                    ),
                    title: Text(name,
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: kMtcPrimaryGrey)),
                    subtitle: Text(position,
                        style: TextStyle(color: kMtcPrimaryGrey)),
                  ))),
              Container(
                  margin: const EdgeInsets.only(bottom: 20.0),
                  child: Text(profile,
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(session.title),
          centerTitle: false,
        ),
        body: buildBody(context));
  }
}
