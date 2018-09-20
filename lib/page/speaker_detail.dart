import 'package:flutter/material.dart';
import 'package:mtc2018_app/model/speaker.dart';
import 'package:mtc2018_app/widget/social_user_button.dart';
import '../colors.dart';

class SpeakerDetailPage extends StatelessWidget {
  final Speaker speaker;

  const SpeakerDetailPage({Key key, this.speaker}) : super(key: key);

  Widget buildBody() {
    return Container(
        color: Colors.white,
        child: ListView(children: [
          Container(
            margin: EdgeInsets.symmetric(vertical: 32.0, horizontal: 24.0),
            child: buildSpeakerInformation(),
          )
        ]));
  }

  Widget buildSpeakerInformation() {
    return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
              margin: const EdgeInsets.only(bottom: 16.0),
              child: buildSessionSpeakerInformation()),
          Container(
              margin: const EdgeInsets.only(bottom: 24.0),
              child: Text(speaker.profile,
                  style: TextStyle(color: kMtcPrimaryGrey, fontSize: 14.0))),
          buildLinkButtons(speaker)
        ]);
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
        padding: const EdgeInsets.symmetric(vertical: 24.0, horizontal: 8.0),
        width: double.infinity,
        decoration: BoxDecoration(
          color: kMtcAboutSectionBackgroundGrey,
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [githubLinkButton, twitterLinkButton]));
  }

  Widget buildSessionSpeakerInformation() {
    return Container(
        child: ListTile(
      contentPadding: const EdgeInsets.all(0.0),
      leading: CircleAvatar(
        backgroundImage: new NetworkImage(speaker.iconUrl),
        radius: 25.0,
      ),
      title: Text(speaker.name,
          style: TextStyle(
              fontWeight: FontWeight.bold,
              color: kMtcPrimaryGrey,
              fontSize: 18.0)),
      subtitle: Text(speaker.position,
          style: TextStyle(color: kMtcPrimaryGrey, fontSize: 12.0)),
      // trailing: IconButton(icon: const Icon(Icons.favorite_border), color: Colors.black, onPressed: () { AlertDialog(title: Text('Go to the session!'), content: Text('Hey!')); }),
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text(speaker.name)), body: buildBody());
  }
}
