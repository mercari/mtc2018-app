import "package:flutter/material.dart";
import "package:mtc2018_app/model/session.dart";
import "package:mtc2018_app/model/speaker.dart";
import "package:intl/intl.dart";
import "package:mtc2018_app/widget/social_user_button.dart";
import "package:mtc2018_app/colors.dart";
import "package:mtc2018_app/repository/repository.dart";

class SessionDetailPage extends StatefulWidget {
  final Repository repository;
  final String sessionId;

  const SessionDetailPage({Key key, this.repository, this.sessionId})
      : super(key: key);

  @override
  _SessionDetailPageState createState() => _SessionDetailPageState();
}

class _SessionDetailPageState extends State<SessionDetailPage> {
  Session _session;

  @override
  void initState() {
    super.initState();
    _loadSession();
  }

  void _loadSession() async {
    final session = await widget.repository.getSessionById(widget.sessionId);
    if (this.mounted) {
      setState(() {
        _session = session;
      });
    }
  }

  Widget buildBody(BuildContext context) {
    Locale currentLocale = Localizations.localeOf(context);
    var outline = currentLocale.languageCode == "ja"
        ? _session.outlineJa
        : _session.outline;

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
              child: buildContent(context, outline, _session.speakers))
        ]));
  }

  Widget buildSummary(BuildContext context) {
    var formatter = DateFormat("HH:mm");
    var start = DateTime.parse(_session.startTime).toLocal();
    var end = DateTime.parse(_session.endTime).toLocal();

    var startTimeString = formatter.format(start);
    var endTimeString = formatter.format(end);
    var timeRangeString = "$startTimeString ~ $endTimeString";

    Locale currentLocale = Localizations.localeOf(context);
    var title =
        currentLocale.languageCode == "ja" ? _session.titleJa : _session.title;

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
                    child: buildSessionTags(_session.tags)),
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
    var githubId = speaker.githubId;
    var twitterId = speaker.twitterId;

    List<Widget> buttons = [];

    if (githubId != "") {
      buttons.add(SocialUserButton(
          title: "$githubId",
          type: SocialType.github,
          url: "https://github.com/$githubId"));
    }

    if (twitterId != "") {
      buttons.add(SocialUserButton(
          title: "@$twitterId",
          type: SocialType.twitter,
          url: "https://twitter.com/$twitterId"));
    }

    return Container(
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start, children: buttons));
  }

  @override
  Widget build(BuildContext context) {
    if (_session == null) {
      return Center(
        child: CircularProgressIndicator(),
      );
    }

    return Scaffold(
        appBar: AppBar(
          title: Text(_session.title),
          centerTitle: false,
        ),
        body: buildBody(context));
  }
}
