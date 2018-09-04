import 'package:flutter/material.dart';
import 'package:mtc2018_app/model/speaker.dart';
import 'package:mtc2018_app/widget/link_button.dart';
import '../colors.dart';

class SpeakerDetailPage extends StatelessWidget {
  final Speaker speaker;

  const SpeakerDetailPage({Key key, this.speaker}) : super(key: key);

  Widget buildBody() {
    return Container(
        margin: EdgeInsets.only(top: 20.0, bottom: 20.0),
        child: ListView(children: <Widget>[
          Card(
              color: Colors.white,
              child: Container(
                  margin: const EdgeInsets.only(bottom: 10.0),
                  padding: const EdgeInsets.only(
                      left: 20.0, right: 20.0, bottom: 12.0, top: 12.0),
                  child: buildSpeakerInformation()))
        ]));
  }

  Widget buildSpeakerInformation() {
    return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
              margin: const EdgeInsets.only(bottom: 10.0),
              child: buildSessionSpeakerInformation()),
          Container(
              margin: const EdgeInsets.only(bottom: 20.0),
              child: Text(speaker.profile,
                  style: TextStyle(color: kMtcPrimaryGrey))),
          buildLinkButtons(speaker)
        ]);
  }

  Widget buildLinkButtons(Speaker speaker) {
    var twitterId = speaker.twitterId;
    var githubId = speaker.githubId;
    var twitterLinkButton =
        LinkButton(title: "@$twitterId", url: "https://twitter.com/$twitterId");
    var githubLinkButton =
        LinkButton(title: "$githubId", url: "https://github.com/$githubId");

    return Container(
        padding: const EdgeInsets.all(0.0),
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [twitterLinkButton, githubLinkButton]));
  }

  Widget buildSessionSpeakerInformation() {
    return Container(
        child: ListTile(
      contentPadding: const EdgeInsets.all(0.0),
      // leading: const Icon(Icons.android, color: Colors.white, size: 40.0),
      title: Text(speaker.name,
          style:
              TextStyle(fontWeight: FontWeight.bold, color: kMtcPrimaryGrey)),
      subtitle:
          Text(speaker.position, style: TextStyle(color: kMtcPrimaryGrey)),
      // trailing: IconButton(icon: const Icon(Icons.favorite_border), color: Colors.black, onPressed: () { AlertDialog(title: Text('Go to the session!'), content: Text('Hey!')); }),
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text(speaker.name)), body: buildBody());
  }
}
